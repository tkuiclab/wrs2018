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



def disposing_vision_callback(msg):
    global x
    rospy.loginfo(rospy.get_caller_id() + "I heard %s", msg.x)
    x = msg.x
    print(x)

def listener():
    #rospy.init_node('disposing', anonymous=True)
    rospy.Subscriber("/object/normal", coordinate_normal, disposing_vision_callback)
    #rospy.spin()    

def start_callback(msg):
    global is_start
    if not is_start:
        is_start = msg.data

def Home_pub(msg):
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
    
def start_callback(msg):
    global is_start
    if not is_start:
        is_start = msg.data

def ROI_listener():
    #rospy.init_node('disposing', anonymous=True)
    rospy.Subscriber("/object/ROI", ROI, ROI_callback)
    #rospy.spin()  

def ROI_callback(msg):
    global class_name
    global score
    global x_min
    global x_Max
    global y_min
    global y_Max
    global roi_pos

    x_min= msg.x_min
    x_Max= msg.x_Max
    y_min= msg.y_min
    y_Max = msg.y_Max
    score = msg.score
    class_name = msg.class_name

    ROI_Pos = [class_name,score,x_min,x_Max,y_min,y_Max]
    #VisiontoArm(Vision_pos)
    #print (roi_pos[0])
    print (ROI_Pos[1])
    print (ROI_Pos[2])
    print (ROI_Pos[3])
    print (ROI_Pos[4])

    ROI_regulate(ROI_Pos)

