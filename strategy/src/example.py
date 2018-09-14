#!/usr/bin/env python

"""Use to generate arm task and run."""

import os
import sys
import rospy
import rospkg
rospack = rospkg.RosPack()
sys.path.append(os.path.join(rospack.get_path('arm_control'), 'src/arm_control'))

from arm_task import ArmTask

idle            = 0
busy            = 1
initPose        = 2
frontSafetyPos  = 3
rearSafetyPos   = 4
move2Bin        = 5
move2Shelf      = 6
leaveBin        = 7
leaveShelf      = 8
move2Object     = 9
move2PlacePos  = 10
pickObject     = 11
placeObject    = 12


class exampleTask:
    def __init__(self, _name = '/robotis'):
        """Inital object."""
        self.name = _name
        self.state = initPose
        self.nextState = idle
        self.arm = ArmTask(self.name)
        self.pick_list = 2
        self.pos   = (0, 0, 0)
        self.euler = (0, 0, 0)
        self.phi   = 0

    @property
    def finish(self):
        return self.pick_list == 0

    def getRearSafetyPos(self):
        if self.name == 'right_arm':
            self.pos, self.euler, self.phi = (-0.1, -0.45, -0.5), (90, 0, 0), -30
        elif self.name == 'left_arm':
            self.pos, self.euler, self.phi = (-0.1, 0.45, -0.5), (-90, 0, 0),  30

    def getFrontSafetyPos(self):
        if self.name == 'right_arm':
            self.pos, self.euler, self.phi = (0.1, -0.45, -0.5), (0, 30, 0), 45
        elif self.name == 'left_arm':
            self.pos, self.euler, self.phi = (0.1, 0.45, -0.5), (0, 30, 0), -45

    def getObjectPos(self):
        if self.name == 'right_arm':
            self.pos, self.euler, self.phi = (-0.5, -0.15, -0.5), (90, 0, 0), -30
        elif self.name == 'left_arm':
            self.pos, self.euler, self.phi = (-0.5, 0.15, -0.5), (-90, 0, 0), 30

    def getPlacePos(self):
        if self.name == 'right_arm':
            self.pos, self.euler, self.phi = (0.15, -0.35, -0.4), (0, 90, 0), 45
        elif self.name == 'left_arm':
            self.pos, self.euler, self.phi = (0.15, 0.35, -0.4), (0, 90, 0), -45


    def proces(self):
        if self.state == idle:
            if self.finish:
                return
            else:
                self.state = rearSafetyPos
                print "self.pick_list = " + str(self.pick_list)

        # elif self.state == WaitVision:
        #     return

        # Move to bin and initial pose
        elif self.state == initPose:
            self.state = busy
            self.nextState = idle
            self.arm.set_speed(70)
            self.arm.jointMove(0, (0, -0.5, 0, 1, 0, -0.5, 0))

        elif self.state == frontSafetyPos:
            self.state = busy
            self.nextState = move2Shelf
            self.getFrontSafetyPos()
            self.arm.ikMove('line', self.pos, self.euler, self.phi)

        elif self.state == rearSafetyPos:
            self.state = busy
            self.nextState = move2Bin
            self.getRearSafetyPos()
            self.arm.ikMove('line', self.pos, self.euler, self.phi)

        elif self.state == move2Bin:
            self.state = busy
            self.nextState = move2Object
            self.getObjectPos()
            self.arm.ikMove('line', self.pos, self.euler, self.phi) 

        elif self.state == move2Shelf:
            self.state = busy
            self.nextState = move2PlacePos
            self.getPlacePos()
            self.arm.ikMove('p2p', self.pos, self.euler, self.phi)

        elif self.state == leaveBin:
            self.state = busy
            self.nextState = frontSafetyPos
            self.arm.relative_move_pose('line', [0, 0, 0.2])

        elif self.state == leaveShelf:
            self.state = busy
            self.nextState = idle
            self.arm.relative_move_pose('line', [-0.3, 0, 0.1])
            self.pick_list -= 1

        elif self.state == move2Object:
            self.state = busy
            self.nextState = pickObject
            self.arm.relative_move_pose('line', [0, 0, -0.2])

        elif self.state == move2PlacePos:
            self.state = busy
            self.nextState = placeObject
            self.arm.relative_move_pose('line', [0.3, 0, -0.1])

        elif self.state == pickObject:
            self.state = busy
            self.nextState = leaveBin
            
        elif self.state == placeObject:
            self.state = busy
            self.nextState = leaveShelf

        elif self.state == busy:
            if self.arm.busy:
                return
            else:
                self.state = self.nextState
            
