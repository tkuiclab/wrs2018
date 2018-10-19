#!/usr/bin/env python

"""Use to generate arm task and run."""

import os
import sys
import copy
import time
from math import radians, degrees, sin, cos, pi, acos, asin
import numpy as np
import rospy
from std_msgs.msg import Bool, Int32, String
from arm_control import ArmTask, SuctionTask
from disposing_vision.msg import coordinate_normal
from yolov3_sandwich.msg import ROI
from geometry_msgs.msg import Twist

SPEED = 1000

QRCODEPOS = (0.06, 0.4, -0.45)

idle              = 0
busy              = 1
initPose          = 2
frontSafetyPos    = 3
rearSafetyPos     = 4
move2CamPos1      = 10
move2CamPos2      = 11
move2CamPos3      = 12
move2CamPos4      = 13
startCam          = 20
moveCam           = 22
watch             = 24
move2Object1      = 30
move2Object2      = 31
move2Object3      = 32
move2Object4      = 33
pickObject        = 34
grasping          = 35
leaveShelfTop1    = 40
leaveShelfTop2    = 41
leaveShelfTop3    = 42
leaveShelfTop4    = 43
move2QRcode       = 50
checkDate         = 51
move2Shelf1       = 60
move2Shelf2       = 62
move2Shelf3       = 63
move2Shelf4       = 64
move2PlacePos     = 65
PlaceObject       = 66
PlaceObject1      = 67
leaveShelfMiddle1 = 70
leaveShelfMiddle2 = 71
leaveShelfMiddle3 = 72
leaveShelfMiddle4 = 73
move2Bin1         = 80
leaveBin1         = 90

