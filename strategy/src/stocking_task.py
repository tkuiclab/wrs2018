#!/usr/bin/env python

"""Use to generate arm task and run."""

import os
import sys
import copy
import rospy
from arm_control import ArmTask, SuctionTask


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

objectName = ('lunchbox', 'lunchbox', 'lunchbox', 'lunchbox',
              'drink',    'drink',    'drink',    'drink',
              'riceball', 'riceball', 'riceball', 'riceball')

lunchboxPos = [[-0.425, -0.16, -0.64],
               [-0.425, -0.16, -0.69],
               [-0.425,  0.16, -0.64],
               [-0.425,  0.16, -0.69]]

drinkPos =    [[-0.165, -0.11, -0.645],
               [-0.27,  -0.11, -0.645],                   
               [-0.165, -0.21, -0.645],                              
               [-0.27,  -0.21, -0.645]]

riceballPos = [[-0.155,  0.2, -0.715],
               [-0.25,   0.2, -0.715],
               [-0.155,  0.1, -0.715],                             
               [-0.25,   0.1, -0.715]]

objectPos = [lunchboxPos, drinkPos, riceballPos]

topRight    = [0.4, -0.1, -0.15]
topLeft     = [0.4,  0.1, -0.15]
middleRight = [0.4, -0.1, -0.52]
middleLeft  = [0.4,  0.1, -0.52]
bottomRight = [0.5, -0.2, -1]
bottomLeft  = [0.5,  0.2, -1]

class exampleTask:
    def __init__(self, _name = '/robotis'):
        """Initial object."""
        en_sim = False
        if len(sys.argv) >= 2:
            rospy.set_param('en_sim', sys.argv[1])
            en_sim = rospy.get_param('en_sim')
        self.name = _name
        self.state = initPose
        self.nextState = idle
        self.arm = ArmTask(self.name + '_arm')
        self.pickListAll = len(lunchboxPos) + len(riceballPos) + len(drinkPos)
        self.pickList = 0
        self.pos   = (0, 0, 0)
        self.euler = (0, 0, 0)
        self.phi   = 0
        if self.name == 'right':
            self.is_right = 1
        if self.name == 'left':
            self.is_right = -1
        if en_sim:
            self.suction = SuctionTask(self.name + '_gazebo')
        else:
            self.suction = SuctionTask(self.name)

    @property
    def finish(self):
        return self.pickList == self.pickListAll

    def getRearSafetyPos(self):
        self.pos, self.euler, self.phi = (0, -0.55*self.is_right, -0.45), (90*self.is_right, -20, 0), -60*self.is_right

    def getFrontSafetyPos(self):
        self.pos, self.euler, self.phi = (0.1, -0.45*self.is_right, -0.45), (0, 20, 0), 45*self.is_right

    def getObjectPos(self):
        while objectPos[self.pickList/4][self.pickList%4][1]*self.is_right > 0:
            self.pickList += 1
            if self.finish:
                return
        self.pos, self.euler, self.phi = copy.deepcopy(objectPos[self.pickList/4][self.pickList%4]), [90*self.is_right, 0, 0], -30*self.is_right

    def getPlacePos(self):
        lunchboxPos = [[0.5, -0.25, -0.54],
                       [0.5, -0.25, -0.49]]
        drinkPos = [[0.5, 0.25, -0.5],
                    [0.42, 0.25, -0.5]]
        if self.name == 'right':
            self.pos, self.euler, self.phi = lunchboxPos[0], (0, 90, 0), 45
        elif self.name == 'left':
            self.pos, self.euler, self.phi = drinkPos[0], (0, 90, 0), -45


    def proces(self):
        if self.arm.is_stop:                                       # must be include in your strategy
            self.finish = True                                     # must be include in your strategy
            print "!!! Robot is stop !!!"                          # must be include in your strategy
            return                                                 # must be include in your strategy

        if self.state == idle:
            self.getObjectPos()
            if self.finish:
                return
            else:
                self.state = rearSafetyPos
                print "self.pickList = " + str(self.pickList)

        elif self.state == initPose:
            self.state = busy
            self.nextState = idle
            self.arm.set_speed(100)
            self.arm.jointMove(0, (0, -0.5, 0, 1, 0, -0.5, 0))
            self.suction.gripper_suction_deg(0)

        elif self.state == frontSafetyPos:
            self.state = busy
            self.nextState = move2Shelf
            self.getFrontSafetyPos()
            self.arm.set_speed(100)
            self.arm.ikMove('line', self.pos, self.euler, self.phi)           
            self.suction.gripper_suction_deg(-20)

        elif self.state == rearSafetyPos:
            self.state = busy
            self.nextState = move2Bin
            self.getRearSafetyPos()
            self.arm.set_speed(30)
            self.arm.ikMove('line', self.pos, self.euler, self.phi)

        elif self.state == move2Bin:
            self.state = busy
            self.nextState = move2Object
            self.getObjectPos()
            self.pos[2] += 0.15
            self.euler[1] = -20
            self.arm.ikMove('line', self.pos, self.euler, self.phi)
            self.arm.set_speed(100)
 

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
            self.arm.set_speed(100)
            self.getObjectPos()
            self.pos[2] += 0.15
            self.euler[1] = -20
            self.arm.ikMove('line', self.pos, self.euler, self.phi)

        elif self.state == leaveShelf:
            self.state = busy
            self.nextState = idle
            self.arm.relative_move_pose('line', [-0.3, 0, 0.1])
            self.pickList += 1
            self.suction.gripper_suction_deg(0)

        elif self.state == move2Object:
            self.state = busy
            self.nextState = pickObject
            self.getObjectPos()
            self.arm.ikMove('line', self.pos, self.euler, self.phi)

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

    rate = rospy.Rate(30)  # 30hz
    while not rospy.is_shutdown() and (not right.finish or not left.finish):
        left.proces()
        right.proces()
        rate.sleep()
   
