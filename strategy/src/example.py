#!/usr/bin/env python

"""Use to generate arm task and run."""

import os
import sys
import rospy
from arm_control import ArmTask, SuctionTask
from std_msgs.msg import String, Float64, Bool, Int32

idle            = 0
busy            = 1
initPose        = 2
frontSafetyPos  = 3
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


def start_callback(msg):
    global is_start
    if not is_start:
        is_start = msg.data

def next_pub(msg):
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
        'scan_black/dualarm_start',
        Bool,
        start_callback,
        queue_size=1
    )
    
    

class exampleTask:
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
            print "aa"
        else:
            self.suction = SuctionTask(self.name)
            print "bb"

    @property
    def finish(self):
        return self.pick_list == 0

    def getRearSafetyPos(self):
        if self.name == 'right':
            self.pos, self.euler, self.phi = (-0.1, -0.45, -0.45), (90, 0, 0), -30
        elif self.name == 'left':
            self.pos, self.euler, self.phi = (-0.1, 0.45, -0.45), (-90, 0, 0),  30

    def getFrontSafetyPos(self):
        if self.name == 'right':
            self.pos, self.euler, self.phi = (0.1, -0.45, -0.45), (0, 20, 0), 45
        elif self.name == 'left':
            self.pos, self.euler, self.phi = (0.1, 0.45, -0.45), (0, 20, 0), -45

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
        lunchboxPos = [[0.5, -0.25, -0.54],
                       [0.5, -0.25, -0.49]]
        drinkPos = [[0.5, 0.25, -0.5],
                    [0.42, 0.25, -0.5]]
        if self.name == 'right':
            self.pos, self.euler, self.phi = lunchboxPos[2-self.pick_list], (0, 90, 0), 45
        elif self.name == 'left':
            self.pos, self.euler, self.phi = drinkPos[2-self.pick_list], (0, 90, 0), -45


    def proces(self):
        if self.arm.is_stop:                                       # must be include in your strategy
            self.finish = True                                     # must be include in your strategy
            print "!!! Robot is stop !!!"                          # must be include in your strategy
            return                                                 # must be include in your strategy

        if self.state == idle:
            if self.finish:
                return
            else:
                self.state = rearSafetyPos
                print "self.pick_list = " + str(self.pick_list)

        elif self.state == initPose:
            self.state = busy
            self.nextState = idle
            self.arm.set_speed(30)
            self.arm.jointMove(0, (0, -0.5, 0, 1, 0, -0.5, 0))
            self.suction.gripper_suction_deg(0)

        elif self.state == frontSafetyPos:
            self.state = busy
            self.nextState = move2Shelf
            self.getFrontSafetyPos()
            self.arm.set_speed(30)
            self.arm.ikMove('line', self.pos, self.euler, self.phi)           
            self.suction.gripper_suction_deg(-20)

        elif self.state == rearSafetyPos:
            self.state = busy
            self.nextState = move2Bin
            self.getRearSafetyPos()
            self.arm.ikMove('line', self.pos, self.euler, self.phi)

        elif self.state == move2Bin:
            self.state = busy
            self.nextState = move2Object
            self.getObjectPos()
            self.pos[2] += 0.2
            self.arm.ikMove('line', self.pos, self.euler, self.phi) 

        elif self.state == move2Shelf:
            self.state = busy
            self.nextState = moveIn2Shelf
            self.getPlacePos()
            self.pos[0] += -0.3
            self.pos[2] += 0.1
            self.arm.ikMove('line', self.pos, self.euler, self.phi)
            self.suction.gripper_suction_deg(-90)
        
        elif self.state == moveIn2Shelf:
            self.state = busy
            self.nextState = move2PlacedPos
            self.getPlacePos()
            self.pos[2] += 0.1
            self.arm.ikMove('line', self.pos, self.euler, self.phi)

        elif self.state == leaveBin:
            self.state = busy
            self.nextState = frontSafetyPos
            self.arm.set_speed(20)
            self.arm.relative_move_pose('line', [0, 0, 0.2])

        elif self.state == leaveShelf:
            self.state = busy
            self.nextState = idle
            self.arm.relative_move_pose('line', [-0.3, 0, 0.1])
            self.pick_list -= 1
            self.suction.gripper_suction_deg(0)

        elif self.state == move2Object:
            self.state = busy
            self.nextState = pickObject
            self.arm.relative_move_pose('line', [0, 0, -0.2])

        elif self.state == move2PlacedPos:
            self.state = busy
            self.nextState = placeObject
            self.arm.relative_move_pose('line', [0, 0, -0.1])

        elif self.state == pickObject:
            self.state = busy
            self.nextState = leaveBin
            self.suction.gripper_vaccum_on()
            
        elif self.state == placeObject:
            self.state = busy
            self.nextState = leaveShelf
            self.suction.gripper_vaccum_off()

        elif self.state == busy:
            if self.arm.is_busy:
                return
            else:
                self.state = self.nextState
            
if __name__ == '__main__':
    rospy.init_node('example')        #enable this node
    right = exampleTask('right')      #Set up right arm controller
    left  = exampleTask('left')       #Set up left arm controller
    rospy.sleep(0.3)
    is_start = False
    is_stop = False
    print is_start
    start_sub()
    next_pub(0)
    print 'aaaa'
    rate = rospy.Rate(30)  # 30hz

    # R_Pos   = [0.3, -0.3006, -0.46]
    # R_Euler = [5.029, 82.029, 4.036]
    # R_Redun = 60
        
    # L_Pos   = [0.3, 0.3506, -0.46]
    # L_Euler = [5.029, 82.029, 4.036]
    # L_Redun = -60

    # right.arm.ikMove('line', R_Pos, R_Euler, R_Redun)
    # left.arm.ikMove('line', L_Pos, L_Euler, L_Redun)


    while not rospy.is_shutdown()  and not is_stop:
        global is_start
        if is_start:
            while not rospy.is_shutdown() and (not right.finish or not left.finish):
                left.proces()
                right.proces()
                rate.sleep()
            is_start = False
            is_stop = True
            next_pub(3)
            rospy.sleep(3)
        rate.sleep()
        # rospy.spin()
    
   
