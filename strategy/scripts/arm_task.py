#!/usr/bin/env python

"""Use to generate arm task and run."""

import sys
import rospy
import tf
# import object_distribtion

from math import radians, degrees, sin, cos, pi
from numpy import multiply

import numpy as np

from std_msgs.msg import String, Float64
from robotis_controller_msgs.msg import StatusMsg
# from manipulator_h_base_module_msgs.msg import IK_Cmd, JointPose
from manipulator_h_base_module_msgs.msg import P2PPose, JointPose, KinematicsPose
from manipulator_h_base_module_msgs.srv import GetKinematicsPose, GetKinematicsPoseResponse
from manipulator_h_base_module_msgs.srv import GetJointPose, GetJointPoseResponse

_POS = (0, 0, 0)
_ORI = (0, 0, 0)

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
        self.__p2p_pub = rospy.Publisher(
            str(self.name) + '/p2p_pose_msg',
            P2PPose,
            # latch=True,
            queue_size=1
        )
        self.__line_pub = rospy.Publisher(
            str(self.name) + '/kinematics_pose_msg',
            KinematicsPose,
            # latch=True,
            queue_size=1
        )
        # self.__set_vel_pub = rospy.Publisher(
        #     str(self.name) + '/set_velocity',
        #     Float64,
        #     latch=True,
        #     queue_size=1
        # )
        self.__status_sub = rospy.Subscriber(
            str(self.name) + '/status',
            StatusMsg,
            self.__status_callback,
            queue_size=1
        )
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

    def euler2rotation(self, euler):
        roll, pitch, yaw = euler

        origin    = np.matrix([[1, 0, 0],
                               [0, -1, 0],
                               [0, 0, -1]])

        rotationX = np.matrix([[1.0,      0.0,       0.0],
                               [0.0, cos(yaw), -sin(yaw)],
                               [0.0, sin(yaw),  cos(yaw)]])

        rotationY = np.matrix([[cos(pitch),  0.0, sin(pitch)],
                               [0.0,         1.0,        0.0],
                               [-sin(pitch), 0.0, cos(pitch)]])

        rotationZ = np.matrix([[cos(roll), -sin(roll), 0.0],
                               [sin(roll),  cos(roll), 0.0],
                               [0.0,           0.0,    1.0]])
        return origin * rotationY * rotationX * rotationZ

    def euler2quaternion(self, euler):
        roll, pitch, yaw = euler
        quaternion = tf.transformations.quaternion_from_euler(-pitch+pi, -yaw, roll-pi, 'ryxz')
        return (quaternion)

    def pub_ikCmd(self, mode='line', pos=_POS, euler=_ORI, phi=0):
        print pos
        """Publish msg of ik cmd (deg) to manager node."""
        roll, pitch, yaw = euler
        roll  = roll * pi/ 180
        pitch = pitch* pi/ 180
        yaw   = yaw  * pi/ 180

        self.__is_busy = True

        msg = KinematicsPose()
        msg.name = 'arm'
        msg.pose.position.x = pos[0]
        msg.pose.position.y = pos[1]
        msg.pose.position.z = pos[2]

        quaternion = self.euler2quaternion((roll, pitch, yaw))
        msg.pose.orientation.x = quaternion[0]
        msg.pose.orientation.y = quaternion[1]
        msg.pose.orientation.z = quaternion[2]
        msg.pose.orientation.w = quaternion[3]

        msg.speed = self.__speed

        #rospy.loginfo('Sent:{}'.format(cmd))

        if mode == 'line':
            self.__line_pub.publish(msg)
        elif mode == 'p2p':
            self.__p2p_pub.publish(msg)


    def quaternion2euler(self, ori):
        quaternion = (
            ori.x,
            ori.y,
            ori.z,
            ori.w
        )
        pitch, yaw, roll = tf.transformations.euler_from_quaternion(quaternion, 'ryxz')
        # euler = roll+pi ,-pitch+pi, -yaw
        euler = -roll, -pitch, yaw
        return euler

    def rotation2vector(self, rot):
        vec_n = [rot[0, 0], rot[1, 0], rot[2, 0]]
        vec_s = [rot[0, 1], rot[1, 1], rot[2, 1]]
        vec_a = [rot[0, 2], rot[1, 2], rot[2, 2]]
        return vec_n, vec_s, vec_a 

    def get_fb(self):
        rospy.wait_for_service(self.name + '/get_kinematics_pose')
        try:
            get_endpos = rospy.ServiceProxy(
                self.name + '/get_kinematics_pose',
                GetKinematicsPose
            )
            res = get_endpos('arm')
            return res
        except rospy.ServiceException, e:
            print "Service call failed: %s" % e

    def relative_move_suction(self, mode='ptp', suction_angle=0, n=0, s=0, a=0):
        # a_suction = np.matrix([[cos(suction_angle),  0, -sin(suction_angle)],
        #                        [sin(suction_angle),  0,  cos(suction_angle)],
        #                        [                 0, -1,                   0]])
        suction_angle = suction_angle * pi/180
        suction_rot = np.matrix([[cos(suction_angle),  0.0, sin(suction_angle)],
                               [0.0,                 1.0,                0.0],
                               [-sin(suction_angle), 0.0, cos(suction_angle)]])
        fb = self.get_fb()
        pos = fb.group_pose.position
        ori = fb.group_pose.orientation
        phi = fb.phi
        euler = fb.euler
        # euler = self.quaternion2euler(ori)
        print euler
        print pos
        rot = self.euler2rotation(euler) * suction_rot
        print self.euler2rotation(euler)
        print rot
        vec_n, vec_s, vec_a = self.rotation2vector(rot) #for suction
        move = [0, 0, 0]

        if n > 1e-10:
            move += multiply(vec_n, n)
        if s != 0:
            move += multiply(vec_s, s)
        if a != 0:
            move += multiply(vec_a, a)
        print move
        self.pub_ikCmd(
            mode,
            (pos.x + move[0], pos.y + move[1], pos.z + move[2]),
            (degrees(euler[0]), degrees(euler[1]), degrees(euler[2])),
            phi
        )
    @property
    def busy(self):
        return self.__is_busy

if __name__ == '__main__':
    rospy.init_node('strategy')
    a = ArmTask('right_arm')
    rospy.sleep(0.3)

    a.pub_jointCmd(0, (0, -1, 0, 1, 0, 0, 0))
    while a.busy:
        rospy.sleep(0.3)
    a.pub_ikCmd('p2p', (0, -0.3, -0.9), (0, 0, 0), 30) 
    while a.busy:
        rospy.sleep(0.3)
    a.relative_move_suction('p2p', -45, n=0, s=0, a=0.1)