if __name__ == '__main__':
    rospy.init_node('example')
    # right_arm = ArmTask('right_arm')
    right = exampleTask('right_arm')
    left  = exampleTask('left_arm')
    rospy.sleep(0.3)

    rate = rospy.Rate(30)  # 30hz
    while not rospy.is_shutdown() and (not right.finish or not left.finish):
        left.proces()
        right.proces()
        rate.sleep()
    # right_arm.set_speed(100)
    # right_arm.jointMove(0, (0, -0.5, 0, 1, 0, -0.5, 0))
    # right_arm.set_speed(80)
    # while right_arm.busy:
    #     rospy.sleep(0.3)
    # right_arm.ikMove('line', (-0.1, -0.15, -0.75), (90, 0, 0), -30)
    # while right_arm.busy:
    #     rospy.sleep(0.3)
    # right_arm.ikMove('line', (-0.5, -0.15, -0.8), (90, 0, 0), -30) 
    # while right_arm.busy:
    #     rospy.sleep(0.3)
    # right_arm.relative_move_pose('line', [0, 0, -0.08])
    # while right_arm.busy:
    #     rospy.sleep(0.3)
    # right_arm.relative_move_pose('line', [0, 0, 0.08])
    # while right_arm.busy:
    #     rospy.sleep(0.3)
    # right_arm.ikMove('line', (0.1, -0.35, -0.7), (0, 30, 0), 45)
    # while right_arm.busy:
    #     rospy.sleep(0.3)
    # right_arm.ikMove('p2p', (0.55, -0.35, -0.35), (0, 90, 0), 45)
    # while right_arm.busy:
    #     rospy.sleep(0.3)
    # right_arm.relative_move_pose('line', [0.2, 0, -0.1])
    # while right_arm.busy:
    #     rospy.sleep(0.3)
    # right_arm.relative_move_pose('line', [0, 0, -0.1])
    # while right_arm.busy:
    #     rospy.sleep(0.3)
    # right_arm.relative_move_pose('line', [0, 0, 0.1])
    # while right_arm.busy:
    #     rospy.sleep(0.3)
    # right_arm.relative_move_pose('line', [-0.3, 0, 0.1])
    # while right_arm.busy:
    #     rospy.sleep(0.3)
    # right_arm.ikMove('line', (-0.1, -0.15, -0.75), (90, 0, 0), -30)
    # while right_arm.busy:
    #     rospy.sleep(0.3)
    # right_arm.ikMove('line', (-0.5, -0.15, -0.75), (90, 0, 0), -30) 
    # while right_arm.busy:
    #     rospy.sleep(0.3)
    # right_arm.relative_move_pose('line', [0, 0, -0.08])
    # while right_arm.busy:
    #     rospy.sleep(0.3)
    # right_arm.relative_move_pose('line', [0, 0, 0.08])
    # while right_arm.busy:
    #     rospy.sleep(0.3)
    # right_arm.ikMove('line', (0.1, -0.35, -0.7), (0, 30, 0), 45)
    # while right_arm.busy:
    #     rospy.sleep(0.3)
    # right_arm.ikMove('p2p', (0.55, -0.35, -0.35), (0, 90, 0), 45)
    # while right_arm.busy:
    #     rospy.sleep(0.3)
    # right_arm.relative_move_pose('line', [0.15, 0, -0.1])
    # while right_arm.busy:
    #     rospy.sleep(0.3)
    # right_arm.relative_move_pose('line', [0, 0, -0.1])
    # while right_arm.busy:
    #     rospy.sleep(0.3)
    # right_arm.relative_move_pose('line', [0, 0, 0.1])
    # while right_arm.busy:
    #     rospy.sleep(0.3)
    # right_arm.relative_move_pose('line', [-0.3, 0, 0.1])
    # while right_arm.busy:
    #     rospy.sleep(0.3)
    # right_arm.jointMove(0, (0, -0.5, 0, 1, 0, -0.5, 0))

    # a.set_speed(100)
    # while a.busy:
    #     rospy.sleep(0.3)
    # a.noa_move_suction('p2p', -45, n=0, o=0, a=-0.1)
    # while a.busy:
    #     rospy.sleep(0.3)
    # a.singleJointMove(0,-0.2)
    # while a.busy:
    #     rospy.sleep(0.3)
    # a.jointMove(0, (0, -1, 0, 1, 0, 0, 0))
    # while a.busy:
    #     rospy.sleep(0.3)
    # a.singleJointMove(1,0.5)
    # while a.busy:
    #     rospy.sleep(0.3)
    # a.relative_move_pose('p2p', [0, -0.1, 0])
    # while a.busy:
    #     rospy.sleep(0.3)
    # a.back_home()