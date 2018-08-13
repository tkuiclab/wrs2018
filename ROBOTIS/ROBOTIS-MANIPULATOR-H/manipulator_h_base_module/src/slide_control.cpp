#include "manipulator_h_base_module/slide_control.h"
#include <string>

using namespace robotis_manipulator_h;

slide_control::slide_control()
{
    ros::NodeHandle nh_private("~");
    std::string side_str  = nh_private.param<std::string>("side", "");
    std::string side_label = "right" == side_str ? "r": "l";

    slide_pos_pub = n.advertise<std_msgs::Float64>("/mobile_dual_arm/" + side_label + "_slide_position/command", 5);

    slide_pos = 0;
    goal_slide_pos = 0;
}
slide_control::~slide_control()
{
}

void slide_control::slide_pub()
{
    std_msgs::Float64 msg;

    if(result_slide_pos != slide_pos)
    {
        msg.data = result_slide_pos;
        slide_pos_pub.publish(msg);
        slide_pos = result_slide_pos;
    }
}