class disposingTask:
    def __init__(self, _name = '/robotis'):
        """Initial object."""
        self.en_sim = False
        self.__set_pubsub()
        if len(sys.argv) >= 2:
            print(type(sys.argv[1]))
            if sys.argv[1] == 'True':
                rospy.set_param('self.en_sim', sys.argv[1])
                self.en_sim = rospy.get_param('self.en_sim')
        self.name = _name
        self.state = initPose
        self.nowState = initPose 
        self.nextState = idle
        self.reGripCnt = 0
        self.pickList = 0
        self.pickListAll = 8
        self.arm = ArmTask(self.name + '_arm')
        self.pos   = [0, 0, 0]
        self.euler = [0, 0, 0]
        self.phi   = 0
        self.sucAngle = 0
        self.sandwitchPos = [0, 0, 0]
        self.sandwitchEu  = [0, 0, 0]
        self.sandwitchSuc = 0
        self.sandwitchVec = [0, 0, 0]
        self.camMovePos = [0, 0]
        self.Qrcode     = ''

        self.ROI_Pos = [0, 0, 0, 0]
        self.Vision_pos = [0, 0, 0, 0, 0, 0]
        if self.name == 'right':
            self.is_right = 1
        if self.name == 'left':
            self.is_right = -1
        if self.en_sim:
            self.suction = SuctionTask(self.name + '_gazebo')
        else:
            self.suction = SuctionTask(self.name)
            rospy.on_shutdown(self.suction.gripper_vaccum_off)

    def __set_pubsub(self):
        self.__realsense_sub = rospy.Subscriber(
            '/object/normal',
            coordinate_normal,
            self.disposing_vision_callback,
            queue_size=2
        )
        self.__ROI_sub = rospy.Subscriber(
            '/object/ROI',
            ROI,
            self.ROI_callback,
            queue_size=2
        )
        self.__Qrcode_sub =  rospy.Subscriber(
            '/barcode',
            String,
            self.Qrcode_callback,
            queue_size=5
        ) 
        #pub 2
        self.mobileStade_pub = rospy.Publisher(
            '/scan_black/strategy_behavior',
            Int32,
            queue_size=2
        )
        self.moveWheel_pub = rospy.Publisher(
            '/motion/cmd_vel',
            Twist,
            queue_size=1
        )


    def ROI_callback(self, msg):
        self.ROI_Pos = [msg.x_min,msg.x_Max,msg.y_min,msg.y_Max]

    def Qrcode_callback(self, msg):
        self.Qrcode = msg.data

    def ROI_regulate(self):
        Img_Obj_x = (self.ROI_Pos[0]+self.ROI_Pos[1])/2
        Img_Obj_y = (self.ROI_Pos[2]+self.ROI_Pos[3])/2
        # Img_Obj_Center = (Img_Obj_x,Img_Obj_y) 

        if Img_Obj_x < 310:
            self.camMovePos[0] = -1
        elif Img_Obj_x > 330:
            self.camMovePos[0] = 1
        else:
            self.camMovePos[0] = 0

        if Img_Obj_y < 230:
            self.camMovePos[0] = 1
        elif Img_Obj_y > 250:
            self.camMovePos[0] = -1
        else:
            self.camMovePos[0] = 0
            

        
        # if Img_Obj_Center[0]<320 and Img_Obj_Center[1]>240:
        #     self.camMovePos[0]+=0.01
        #     self.camMovePos[1]-=0.01
        # elif Img_Obj_Center[0]>320 and Img_Obj_Center[1]<240:
        #     self.camMovePos[0]-=0.01
        #     self.camMovePos[1]-=0.01
        # elif Img_Obj_Center[0]<320 and Img_Obj_Center[1]<240:
        #     self.camMovePos[0]+=0.01
        #     self.camMovePos[1]+=0.01
        # elif Img_Obj_Center[0]>320 and Img_Obj_Center[1]>240:      
        #     self.camMovePos[0]-=0.01
        #     self.camMovePos[1]+=0.01

    # def ROI_listener():
    #     #rospy.init_node('disposing', anonymous=True)
    #     rospy.Subscriber("/object/ROI", ROI, ROI_callback)

    # def listener(self):
    #     rospy.Subscriber("/object/normal", coordinate_normal, disposing_vision_callback)

    def disposing_vision_callback(self, msg):
        # global x
        # global y
        # global z
        # global nx
        # global ny
        # global nz
        # global Vision_pos

        # x = msg.x
        # y = msg.y
        # z = msg.z
        # nx = msg.normal_x
        # ny = msg.normal_y
        # nz = msg.normal_z

        self.Vision_pos = [msg.x,msg.y,msg.z,msg.normal_x,msg.normal_y,msg.normal_z]
        print 'Vision_pos',Vision_pos
        # VisiontoArm(Vision_pos)

    def VisiontoArm(self):
        Img_Pos = np.mat([[Vision_pos[0]],[Vision_pos[1]],[Vision_pos[2]],[1]])
        Img_nVec = np.mat([[Vision_pos[3]],[Vision_pos[4]],[Vision_pos[5]],[0]])

        Img_PosForMove = Img_Pos + 0.08 * Img_nVec # unit vector (n-vector): 8 cm (for object catch)

        dx = 0      # unit:meter
        dy = -0.055 # unit:meter
        dz = -0.12  # unit:meter   
        
        TransMat_EndToImg = np.mat([[-1,0,0,dx],[0,0,-1,dy],[0,-1,0,dz],[0,0,0,1]])
        
        ori = left.arm.get_fb().orientation
        T0_7 = np.identity(4)
        for i in range(0,4):
            for j in range(0,4):
                T0_7[i][j] = ori[i*4+j]

        Mat_nVec_Pos = np.mat([ [Img_nVec[0,0], Img_PosForMove[0,0]],
                                [Img_nVec[1,0], Img_PosForMove[1,0]],
                                [Img_nVec[2,0], Img_PosForMove[2,0]],
                                [      0      ,        1          ]])
    
        Mat_VecPos_ImgToBase = T0_7 * TransMat_EndToImg * Mat_nVec_Pos
        self.sandwitchPos = Mat_VecPos_ImgToBase[0:3, 3]
        self.sandwitchVec = Mat_VecPos_ImgToBase[0:3, 2]


    @property
    def finish(self):
        return self.pickList == self.pickListAll

    def getPlacePos(self):
        self.pos = [0, 0.7, -0.8]
        self.euler = [-90, 0, 60]
        self.phi = -30
        self.sucAngle = 0

    def move_to_vector_point(self, pos, vector=[1,0,0]): # This funthion will move arm and return suction angle 
    # Only for left arm Euler (0 0 30)
        goal_vec = [0, 0, 0]
        goal_vec[0], goal_vec[1], goal_vec[2] = -vector[0], -vector[1], -vector[2]
        a = 0.866
        b = 0.5
        x, y, z = goal_vec[0], goal_vec[1], goal_vec[2]
        roll_angle = 0.0
        suc_angle = -acos(round((b*y - a*z) / (a*a + b*b), 4)) 
        roll_angle_c = acos(round(x / sin(suc_angle), 4))
        roll_angle_s = asin(round(-(a*y + b*z)/((a*a + b*b) * sin(suc_angle)), 4))
        if (roll_angle_c*roll_angle_s) >= 0:
            roll_angle = roll_angle_c
        else:
            roll_angle = -roll_angle_c

        pos[0] += vector[0]*0.065
        pos[1] += vector[1]*0.065
        pos[2] += vector[2]*0.065
        euler = self.sandwitchEu
        euler[0] = degrees(roll_angle)
        euler[1] = 0
        euler[2] = 30
        self.sandwitchPos = pos
        self.sandwitchEu  = euler
        self.sandwitchSuc = degrees(suc_angle)

    @property
    def finish(self):
        return self.pickList == self.pickListAll

    def process(self): 
        if self.arm.is_stop:                                       # must be include in your strategy 
            self.finish = True                                     # must be include in your strategy 
            print "!!! Robot is stop !!!"                          # must be include in your strategy 
            self.suction.gripper_vaccum_off()                      # must be include in your strategy 
            return                                                 # must be include in your strategy 
 
        if self.state == idle: 
            if self.finish: 
                return 
            else: 
                self.state = move2CamPos1 
                 
         
        elif self.state == busy: 
            if self.arm.is_busy: 
                return 
            else: 
                self.state = self.nextState 
                self.nowState = self.nextState 
                return 
 
        elif self.state == initPose:
            self.state = busy
            self.nextState = move2CamPos1 
            self.suction.gripper_suction_deg(0)

        elif self.state == move2CamPos1:
            self.state = busy
            self.nextState = move2CamPos2
            pos = (0, 0.5, -0.3)
            euler = (0, 0, -30)
            phi = 0
            self.arm.ikMove('p2p', pos, euler, phi)
            self.suction.gripper_suction_deg(0)

        elif self.state == move2CamPos2:
            self.state = busy
            self.nextState = moveCam
            pos = (0, 0.86, -0.22)
            euler = (0, 0, 90)
            phi = 0
            self.arm.ikMove('line', pos, euler, phi)


        elif self.state == moveCam:
            self.mobileStade_pub.publish(5)

            self.ROI_regulate()
            wheelCmd = Twist()
            self.arm.set_speed(10)

            if self.camMovePos[0] == 0 and self.camMovePos[1] == 0:
                wheelCmd.linear.x = 0
                wheelCmd.linear.y = 0
                self.arm.clear_cmd()
                self.moveWheel_pub.publish(wheelCmd)
                rospy.sleep(.1)
                self.state = watch
                self.moveWheel_pub.publish(wheelCmd)
                self.mobileStade_pub.publish(2)
            else:
                wheelCmd.linear.x = 12 * camMovePos[0]
                wheelCmd.linear.y = 0
                self.moveWheel_pub.publish(wheelCmd)
                if not self.arm.is_busy and self.camMovePos[1] != 0:
                    pos_y = 0.1 * self.camMovePos[1]
                    self.arm.relative_move_pose('line', [0 ,pos_y , 0])
                if self.camMovePos[1] == 0:
                    self.arm.clear_cmd()
                    rospy.sleep(.1)

        elif self.state == watch:
            self.state = move2Object1
            self.VisiontoArm()
            self.move_to_vector_point(self.sandwitchPos, self.sandwitchVec)

        elif self.state == move2Object1:
            self.state = busy
            self.nextState = move2Object2
            pos = self.sandwitchPos[:]
            pos[2] = -0.3
            phi = -30
            self.arm.set_speed(SPEED)
            self.arm.ikMove('line', pos, self.sandwitchEu, phi)
            self.suction.gripper_suction_deg(self.sandwitchSuc)

        elif self.state == move2Object2:
            self.state = busy
            self.nextState = pickObject
            self.phi = -30
            self.arm.set_speed(SPEED)
            self.arm.noa_relative_pos('line', self.sandwitchPos, self.sandwitchEu, self.phi, self.sandwitchSuc, n=0, o=0, a=-0.05)

        elif self.state == pickObject:
            self.state = grasping
            self.suction.gripper_vaccum_on()
            self.arm.set_speed(20)
            self.arm.noa_move_suction('line', self.sandwitchSuc, n=0, o=0, a=0.1)
            rospy.sleep(.1)

        elif self.state == grasping:
            if self.suction.is_grip:
                self.arm.clear_cmd()
                rospy.sleep(.1)
                self.state = busy
                self.nextState = leaveShelfTop1
                self.reGripCnt = 0
            elif not self.arm.is_busy:
                if self.en_sim:
                    self.state = busy
                    self.nextState = leaveShelfTop1
                else:
                    self.state = missObj

        elif self.state == leaveShelfTop1:
            self.state = busy
            self.nextState = leaveShelfTop2
            self.arm.set_speed(SPEED)
            self.arm.relative_move_pose('line', [0, 0, 0.1])

        elif self.state == leaveShelfTop2:
            self.state = busy
            self.nextState = move2QRcode
            pos = (0.06, 0.55, -0.3)
            euler = (0, 0, 0)
            phi = 0
            self.arm.ikMove('line', pos, euler, phi)
            self.suction.gripper_suction_deg(0)

        elif self.state == move2QRcode:
            self.state = busy
            self.nextState = checkDate
            pos = QRCODEPOS
            euler = (0, 0, 0)
            phi = 0
            self.arm.ikMove('p2p', pos, euler, phi)

        elif self.state == checkDate:
            if self.pickList%2:
                self.state = rearSafetyPos
            else:
                self.state = move2Shelf1

        elif self.state == frontSafetyPos:
            self.state = busy
            self.nextState = move2Shelf1
            pos   = [0, 0.5, -0.5]
            euler = [-90, 0, 30]
            phi   = 0
            self.arm.ikMove('line', pos, euler, phi)

        elif self.state == rearSafetyPos:
            self.state = busy
            self.nextState = move2Bin1
            pos   = [0, 0.4, -0.5]
            euler = [90, -20, -30]
            phi   = 60
            self.arm.ikMove('line', pos, euler, phi)

        elif self.state == move2Shelf1:
            self.state = busy
            self.nextState = move2Shelf2 
            self.getPlacePos()
            self.pos[2] += 0.05
            self.arm.set_speed(SPEED)
            self.arm.noa_relative_pos('line', self.pos, self.euler, self.phi, self.sucAngle, n=0, o=0, a=-0.05)

        elif self.state == move2Shelf2:
            self.state = busy
            self.nextState = PlaceObject
            self.getPlacePos()
            self.pos[0] -= 0.05
            self.arm.ikMove('line', self.pos, self.euler, self.phi)

        elif self.state == leaveShelfMiddle1:
            self.state = busy
            self.nextState = idle 
            self.getPlacePos()
            self.pos[0] -= 0.05
            self.arm.set_speed(SPEED)
            self.arm.noa_relative_pos('line', self.pos, self.euler, self.phi, self.sucAngle, n=0, o=0, a=-0.1)
            self.pickList += 1

        elif self.state == move2Bin1:
            self.state = busy
            self.nextState = PlaceObject1
            pos = (-0.3, 0.2, -0.45)
            euler = (90, -30, -30)
            phi = 60
            self.arm.ikMove('line', pos, euler, phi)

        elif self.state == leaveBin1:
            self.state = busy
            self.nextState = idle
            pos   = [0, 0.5, -0.5]
            euler = [90, -20, -30]
            phi   = 60
            self.arm.ikMove('line', pos, euler, phi)

        elif self.state == PlaceObject:
            self.state = leaveShelfMiddle1
            self.suction.gripper_vaccum_off()

        elif self.state == PlaceObject1:
            self.state = idle
            self.pickList += 1
            self.suction.gripper_vaccum_off()

        # elif self.state == :

