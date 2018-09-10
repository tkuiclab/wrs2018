#!/usr/bin/env python

import rospy
import arm_task
from std_msgs.msg import String, Float64
from arm_control.msg import WebCmd


def set_sub():
    print "[Arm] web control: " 
    web_cmd_sub = rospy.Subscriber(
        '/web_cmd',
        WebCmd,
        web_cmd_callback,
        queue_size=10
    )


def web_cmd_callback(msg):
    try:
        rospy.loginfo('send cmd b')
        if 'absolute' in msg.cmd:
            arm[msg.name].ikMove(msg.mode, msg.pose, msg.euler, msg.phi)
        elif 'relative' in msg.cmd:
            arm[msg.name].relative_move_pose(msg.mode, msg.pose)
        elif 'noa_move' in msg.cmd:
            arm[msg.name].noa_move_suction('p2p', n=msg.noa[0], o=msg.noa[1], a=msg.noa[2])
            
        rospy.loginfo('send cmd')
    except KeyError:
        rospy.logerr('arm -> KeyError')


if __name__ == '__main__':
    rospy.init_node('web_cmd')

    arm_right = arm_task.ArmTask('right_arm')
    arm_left  = arm_task.ArmTask('left_arm')
    arm = {"right": arm_right, "left": arm_left}
    set_sub()

    rospy.spin()
