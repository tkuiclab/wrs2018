#!/usr/bin/env python

"""Use to generate arm task and run."""

import os
import sys
import rospy
import math
import numpy as np
from arm_control import ArmTask, SuctionTask
from std_msgs.msg import String, Float64, Bool, Int32
from disposing_vision.msg import coordinate_normal 
from yolov3_sandwich.msg import ROI
from geometry_msgs.msg import Twist

idle            = 0
busy            = 1
initPose        = 2
SafetyPos       = 3
rearSafetyPos   = 4
move2Bin        = 5
move2Shelf      = 6
moveIn2Shelf    = 7
leaveBin        = 8
leaveShelf      = 9
move2Object     = 10
move2PlacedPos  = 11
pickObject      = 12
placeObject     = 13
tracking        = 14
Action1         = 15


def start_callback(msg):
    global is_start
    if not is_start:
        is_start = msg.data

def Status_pub(msg):
    pub = rospy.Publisher(
        'scan_black/strategy_behavior',
        Int32,
        # latch=True,
        queue_size=1
    )
    if msg != 0:
        pub.publish(msg)

def start_sub():
    global is_start
    rospy.Subscriber(
        'scan_black/dualarm_start_1',
        Int32,
        start_callback,
        queue_size=1
    )

def wheel_pub():
    wheelpub = rospy.Publisher(
        'moyion/cmd_vel',
        Twist,
        queue_size=1)
    if msg != 0:
        wheelpub.publish(msg)



def ROI_listener():
    #rospy.init_node('disposing', anonymous=True)
    rospy.Subscriber("/object/ROI", ROI, ROI_callback)
    #rospy.spin()  

def ROI_callback(msg):
    global x
    global y
    global z
    global nx
    global ny
    global nz
    global Vision_pos

    x = msg.x
    y = msg.y
    z = msg.z
    nx = msg.normal_x
    ny = msg.normal_y
    nz = msg.normal_z


    Vision_pos = [x,y,z,nx,ny,nz]
    VisiontoArm(Vision_pos)
    # print(Vision_pos[0])
    # print(Vision_pos[1])
    # print(Vision_pos[2])


def listener():
    #rospy.init_node('disposing', anonymous=True)
    rospy.Subscriber("/object/normal", coordinate_normal, disposing_vision_callback)
    #rospy.spin()    

def disposing_vision_callback(msg):
    global x
    global y
    global z
    global nx
    global ny
    global nz
    global Vision_pos

    x = msg.x
    y = msg.y
    z = msg.z
    nx = msg.normal_x
    ny = msg.normal_y
    nz = msg.normal_z


    Vision_pos = [x,y,z,nx,ny,nz]
    VisiontoArm(Vision_pos)
    # print(Vision_pos[0])
    # print(Vision_pos[1])
    # print(Vision_pos[2])

def VisiontoArm(Vision_pos):
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
                            [      0      ,        1    ]])
 
    Mat_VecPos_ImgToBase = T0_7 * TransMat_EndToImg * Mat_nVec_Pos
    
    #print Mat_VecPos_ImgToBase

