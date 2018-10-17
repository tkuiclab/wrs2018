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
    rospy.loginfo(rospy.get_caller_id() + "I heard %s", msg.y)

def listener():
    #rospy.init_node('disposing', anonymous=True)
    rospy.Subscriber("/object/normal", coordinate_normal, disposing_vision_callback)
    rospy.spin()    

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
            self.arm.relative_move_pose('line', [0, 0.1, -0.1])
            self.nextState = move2Bin 
            self.suction.gripper_suction_deg(0)
            self.suction.gripper_vaccum_on()

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
 #   listener()
    start_sub()
    Home_pub(0)
    print 'next pub'
    rate = rospy.Rate(30)  # 30hz

    while not rospy.is_shutdown()  and not is_stop:
        global is_start
        if is_start:
            while not rospy.is_shutdown() and (not right.finish or not left.finish):
                left.proces()
                #right.proces()
                rate.sleep()
            is_start = False
            is_stop = True
            Home_pub(4)
            rospy.sleep(3)
        rate.sleep()
        # rospy.spin()
    
   
