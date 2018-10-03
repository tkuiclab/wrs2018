#!/usr/bin/env python

"""Use to generate arm task and run."""

import os
import sys
import copy
import rospy
from arm_control import ArmTask, SuctionTask
from math import degrees


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
savePose1        = 14
savePose2       = 15
savePose3       = 16 
riceballEuler   = 17
rearSafetyPos2  = 18

lunchQuan = 2
drinkQuan = 2
riceQuan  = 2

objectName = ['lunchbox', 'lunchbox', 'lunchbox', 'lunchbox',
              'drink',    'drink',    'drink',    'drink',
              'riceball', 'riceball', 'riceball', 'riceball']

lunchboxPos = [[-0.425, -0.16, -0.64],
               [-0.425, -0.16, -0.69],
               [-0.425,  0.16, -0.64],
               [-0.425,  0.16, -0.69]]

drinkPos =    [[-0.185, -0.11, -0.645],
               [-0.29,  -0.11, -0.645],                   
               [-0.185, -0.21, -0.645],                              
               [-0.29,  -0.21, -0.645]]

riceballPos = [[-0.175,  0.2, -0.715],
               [-0.27,   0.2, -0.715],
               [-0.175,  0.1, -0.715],                             
               [-0.27,   0.1, -0.715]]

objectPos = [lunchboxPos, drinkPos, riceballPos]

topRight    = [0.4, -0.1, -0.2]
topLeft     = [0.4,  0.1, -0.2]
middleRight = [0.4, -0.1, -0.6]
middleLeft  = [0.4,  0.1, -0.6]
bottomRight = [0.5, -0.2, -1]
bottomLeft  = [0.5,  0.2, -1]

topRightEu    = [145, 45, -45]
topLeftEu     = [127, 60, -45]
middleRightEu = [0, 90,  30]
middleLeftEu  = [0, 90,  45]
bottomRightEu = [0, 90,  30]
bottomLeftEu  = [0, 90, -30]

topRightPhi    = -35 
topLeftPhi     = -35
middleRightPhi = 40
middleLeftPhi  = 40
bottomRightPhi = 25
bottomLeftPhi  = 25

