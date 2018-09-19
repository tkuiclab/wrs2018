#!/usr/bin/env python

"""Use to generate arm task and run."""

import os
import sys
import rospy
import rospkg
from gazebo_msgs.msg import ModelState


set_mode_pub = rospy.Publisher(
    '/gazebo/set_model_state',
    ModelState,
    queue_size=1,
    latch=True
)

def set_pub():
    print "set_link_state "
    global set_mode_pub

def set_object(name, pos, ori):
    msg = ModelState()
    msg.model_name = name
    msg.pose.position.x = pos[0]
    msg.pose.position.y = pos[1]
    msg.pose.position.z = pos[2]
    msg.pose.orientation.w = ori[0]
    msg.pose.orientation.x = ori[1]
    msg.pose.orientation.y = ori[2]
    msg.pose.orientation.z = ori[3]
    msg.reference_frame = 'world'
    set_mode_pub.publish(msg)
    print msg

if __name__ == '__main__':
    rospy.init_node('set_obj')
    set_pub()
    names = ('lunchbox', 'lunchbox1', 'lunchbox2')
    pos  = ((-0.6, -0.166, 0.7),
            (-0.6, -0.166, 0.75),
            (-0.6, -0.166, 0.8))
    ori  = ((0, 0, 0, 1),
            (0, 0, 0, 1),
            (0, 0, 0, 1))
    for i, name in enumerate(names):
        set_object(name, pos[i], ori[i])
        rospy.sleep(1)