def ROI_regulate(ROI_Pos):
    
    Img_Obj_x = (ROI_Pos[0]+ROI_Pos[1])/2
    Img_Obj_y = (ROI_Pos[1]+ROI_Pos[2])/2
    Img_Obj_Center = (Img_Obj_x,Img_Obj_y) 
    
    if Img_Obj_Center[0]<320 and Img_Obj_Center[1]>240:
        
        pos[0]+=0.01
        pos[1]-=0.01
    elif Img_Obj_Center[0]>320 and Img_Obj_Center[1]<240:
        pos[0]-=0.01
        pos[1]-=0.01
    elif Img_Obj_Center[0]<320 and Img_Obj_Center[1]<240:
        pos[0]+=0.01
        pos[1]+=0.01
    elif Img_Obj_Center[0]>320 and Img_Obj_Center[1]>240:      
        pos[0]-=0.01
        pos[1]+=0.01

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
    print 'Vision_pos',Vision_pos
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

        self.flag = False
        
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

    def getRearSafetyPos(self):
        if self.name == 'right':
            self.pos, self.euler, self.phi = (-0.1, -0.45, -0.45), (90, 0, 0), -30
        elif self.name == 'left':
            self.pos, self.euler, self.phi = (-0.1, 0.45, -0.45), (-90, 0, 0),  30

    def getSafetyPos(self):
        if self.name == 'right':
            self.pos, self.euler, self.phi = (0, 0.49, -0.36), (0, 0, 0), 0
        elif self.name == 'left':
            self.pos, self.euler, self.phi = (0, 0.49, -0.36), (0, 0, 0), 0

    def getShelfPos(self):
        ShelfPos = ([0, 0.73, -0.12])

        if self.name == 'right':
            self.pos, self.euler, self.phi = ShelfPos, (0, 0, 90), 0
        elif self.name == 'left':
            self.pos, self.euler, self.phi = ShelfPos, (0, 0, 90), 0

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

    """def ImgtoArmCmd(object):
    
        #DualArmCurrentPos
        rotation = ArmTask.euler2rotation()
        Arm_normal_x = rotation[0,0]
        Arm_normal_y = rotation[1,0]
        Arm_normal_z = rotation[2,0]

        coor_A = [x,y,z]
        coor_norA=[normal_x,normal_y,normal_z]
        VecA = -(coor_A[0]*coor_norA[0]+coor_A[1]*coor_norA[1]+coor_A[2]*coor_norA[2])
        
        powA = math.pow(coor_A[0],2)+ math.pow(coor_A[1],2)+math.pow(coor_A[2],2)
        disA = math.sqrt(powA)

        coor_B = [self.arm.get_fb().pos.x,self.arm.get_fb().pos.y,self.arm.get_fb().pos.z]
        coor_norB=[self.arm.get_fb().euler[0],self.arm.get_fb().euler[1],self.arm.get_fb().euler[2]]
        VecB = coor_B[0]*coor_norB[0]+coor_B[1]*coor_norB[1]+coor_B[2]*coor_norB[2]

        powB =  math.pow(coor_B[0],2)+ math.pow(coor_B[1],2)+math.pow(coor_B[2],2) 
        disB =  math.sqrt(powB)

        AXRot = math.acos((powA*powB)/(disA*disB))

        # Projection vector
        coor_C = [self.arm.get_fb().pos.x,self.arm.get_fb().pos.y,self.arm.get_fb().pos.z]
        coor_norC=[0,self.arm.get_fb().euler[1],self.arm.get_fb().euler[2]]
        VecC = coor_C[0]*coor_norC[0]+coor_C[1]*coor_norC[1]+coor_C[2]*coor_norC[2]

        powC =  math.pow(coor_C[0],2)+ math.pow(coor_C[1],2)+math.pow(coor_C[2],2) 
        disC =  math.sqrt(powC)

        ArmRoll= math.acos((powB*powC)/(disB*disC))

        ArmX = 0

        ArmY = 0

        ArmZ = 0

        return (ArmX,ArmY,ArmZ,ArmRoll,AXRot)"""
    
    def proces(self):
        if self.arm.is_stop:                                       # must be include in your strategy
            self.finish = True                                     # must be include in your strategy
            print "!!! Robot is stop !!!"                          # must be include in your strategy
            return                                                 # must be include in your strategy

        if self.state == idle:
            if self.finish:
                return
            else:
                self.state = SafetyPos
                #print "self.pick_list = " + str(self.pick_list)

        elif self.state == initPose:
            self.state = busy
            self.nextState = idle
            self.arm.set_speed(30)
            self.arm.jointMove(0, (0, 0, 0, 0, 0, 0, 0))
            self.suction.gripper_suction_deg(0)

        elif self.state == SafetyPos:
            self.state = busy
            self.getSafetyPos()
            self.arm.set_speed(90)
            #self.arm.jointMove(0, (0, -2.27, 0, 2.44, 0, 0, 0))
            self.arm.ikMove('p2p', self.pos, self.euler, self.phi)
            if self.flag == False:
                self.nextState = move2Shelf
            else:
                self.nextState = pickObject

        elif self.state == move2Shelf:
            self.state = busy
            self.nextState = moveIn2Shelf
            self.getShelfPos()
            self.arm.set_speed(90)
            self.arm.ikMove('p2p', self.pos, self.euler, self.phi)
            
        elif self.state == moveIn2Shelf:
            self.state = busy
            self.nextState = move2Object
            self.getShelfPos()
            #print("pos[2] type = ",type(self.pos))
            self.pos[1] += 0.13
            self.pos[2] -= 0.33
            self.arm.ikMove('line', self.pos, self.euler, self.phi)

        elif self.state == move2Object:
            self.state = busy
            self.arm.relative_move_pose('line', [0, 0, -0.05])
            self.nextState = pickObject
            self.flag = True
            #record position

        elif self.state == pickObject:
            #gripper_deg
            self.state = busy
            #self.arm.relative_move_pose('line', [0, 0.1, -0.1])
            #self.suction.gripper_suction_deg(0)
            #self.suction.gripper_vaccum_on()
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
    rospy.init_node('disposing')        #enable this node
    right = Task('right')               #Set up right arm controller
    left  = Task('left')                #Set up left arm controller
    rospy.sleep(0.3)
    is_start = False
    is_stop = False
    print 'is_start',is_start
    listener()
    start_sub()
    Status_pub(0)
    Status_pub(5)Status_pub(5)
    wheel_pub(11)
    print 'next pub'
    rate = rospy.Rate(30)  # 30hz
    while not rospy.is_shutdown()  and not is_stop:
        global is_start
        global x 
        if is_start:
            print x
            while not rospy.is_shutdown() and (not right.finish or not left.finish):
                left.proces()
                #right.proces()
                rate.sleep()
            is_start = False
            is_stop = True
            Home_pub(4)
            rospy.sleep(3)
        rate.sleep()
    rospy.spin()
    
   