topRightSuc   = -60.2 
topLeftSuc    = -51.6

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
        self.setQuantity()
        self.pickList = 0
        self.pos   = [0, 0, 0]
        self.euler = [0, 0, 0]
        self.phi   = 0
        self.sucAngle = 0
        if self.name == 'right':
            self.is_right = 1
        if self.name == 'left':
            self.is_right = -1
        if en_sim:
            self.suction = SuctionTask(self.name + '_gazebo')
        else:
            self.suction = SuctionTask(self.name)
        print objectName

    @property
    def finish(self):
        return self.pickList == self.pickListAll

    def setQuantity(self):
        for index in range(lunchQuan):
            objectName[index] = 'lunchboxXX'
        for index in range(drinkQuan):
            objectName[index+4] = 'drinkXX'
        for index in range(riceQuan):
            objectName[index+8] = 'riceballXX'

    def getRearSafetyPos(self):
        self.pos   = (0, -0.5*self.is_right, -0.5)
        self.euler = [90*self.is_right, -20, 30*self.is_right]
        self.phi   = -60*self.is_right

    def getFrontSafetyPos(self):
        self.pos   = (0.1, -0.4*self.is_right, -0.45)
        self.euler = (0, 0, 0*self.is_right)
        self.phi   = 45*self.is_right

    def getObjectPos(self):
        if self.finish:
            return
        while objectPos[self.pickList/4][self.pickList%4][1]*self.is_right > 0:
            self.pickList += 1
            if self.finish:
                return
        self.pos   = objectPos[self.pickList/4][self.pickList%4][:]
        self.euler = [180*self.is_right, 0, 0]
        self.phi   = -30*self.is_right

    def getPlacePos(self):
        if objectName[self.pickList] == 'lunchboxXX':
            self.pos   = bottomRight[:]
            self.euler = bottomRightEu[:]
            self.phi   = bottomRightPhi*self.is_right
        if objectName[self.pickList] == 'lunchbox':
            self.pos   = bottomLeft[:]
            self.euler = bottomLeftEu[:]
            self.phi   = bottomLeftPhi*self.is_right
        if objectName[self.pickList] == 'drinkXX':
            self.pos   = middleRight[:]
            self.euler = middleRightEu[:]
            self.phi   = middleRightPhi*self.is_right
        if objectName[self.pickList] == 'drink':
            self.pos   = middleLeft[:]
            self.euler = middleLeftEu[:]
            self.phi   = middleLeftPhi*self.is_right
        if objectName[self.pickList] == 'riceballXX':
            self.pos   = topRight[:]
            self.euler = topRightEu[:]
            self.phi   = topRightPhi*self.is_right
            self.sucAngle = topRightSuc
        if objectName[self.pickList] == 'riceball':
            self.pos   = topLeft[:]
            self.euler = topLeftEu[:]
            self.phi   = topLeftPhi*self.is_right
            self.sucAngle = topLeftSuc

    def proces(self):
        if self.name == 'left':
            print degrees(self.arm.get_joint().joint_value[4])
        if self.arm.is_stop:                                       # must be include in your strategy
            self.finish = True                                     # must be include in your strategy
            print "!!! Robot is stop !!!"                          # must be include in your strategy
            return                                                 # must be include in your strategy

        if self.state == idle:
            self.getObjectPos()
            if self.finish:
                return
            else:
                if 'riceball' in objectName[self.pickList] and self.pickList!=8:
                    self.state = savePose1
                else:
                    self.state = rearSafetyPos
                print "self.pickList = " + str(self.pickList)
        
        elif self.state == savePose1:
            self.state = busy
            self.nextState = savePose3
            fb = self.arm.get_fb()
            pos = fb.group_pose.position
            self.pos = (pos.x-0.1, pos.y, pos.z)
            self.euler = (0, 0, -85)
            self.arm.set_speed(30)
            self.arm.ikMove('p2p', self.pos, self.euler, self.phi)

        elif self.state == savePose2:
            self.state = busy
            self.nextState = savePose3
            self.arm.set_speed(30)
            self.arm.relative_move_pose('p2p', [0, 0.1, -0.1])

        elif self.state == savePose3:
            self.state = busy
            self.nextState = rearSafetyPos
            self.arm.set_speed(30)
            self.arm.jointMove(0, (0, -1, 0, 2, 0, -1, 0))

        elif self.state == initPose:
            self.state = busy
            self.nextState = idle
            self.arm.set_speed(30)
            self.arm.jointMove(0, (0, -1, 0, 1.57, 0, -0.57, 0))

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
            self.arm.set_speed(30)
            self.arm.ikMove('line', self.pos, self.euler, self.phi)

        elif self.state == rearSafetyPos2:
            self.state = busy
            self.nextState = move2Shelf
            self.getRearSafetyPos()
            self.euler[0] = -180
            self.arm.set_speed(30)
            self.arm.ikMove('line', self.pos, self.euler, self.phi)

        elif self.state == move2Bin:
            self.state = busy
            self.nextState = move2Object
            self.getObjectPos()
            self.pos[2] = -0.5
            self.euler[1] = -20
            self.arm.set_speed(30)
            self.arm.ikMove('line', self.pos, self.euler, self.phi)
 
        elif self.state == move2Shelf:
            self.state = busy
            if 'riceball' in objectName[self.pickList]:
                self.nextState = riceballEuler
            else:
                self.nextState = moveIn2Shelf
            self.getPlacePos()
            self.pos[2] += 0.1
            self.euler[0] = 0
            self.arm.set_speed(30)
            self.arm.noa_relative_pos('line', self.pos, self.euler, self.phi, suction_angle=0, n=0, o=0, a=-0.15)
            self.suction.gripper_suction_deg(-90)

        elif self.state == riceballEuler:
            self.state = busy
            self.nextState = moveIn2Shelf
            self.getPlacePos()
            self.arm.set_speed(30)
            self.arm.move_euler('line', self.euler)
            self.suction.gripper_suction_deg(self.sucAngle)
        
        elif self.state == moveIn2Shelf:
            self.state = busy
            self.nextState = move2PlacedPos
            self.getPlacePos()
            self.pos[2] += 0.1
            self.arm.set_speed(30)
            self.arm.ikMove('line', self.pos, self.euler, self.phi)

        elif self.state == leaveBin:
            self.state = busy
            self.nextState = rearSafetyPos2
            self.arm.set_speed(30)
            self.getObjectPos()
            self.pos[2] = -0.5
            # self.pos[0] += 0.02 
            # self.euler[1] = -30
            # self.euler[2] = 10*self.is_right
            self.arm.ikMove('line', self.pos, self.euler, self.phi)

        elif self.state == leaveShelf:
            self.state = busy
            self.nextState = idle
            self.arm.set_speed(30)
            if objectName[self.pickList] == 'riceballXX':
                self.arm.noa_move_suction('line', suction_angle=0, n=0.1, o=0, a=-0.2)
            else:
                self.arm.noa_move_suction('line', suction_angle=0, n=0.1, o=0, a=-0.1)
            # self.arm.relative_move_pose('line', [-0.3, 0, 0.1])
            self.pickList += 1
            self.suction.gripper_suction_deg(0)

        elif self.state == move2Object:
            self.state = busy
            self.nextState = pickObject
            self.getObjectPos()
            self.arm.set_speed(30)
            self.arm.ikMove('line', self.pos, self.euler, self.phi)

        elif self.state == move2PlacedPos:
            self.state = busy
            self.nextState = placeObject
            self.getPlacePos()
            self.arm.set_speed(30)
            self.arm.ikMove('line', self.pos, self.euler, self.phi)

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
   
