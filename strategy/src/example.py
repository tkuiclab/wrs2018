#!/usr/bin/env python

"""Use to generate arm task and run."""

import os
import sys
import rospy
import rospkg
rospack = rospkg.RosPack()
sys.path.append(os.path.join(rospack.get_path('arm_control'), 'scripts'))

from arm_task import ArmTask

idle            = 0
busy            = 1
initPose        = 2
frontSafetyPose = 3
rearSafetyPose  = 4
move2Bin        = 5
move2Shelf      = 6
leaveBin        = 7
leaveShelf      = 8
move2Object     = 9
pickObject      = 10
placeObject     = 11



if __name__ == '__main__':
    rospy.init_node('example')
    right_arm = ArmTask('right_arm')
    rospy.sleep(0.3)

    right_arm.set_speed(100)
    right_arm.jointMove(0, (0, -0.5, 0, 1, 0, -0.5, 0))
    right_arm.set_speed(80)
    while right_arm.busy:
        rospy.sleep(0.3)
    right_arm.ikMove('line', (-0.1, -0.15, -0.75), (90, 0, 0), -30)
    while right_arm.busy:
        rospy.sleep(0.3)
    right_arm.ikMove('line', (-0.5, -0.15, -0.8), (90, 0, 0), -30) 
    while right_arm.busy:
        rospy.sleep(0.3)
    right_arm.relative_move_pose('line', [0, 0, -0.08])
    while right_arm.busy:
        rospy.sleep(0.3)
    right_arm.relative_move_pose('line', [0, 0, 0.08])
    while right_arm.busy:
        rospy.sleep(0.3)
    right_arm.ikMove('line', (0.1, -0.35, -0.7), (0, 30, 0), 45)
    while right_arm.busy:
        rospy.sleep(0.3)
    right_arm.ikMove('p2p', (0.55, -0.35, -0.35), (0, 90, 0), 45)
    while right_arm.busy:
        rospy.sleep(0.3)
    right_arm.relative_move_pose('line', [0.2, 0, -0.1])
    while right_arm.busy:
        rospy.sleep(0.3)
    right_arm.relative_move_pose('line', [0, 0, -0.1])
    while right_arm.busy:
        rospy.sleep(0.3)
    right_arm.relative_move_pose('line', [0, 0, 0.1])
    while right_arm.busy:
        rospy.sleep(0.3)
    right_arm.relative_move_pose('line', [-0.3, 0, 0.1])
    while right_arm.busy:
        rospy.sleep(0.3)
    right_arm.ikMove('line', (-0.1, -0.15, -0.75), (90, 0, 0), -30)
    while right_arm.busy:
        rospy.sleep(0.3)
    right_arm.ikMove('line', (-0.5, -0.15, -0.75), (90, 0, 0), -30) 
    while right_arm.busy:
        rospy.sleep(0.3)
    right_arm.relative_move_pose('line', [0, 0, -0.08])
    while right_arm.busy:
        rospy.sleep(0.3)
    right_arm.relative_move_pose('line', [0, 0, 0.08])
    while right_arm.busy:
        rospy.sleep(0.3)
    right_arm.ikMove('line', (0.1, -0.35, -0.7), (0, 30, 0), 45)
    while right_arm.busy:
        rospy.sleep(0.3)
    right_arm.ikMove('p2p', (0.55, -0.35, -0.35), (0, 90, 0), 45)
    while right_arm.busy:
        rospy.sleep(0.3)
    right_arm.relative_move_pose('line', [0.15, 0, -0.1])
    while right_arm.busy:
        rospy.sleep(0.3)
    right_arm.relative_move_pose('line', [0, 0, -0.1])
    while right_arm.busy:
        rospy.sleep(0.3)
    right_arm.relative_move_pose('line', [0, 0, 0.1])
    while right_arm.busy:
        rospy.sleep(0.3)
    right_arm.relative_move_pose('line', [-0.3, 0, 0.1])
    while right_arm.busy:
        rospy.sleep(0.3)
    right_arm.jointMove(0, (0, -0.5, 0, 1, 0, -0.5, 0))

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