class Task:
    def __init__(self, _name = '/robotis'):
        """Initial object."""
        en_sim = False
        if len(sys.argv) >= 2:
            rospy.set_param('en_sim', sys.argv[1])
            en_sim = rospy.get_param('en_sim')
        # if en_sim:
        #     print en_sim
        #     return
        self.name = _name
        self.state = initPose
        self.nextState = idle
        self.arm = ArmTask(self.name + '_arm')
        self.pick_list = 2
        self.pos   = (0, 0, 0)
        self.euler = (0, 0, 0)
        self.phi   = 0
       
        if en_sim:
            self.suction = SuctionTask(self.name + '_gazebo')
            print "enable gazebo"
        else:
            self.suction = SuctionTask(self.name)
            print "0"
 
    @property
    
    def finish(self):
        return self.pick_list == 0

    def getObjectPos(self):
        lunchboxPos = [[-0.4, -0.15, -0.63],
                       [-0.4, -0.15, -0.68]]
        drinkPos = [[-0.4, 0.15, -0.63],
                    [-0.4, 0.15, -0.68]]
        if self.name == 'right':
            self.pos, self.euler, self.phi = lunchboxPos[2-self.pick_list], (90, 0, 0), -30
        elif self.name == 'left':
            self.pos, self.euler, self.phi = drinkPos[2-self.pick_list], (-90, 0, 0), 30
    
    def getPlacePos(self):
        lunchboxPos = [[-0.4, -0.15, -0.63],
                       [-0.4, -0.15, -0.68]]
        drinkPos = [[-0.4, 0.15, -0.63],
                    [-0.4, 0.15, -0.68]]
        #-0.3,0.1,-0.4,0,0,0,0 binpos
        if self.name == 'right':
            self.pos, self.euler, self.phi = lunchboxPos[2-self.pick_list], (90, 0, 0), -30
        elif self.name == 'left':
            self.pos, self.euler, self.phi = drinkPos[2-self.pick_list], (-90, 0, 0), 30

    def InitLeftArm(self):
        self.arm.set_speed(30)
        self.arm.jointMove(0, (0, 0, 0, 0, 0, 0, 0))
        self.suction.gripper_suction_deg(0)

    def getSafetyPos(self):
        if self.name == 'right':
            self.pos, self.euler, self.phi = (0, 0.49, -0.36), (0, 0, 0), 0
        elif self.name == 'left':
            self.pos, self.euler, self.phi = (0, 0.49, -0.36), (0, 0, 0), 0

    def getShelfPos(self):
        ShelfPos = ([0, 0.88, -0.48])
        #ShelfPos = ([0, 0.7, -0.51])
        if self.name == 'right':
            self.pos, self.euler, self.phi = ShelfPos, (180, 180, 90), 0
        elif self.name == 'left':
            self.pos, self.euler, self.phi = ShelfPos, (180, 180, 90), 0
            #self.pos, self.euler, self.phi = ShelfPos, (0, 0, 90), 0
    
    def getBinfPos(self):
        ShelfPos = ([-0.4, 0.2, -0.36])
        #ShelfPos = ([0, 0.7, -0.51])
        if self.name == 'right':
            self.pos, self.euler, self.phi = ShelfPos, (0, 0, 0), 0
        elif self.name == 'left':
            self.pos, self.euler, self.phi = ShelfPos, (0, 0, 0), 0

    def proces(self):
        flag = False
        if self.arm.is_stop:                                       # must be include in your strategy
            self.finish = True                                     # must be include in your strategy
            print "!!! Robot is stop !!!"                          # must be include in your strategy
            return                                                 # must be include in your strategy

        if self.state == idle:
            print 'Idle'
            if self.finish:
                print 'finish'
                return
            else:
                self.state = SafetyPos
                print 'next SafetyPos'
                #print "self.pick_list = " + str(self.pick_list)

        elif self.state == initPose:
            self.state = busy
            self.InitLeftArm()
            self.nextState = idle
        
        elif self.state == SafetyPos:
            self.state = busy
            self.getSafetyPos()
            self.arm.set_speed(90)
            #self.arm.jointMove(0, (0, -2.27, 0, 2.44, 0, 0, 0))
            self.arm.ikMove('p2p', self.pos, self.euler, self.phi)
            if flag == False:
                print 'flag=',flag
                self.nextState = move2Shelf
            else:
                print 'Next state = move2Bin'
                print 'flag=',flag
                self.nextState = move2Bin

        elif self.state == move2Shelf:
            print 'Now State : Move2Shelf'
            self.state = busy
            self.nextState = moveIn2Shelf
            self.getShelfPos()
            self.arm.set_speed(90)
            self.arm.ikMove('p2p', self.pos, self.euler, self.phi)

        elif self.state == moveIn2Shelf:
            print 'Now State : moveIn2Shelf'
            self.state = busy
            self.nextState = move2Object
            self.getShelfPos()
            #print("pos[2] type = ",type(self.pos))
            self.pos[1] += 0.12
            #self.pos[2] -= 0.33
            self.arm.ikMove('line', self.pos, self.euler, self.phi)

        elif self.state == move2Object:
            print 'Now State : move2Object'
            self.state = busy
            self.arm.relative_move_pose('line', [0, 0, -0.05])
            self.nextState = pickObject
            #record position

        elif self.state == pickObject:
            #gripper_deg
            self.state = busy
            #self.arm.relative_move_pose('line', [0, 0.1, -0.1])
            self.suction.gripper_suction_deg(0)
            self.suction.gripper_vaccum_on()
            self.nextState = move2Bin

        elif self.state == leaveShelf:
            self.state = busy
            self.arm.relative_move_pose('line', [0, -0.1, +0.1])
            self.nextState = SafetyPos
            flag = True
            print 'flag =',flag
       
        elif self.state == move2Bin:
            print 'Now state = move2Bin'
            self.state = busy
            self.getBinfPos()
            self.arm.ikMove('p2p', self.pos, self.euler, self.phi)
            self.nextState = move2PlacedPos

        elif self.state == move2PlacedPos:
            self.state = busy
            self.nextState = placeObject

        elif self.state == placeObject:
            self.state = busy
            self.nextState = leaveBin
            self.suction.gripper_vaccum_off()
        
        elif self.state == leaveBin:
            self.state = busy
            self.arm.set_speed(20)
            self.arm.relative_move_pose('line', [0, 0, -0.24])
            self.nextState = SafetyPos
            flag = True 

        elif self.state == busy:
            if self.arm.is_busy:
                return
            else:
                self.state = self.nextState

if __name__ == '__main__':
    global Vision_pos    
    rospy.init_node('disposing')        # enable this node
    left  = Task('left')                # Set up left arm controller
    rospy.sleep(0.3)
    is_start = False
    is_stop = False
    print 'is_start',is_start
    listener()                          # Open vision
    start_sub()
    Status_pub(0)
    print 'next pub'
    rate = rospy.Rate(30)               # 30hz
    while not rospy.is_shutdown()  and not is_stop:
        global is_start 
        if is_start:
            while not rospy.is_shutdown() and ( not left.finish):
                left.proces()
                rate.sleep()
            is_start = False
            is_stop = True
            Status_pub(4)
            rospy.sleep(3)
        rate.sleep()
    rospy.spin()
    
   
