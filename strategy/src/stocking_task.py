#!/usr/bin/env python

"""Use to generate arm task and run."""

import os
import sys
import copy
from math import degrees

import rospy
from std_msgs.msg import Bool, Int32
from arm_control import ArmTask, SuctionTask


PICKORDER = 0
SPEED     = 30
LUNCHBOX_H = 0.05

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
safePose1       = 14
safePose2       = 15
safePose3       = 16 
riceballEuler   = 17
rearSafetyPos2  = 18
leavePlacePos   = 19

# The lesser one
lunchQuan = 1              
drinkQuan = 1
riceQuan  = 1

objectName = ['lunchbox', 'lunchbox', 'lunchbox', 'lunchbox',
              'drink',    'drink',    'drink',    'drink',
              'riceball', 'riceball', 'riceball', 'riceball']

lunchboxPos = [[-0.424,  0.16, -0.695],
               [-0.424,  0.16, -0.695],
               [-0.424,  0.16, -0.695],
               [-0.424,  0.16, -0.695]]

drinkPos =    [[-0.183, 0.11, -0.64],
               [-0.288, 0.11, -0.64],                   
               [-0.183, 0.21, -0.64],                              
               [-0.288, 0.21, -0.64]]

riceballPos = [[-0.172, -0.2, -0.72],
               [-0.267, -0.2, -0.72],
               [-0.172, -0.1, -0.72],                             
               [-0.267, -0.1, -0.72]]

lunchboxEu = [150, 0, 0]

drinkEu =    [0, 0, 0]
            
riceballXXEu = [45, 0, 0]
riceballEu   = [10, 0, 0]

               
objectPos = [lunchboxPos, drinkPos, riceballPos]
objectEu  = [lunchboxEu,  drinkEu,  riceballEu]

topRight    = [0.34, -0.1, -0.21]
topLeft     = [0.34,  0.1, -0.21]
middleRight = [0.42, -0.1, -0.555]
middleLeft  = [0.42,  0.1, -0.555]
bottomRight = [0.5, -0.2, -1.03]
bottomLeft  = [0.5,  0.2, -1.03]

topRightEu    = [-170, 35, 25]
topLeftEu     = [-140, 55, 45]
middleRightEu = [0, 90,  -45]
middleLeftEu  = [0, 90,  -30]
bottomRightEu = [0, 90,  30]
bottomLeftEu  = [0, 90, -30]

topRightPhi    = -45 
topLeftPhi     = -45
middleRightPhi = 40
middleLeftPhi  = 45
bottomRightPhi = 25
bottomLeftPhi  = 25

topRightSuc   = -60.2 
topLeftSuc    = -55


def setQuantity():
    for index in range(lunchQuan):
        objectName[index] = 'lunchboxXX'
        lunchboxPos[index][1] *= -1
        lunchboxPos[lunchQuan - index -1][2] += LUNCHBOX_H * index
    for index in range(4 - lunchQuan):
        lunchboxPos[4 - index -1][2] += LUNCHBOX_H * index
    for index in range(drinkQuan):
        objectName[index+4] = 'drinkXX'
    for index in range(riceQuan):
        objectName[index+8] = 'riceballXX'
    print lunchboxPos
    print objectName


