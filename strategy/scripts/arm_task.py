#!/usr/bin/env python

"""Use to generate arm task and run."""

import sys
import rospy
import tf
# import object_distribtion

from math import radians, degrees, sin, cos
from numpy import multiply

from std_msgs.msg import String, Float64
from robotis_controller_msgs.msg import StatusMsg
# from manipulator_h_base_module_msgs.msg import IK_Cmd, JointPose
from manipulator_h_base_module_msgs.msg import JointPose
from manipulator_h_base_module_msgs.srv import GetKinematicsPose, GetKinematicsPoseResponse
from manipulator_h_base_module_msgs.srv import GetJointPose, GetJointPoseResponse

class ArmTask:
    """Running arm task class."""

    def __init__(self, _name = '/robotis'):
        """Inital object."""
        self.name = _name
        self.init()

    def init(self):
        self.__set_pubSub()
        #rospy.on_shutdown(self.stop_task)
        self.__set_mode_pub.publish('set')
        self.__is_busy = False
        # self.__set_vel_pub.publish(10)
        self.__ik_fail =False
        self.__speed = 50

    def __set_pubSub(self):
        print "[Arm] name space : " + str(self.name) 
        self.__set_mode_pub = rospy.Publisher(
            str(self.name) + '/set_mode_msg',
            String,
            # latch=True,
            queue_size=1
        )
        self.__joint_pub = rospy.Publisher(
            str(self.name) + '/joint_pose_msg',
            JointPose,
            # latch=True,
            queue_size=1
        )
        # self.__ptp_pub = rospy.Publisher(
        #     str(self.name) + '/p2p_pose_msg',
        #     IK_Cmd,
        #     # latch=True,
        #     queue_size=1
        # )
        # self.__cmd_pub = rospy.Publisher(
        #     str(self.name) + '/kinematics_pose_msg',
        #     IK_Cmd,
        #     # latch=True,
        #     queue_size=1
        # )
        # self.__set_vel_pub = rospy.Publisher(
        #     str(self.name) + '/set_velocity',
        #     Float64,
        #     latch=True,
        #     queue_size=1
        # )
        # self.__status_sub = rospy.Subscriber(
        #     str(self.name) + '/status',
        #     StatusMsg,
        #     self.__status_callback,
        #     queue_size=1
        # )
        # Waiting for topic enable
        rospy.sleep(0.3)

    def __status_callback(self, msg):
        if 'IK Failed' in msg.status_msg:
            rospy.logwarn('ik fail')
            self.__ik_fail = True

        elif 'End Trajectory' in msg.status_msg:
            self.__is_busy = False

    def home(self):
        self.pub_jointCmd([0, 0, 0, 0, 0, 0, 0])

    @property
    def is_ikfail(self):
        return self.__ik_fail

    def set_speed(self,i_speed):
        self.__speed = i_speed

    def pub_jointCmd(self, slide_pos = 0,cmd=[0, 0, 0, 0, 0, 0, 0]):
        """Publish msg of joint cmd (rad) to manager node."""
        name  = list()
        value = list()
        speed = self.__speed
        
        for i, val in enumerate(cmd):
            name.append('joint{}'.format(i+1))
            value.append(val)

        self.__joint_pub.publish(JointPose(name, value, slide_pos, speed))
        self.__is_busy = True

    # def pub_ikCmd(self, mode='line', pos=_POS, euler=_ORI, fai=0):
    #     """Publish msg of ik cmd (deg) to manager node."""
    #     # pub_ikCmd('ptp', (x, y , z), (pitch, roll, yaw) )
        
    #     self.__is_busy = True

    #     cmd = []

    #     for p in pos:
    #         cmd.append(p)
    #     for e in euler:
    #         cmd.append(e)
    #     cmd.append(fai)

    #     #rospy.loginfo('Sent:{}'.format(cmd))

    #     if mode == 'line':
    #         self.__cmd_pub.publish(cmd)
    #     elif mode == 'ptp':
    #         self.__ptp_pub.publish(cmd)

if __name__ == '__main__':
    rospy.init_node('strategy')
    a = ArmTask('right_arm')
    rospy.sleep(0.3)

    a.pub_jointCmd(0, (0, 0, 0, 0, 0, 0, 0))