#!/usr/bin/env python

import rospy
from math import radians, degrees, pi
from vacuum_cmd_msg.srv import VacuumCmd
from std_msgs.msg import Bool, Float64

# 2017/07/19 Gripper Parameter Backup
# cam2tool_y = -0.025
# cam2tool_z = 0.14
# gripper_length = 0.04
# cam2center_y = 0.025
# cam2center_y_4_tote = 0.05

# NOW
cam2tool_z = 0.18 #0.27 #0.26
gripper_length = 0.04
cam2center_y = 0.035
cam2center_y_4_tote = 0.035#0.06 #0.05

class SuctionTask:
    def __init__(self, _name='/robotis'):
        """Inital object."""
        self.name    = _name
        self.gripped = False
        self.is_grip_sub = rospy.Subscriber(
            self.name + '/is_grip',
            Bool,
            self.is_grip_callback,
            queue_size=1
        )
        if self.name == 'right':
            self.suction_pub = rospy.Publisher(
                '/mobile_dual_arm/r_suction_joint_position/command',
                Float64,
                queue_size=1
            )
        elif self.name == 'left':
            self.suction_pub = rospy.Publisher(
                '/mobile_dual_arm/l_suction_joint_position/command',
                Float64,
                queue_size=1
            )
        
    def robot_cmd_client(self, cmd):
        suction_service = self.name + '/suction_cmd'
        rospy.wait_for_service(suction_service)
        try:
            client = rospy.ServiceProxy(
                suction_service,
                VacuumCmd
            )
            client(cmd)
        
        except rospy.ServiceException, e:
            print "Service call (Vacuum) failed: %s" % e

    def gripper_vaccum_on(self):
        self.robot_cmd_client('vacuumOn')
        print('Vaccum On')
        rospy.sleep(0.5)

    def gripper_vaccum_off(self):
        self.robot_cmd_client('vacuumOff')
        print('Vaccum Off')
        rospy.sleep(0.3)

    def gripper_suction_up(self):
        self.robot_cmd_client('suctionUp')
        msg = 0.0
        self.suction_pub.publish(msg)
        print('Suction Up')

    def gripper_suction_down(self):
        self.robot_cmd_client('suctionDown')
        # msg = std_msg/Float64()
        msg = -pi/2
        self.suction_pub.publish(msg)
        print('Suction Down')

    def gripper_suction_deg(self, deg):
        str_deg = '{}'.format(deg)
        self.robot_cmd_client(str_deg)

        # msg = std_msg/Float64()
        msg = radians(deg)
        self.suction_pub.publish(msg)

        print('Suction Move : ' + str_deg)

    def is_grip_callback(self, msg):
        self.gripped = msg.data


if __name__ == '__main__':
    rospy.init_node('test_gripper')
    print('test_gripper')
    right_gripper = SuctionTask(_name='right')

    right_gripper.gripper_vaccum_on()
    print('is grip: {}'.format(right_gripper.gripped))
    rospy.sleep(2)

    right_gripper.gripper_vaccum_off()
    print('is grip: {}'.format(right_gripper.gripped))
    rospy.sleep(2)
    right_gripper.gripper_suction_up()
    rospy.sleep(2)
    right_gripper.gripper_suction_down()
    rospy.sleep(2)
    right_gripper.gripper_suction_deg(-40)
