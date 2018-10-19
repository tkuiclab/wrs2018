#!/usr/bin/env python

"""Use to generate arm task and run."""

import os
import sys
import copy ######
import time
from math import degrees

import rospy
from std_msgs.msg import Bool, Int32
from arm_control import ArmTask, SuctionTask

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
leaveShelfTop1    = 40
leaveShelfTop2    = 41
leaveShelfTop3    = 42
leaveShelfTop4    = 43
move2QRcode       = 50
move2Shelf1       = 60
move2Shelf2       = 62
move2Shelf3       = 63
move2Shelf4       = 64
move2PlacePos     = 65
PlaceObject       = 66
leaveShelfMiddle1 = 40
leaveShelfMiddle2 = 40
leaveShelfMiddle3 = 40
leaveShelfMiddle4 = 40
move2Bin1         = 50
leaveBin1         = 60

class disposingTask
    def __init__(self, _name = '/robotis'):
        """Initial object."""
        self.en_sim = False
        if len(sys.argv) >= 2:
            print(type(sys.argv[1]))
            if sys.argv[1] == 'True':
                rospy.set_param('self.en_sim', sys.argv[1])
                self.en_sim = rospy.get_param('self.en_sim')
        self.name = _name
        self.state = initPose@property
    def finish(self):
        return self.pickList == self.pickListAll
        self.nowState = initPose 
        self.nextState = idle
        self.reGripCnt = 0
        self.arm = ArmTask(self.name + '_arm')
        self.pos   = [0, 0, 0]
        self.euler = [0, 0, 0]
        self.phi   = 0
        self.sucAngle = 0
        self.sandwitchPos = [0, 0, 0]
        self.sandwitchEu  = [0, 0, 0]
        self.sandwitchSuc = 0
        if self.name == 'right':
            self.is_right = 1
        if self.name == 'left':
            self.is_right = -1
        if self.en_sim:
            self.suction = SuctionTask(self.name + '_gazebo')
        else:
            self.suction = SuctionTask(self.name)
            rospy.on_shutdown(self.suction.gripper_vaccum_off)

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
            self.nextState = 

        elif self.state == frontSafetyPos:

        elif self.state == rearSafetyPos:

        elif self.state == move2CamPos1:
            self.state = busy
            self.nextState = move2CamPos2
            pos = (0, 0.5, -0.3)
            euler = (0, 0, -30)
            phi = 0
            self.arm.ikMove('p2p', pos, euler, phi)

        elif self.state == move2CamPos2:
            self.state = busy
            self.nextState = moveCam
            pos = (0, 0.86, -0.22)
            euler = (0, 0, 90)
            phi = 0
            self.arm.ikMove('line', pos, euler, phi)


        elif self.state == moveCam:

        elif self.state == watch:

        elif self.state == move2Object1:
            self.state = busy
            self.nextState = move2Object2
            pos = self.sandwitchPos
            pos[2] = -0.3
            phi = -30
            self.arm.set_speed(SPEED)
            self.arm.ikMove('line', pos, self.sandwitchEu, phi)

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
            if self.suction.is_grip or self.en_sim:
                self.arm.clear_cmd()
                # rospy.sleep(.1)
                self.state = busy
                self.nextState = leaveShelfTop1
                self.reGripCnt = 0
            elif not self.arm.is_busy:
                self.state = missObj

        elif self.state == leaveShelfTop1:
            self.state = busy
            self.nextState = leaveShelfTop2
            self.arm.relative_move_pose('line', [0, 0, 0.1])

        elif self.state == :

        elif self.state == :

        elif self.state == :

        elif self.state == :

        elif self.state == :

        elif self.state == :

        elif self.state == :

        elif self.state == :

        elif self.state == :

        elif self.state == :

        elif self.state == :

        