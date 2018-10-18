#!/usr/bin/env python

"""Use to generate arm task and run."""

import os
import sys
import copy
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