class stockingTask:
    def __init__(self, _name = '/robotis'):
        """Initial object."""
        en_sim = False
        if len(sys.argv) >= 2:
            print(type(sys.argv[1]))
            if sys.argv[1] == 'True':
                rospy.set_param('en_sim', sys.argv[1])
                en_sim = rospy.get_param('en_sim')
        self.name = _name
        self.state = initPose
        self.nextState = idle
        self.arm = ArmTask(self.name + '_arm')
        self.pickListAll = len(lunchboxPos) + len(riceballPos) + len(drinkPos)
        self.pickList = PICKORDER
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
        
    @property
    def finish(self):
        return self.pickList == self.pickListAll

    # def setQuantity(self):
    #     for index in range(lunchQuan):
    #         objectName[index] = 'lunchboxXX'
    #         lunchboxPos[index][1] *= -1
    #         lunchboxPos[lunchQuan - index -1][2] += LUNCHBOX_H * index
    #     for index in range(4 - lunchQuan):
    #         lunchboxPos[4 - index -1][2] += LUNCHBOX_H * index
    #         print LUNCHBOX_H * index
    #     for index in range(drinkQuan):
    #         objectName[index+4] = 'drinkXX'
    #     for index in range(riceQuan):
    #         objectName[index+8] = 'riceballXX'
    #     print lunchboxPos

    def getRearSafetyPos(self):
        self.pos   = (0, -0.5*self.is_right, -0.5)
        self.euler = [-90*self.is_right, -20, 30*self.is_right]
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
        self.euler = objectEu[self.pickList/4][:]
        if objectName[self.pickList] == 'riceballXX':
            self.euler = riceballXXEu[:]
        self.euler[0] *= self.is_right
        self.euler[2] *= self.is_right
        self.phi   = -30*self.is_right

    def getPlacePos(self):
        if objectName[self.pickList] == 'lunchboxXX':
            self.pos   = bottomRight[:]
            self.euler = bottomRightEu[:]
            self.phi   = bottomRightPhi*self.is_right
            self.sucAngle = -90
            self.pos[2] += ((self.pickList%4))*0.05

        elif objectName[self.pickList] == 'lunchbox':
            self.pos   = bottomLeft[:]
            self.euler = bottomLeftEu[:]
            self.phi   = bottomLeftPhi*self.is_right
            self.sucAngle = -90
            self.pos[2] += ((self.pickList%4) - lunchQuan)*0.05

        elif objectName[self.pickList] == 'drinkXX':
            self.pos   = middleRight[:]
            self.euler = middleRightEu[:]
            self.phi   = middleRightPhi*self.is_right
            self.sucAngle = -90
            self.pos[0] += (drinkQuan - (self.pickList%4) - 1)*0.1

        elif objectName[self.pickList] == 'drink':
            self.pos   = middleLeft[:]
            self.euler = middleLeftEu[:]
            self.phi   = middleLeftPhi*self.is_right
            self.sucAngle = -90
            self.pos[0] += (4 - (self.pickList%4) - 1)*0.1

        elif objectName[self.pickList] == 'riceballXX':
            self.pos   = topLeft[:]
            self.euler = topLeftEu[:]
            self.phi   = topLeftPhi*self.is_right
            self.sucAngle = topLeftSuc
            self.pos[0] += (riceQuan - (self.pickList%4) - 1)*0.045

        elif objectName[self.pickList] == 'riceball':
            self.pos   = topRight[:]
            self.euler = topRightEu[:]
            self.phi   = topRightPhi*self.is_right
            self.sucAngle = topRightSuc
            self.pos[0] += (4 - (self.pickList%4) - 1)*0.045      

    def process(self):
        if self.arm.is_stop:                                       # must be include in your strategy
            self.finish = True                                     # must be include in your strategy
            print "!!! Robot is stop !!!"                          # must be include in your strategy
            return                                                 # must be include in your strategy

        if self.state == idle:
            self.getObjectPos()
            if self.finish:
                return
            else:
                if 'riceball' in objectName[self.pickList] and self.pickList!=8 or self.pickList==7:
                    self.state = safePose3
                else:
                    self.state = rearSafetyPos
                print "self.pickList = " + str(self.pickList)

        elif self.state == safePose1:
            self.state = busy
            self.nextState = safePose3
            fb = self.arm.get_fb()
            pos = fb.group_pose.position
            self.pos = (pos.x-0.1, pos.y, pos.z)
            self.euler = (0, 0, -85)
            self.arm.set_speed(SPEED)
            self.arm.ikMove('p2p', self.pos, self.euler, self.phi)

        elif self.state == leavePlacePos:
            self.state = busy
            self.nextState = leaveShelf
            self.arm.noa_move_suction('line', suction_angle=self.sucAngle, n=0, o=0, a=-0.02)

        elif self.state == safePose3:
            self.state = busy
            self.nextState = rearSafetyPos
            self.arm.set_speed(SPEED)
            self.arm.jointMove(0, (0, -1, 0, 2, 0, -0.7, 0))

        elif self.state == initPose:
            self.state = busy
            self.nextState = idle
            self.arm.set_speed(SPEED)
            self.arm.jointMove(0, (0, -1, 0, 1.57, 0, -0.57, 0))
            self.suction.gripper_suction_deg(0)


        elif self.state == frontSafetyPos:
            self.state = busy
            self.nextState = move2Shelf
            self.getRearSafetyPos()
            self.euler[0] = -90*self.is_right
            if 'drink' in objectName[self.pickList]:
                self.euler[1] = -35
            self.arm.set_speed(SPEED)
            self.arm.ikMove('line', self.pos, self.euler, self.phi)

        elif self.state == rearSafetyPos:
            self.state = busy
            self.nextState = move2Bin
            self.getRearSafetyPos()
            self.arm.set_speed(SPEED)
            self.arm.ikMove('line', self.pos, self.euler, self.phi)

        elif self.state == rearSafetyPos2:
            self.state = busy
            self.nextState = move2Shelf
            self.getRearSafetyPos()
            self.euler[0] = -180
            self.arm.set_speed(SPEED)
            self.arm.ikMove('line', self.pos, self.euler, self.phi)

        elif self.state == move2Bin:
            self.state = busy
            self.nextState = move2Object
            self.getObjectPos()
            self.pos[2] = -0.5
            self.euler[1] = -16
            self.arm.set_speed(SPEED)
            self.arm.ikMove('line', self.pos, self.euler, self.phi)
 
        elif self.state == move2Shelf:
            self.state = busy
            self.getPlacePos()
            if 'riceball' in objectName[self.pickList]:
                self.nextState = riceballEuler
                self.euler[0] = -45
                # self.euler = [0, -10, 0]
                # self.pos[2] -= 0.2
            else:
                self.nextState = moveIn2Shelf
                self.euler[0] = 0
            self.pos[0] = 0.42
            self.pos[2] += 0.1
            
            self.arm.set_speed(SPEED)
            self.arm.noa_relative_pos('line', self.pos, self.euler, self.phi, suction_angle=0, n=0, o=0, a=-0.15)
            self.suction.gripper_calibration()


        elif self.state == riceballEuler:
            self.state = busy
            self.nextState = moveIn2Shelf
            self.getPlacePos()
            self.pos[2] += 0.1
            self.arm.set_speed(SPEED)
            print 'euler = ', self.euler
            self.arm.move_euler('line', self.euler)
            self.suction.gripper_suction_deg(self.sucAngle)
        
        elif self.state == moveIn2Shelf:
            self.state = busy
            self.nextState = move2PlacedPos
            self.getPlacePos()
            self.pos[2] += 0.1
            self.arm.set_speed(SPEED)
            self.arm.ikMove('line', self.pos, self.euler, self.phi)
            if 'riceball' not in objectName[self.pickList]:
                self.suction.gripper_suction_deg(-90)

        elif self.state == leaveBin:
            self.state = busy
            self.nextState = frontSafetyPos
            self.arm.set_speed(SPEED)
            self.getObjectPos()
            self.pos[2] = -0.47
            if 'drink' in objectName[self.pickList]:
                self.pos[0] -= 0.02 
                self.euler[1] = -40
                self.euler[2] = 40*self.is_right
            self.arm.ikMove('line', self.pos, self.euler, self.phi)

        elif self.state == leaveShelf:
            self.state = busy
            self.nextState = idle
            self.arm.set_speed(SPEED)
            # if objectName[self.pickList] == 'riceballXX':
            #     self.arm.noa_move_suction('line', suction_angle=0, n=0.08, o=0, a=-0.22)
            # else:
            #     self.arm.noa_move_suction('line', suction_angle=0, n=0.08, o=0, a=-0.12)
            # self.arm.relative_move_pose('line', [-0.3, 0, 0.1])
            self.getPlacePos()
            if 'riceball' in objectName[self.pickList]:
                self.euler[0] = -45
            else:
                self.euler[0] = 0
            self.pos[0] = 0.36
            self.pos[2] += 0.1
            
            self.arm.set_speed(SPEED)
            self.arm.noa_relative_pos('line', self.pos, self.euler, self.phi, suction_angle=0, n=0, o=0, a=-0.15)
            self.pickList += 1
            self.suction.gripper_suction_deg(0)

        elif self.state == move2Object:
            self.state = busy
            self.nextState = pickObject
            self.getObjectPos()
            self.arm.set_speed(SPEED)
            self.arm.ikMove('line', self.pos, self.euler, self.phi)

        elif self.state == move2PlacedPos:
            self.state = busy
            self.nextState = placeObject
            self.getPlacePos()
            self.arm.set_speed(SPEED)
            self.arm.ikMove('line', self.pos, self.euler, self.phi)

        elif self.state == pickObject:
            self.state = busy
            if self.suction.is_grip:
                self.nextState = leaveBin
                print('pickObject 1')
            else:
                self.nextState = pickObject
                # self.arm.noa_move_suction('line', suction_angle=0, n=0, o=0, a=0.002)
                print('pickObject 2')

            print('pickObject 3')
            self.suction.gripper_vaccum_on()
            
        elif self.state == placeObject:
            self.state = busy
            self.nextState = leavePlacePos
            rospy.sleep(.5)
            self.suction.gripper_vaccum_off()

        elif self.state == busy:
            if self.arm.is_busy:
                return
            else:
                self.state = self.nextState


def start_callback(msg):
    global is_start
    if not is_start:
        is_start = msg.data


if __name__ == '__main__':
    rospy.init_node('example')        # enable this node

    is_start = False
    rospy.Subscriber(
        'scan_black/dualarm_start',
        Bool,
        start_callback,
        queue_size=1
    )
    pub = rospy.Publisher(
        'scan_black/strategy_behavior',
        Int32,
        queue_size=1
    )

    right = stockingTask('right')      # Set up right arm controller
    left  = stockingTask('left')       # Set up left arm controller
    rospy.sleep(.3)
    setQuantity()

    while not rospy.is_shutdown() and not is_start:
        rospy.loginfo('waiting for start signal')
        rospy.sleep(.5)

    rate = rospy.Rate(30)  # 30hz
    while not rospy.is_shutdown() and (not right.finish or not left.finish):
        left.process()
        right.process()
        rate.sleep()

    # robot arm back home
    rospy.loginfo('back home')
    left.arm.wait_busy()
    left.arm.jointMove(0, (0, -1, 0, 2, 0, -0.7, 0))
    right.arm.wait_busy()
    right.arm.jointMove(0, (0, -1, 0, 2, 0, -0.7, 0))

    # publish finish signal to wheels
    pub.publish(3)