def start_callback(msg):
    global is_start
    if msg.data == 2 and not is_start:
        is_start = True


if __name__ == '__main__':
    rospy.init_node('disopssing')        # enable this node

    is_start = False
    rospy.Subscriber(
        'scan_black/dualarm_start_1',
        Int32,
        start_callback,
        queue_size=1
    )
    pub = rospy.Publisher(
        'scan_black/strategy_behavior',
        Int32,
        queue_size=1
    )

    left  = disposingTask('left')       # Set up left arm controller
    rospy.sleep(.3)

    while not rospy.is_shutdown() and not is_start:
        rospy.loginfo('waiting for start signal')
        rospy.sleep(.5)
    
    SuctionTask.switch_mode(True)

    rate = rospy.Rate(30)  # 30hz
    while not rospy.is_shutdown() and not left.finish:
        left.process()
        rate.sleep()

    # robot arm back home
    if left.arm.is_stop is not True:
        rospy.loginfo('back home')
        left.arm.wait_busy()
        left.arm.jointMove(0, (0, -1, 0, 2, 0, -0.7, 0))

        left.arm.wait_busy()
        left.arm.jointMove(0, (0, 0, 0, 0, 0, 0, 0))

    SuctionTask.switch_mode(False)
    # publish finish signal to wheels
    pub.publish(3)
        