#include "dual_arm.h"
#include <boost/thread.hpp>
#include <boost/lambda/lambda.hpp>
using namespace std;

//#include <thread>
VectorXd Old_JointAngle_L(8);
VectorXd Old_JointAngle_R(8);
bool isfirst_L = true;
bool isfirst_R = true;

void chatterCallback(const std_msgs::Float64MultiArray::ConstPtr& msg)
{
    //boost::thread  *tra_gene_thread_;

    ROS_INFO("I heard: [%f]", msg->data[1]);

 
    VectorXd New_Pos(7);
    New_Pos << msg->data[0],msg->data[1],msg->data[2],msg->data[3],msg->data[4],msg->data[5],msg->data[6];

    
    if(msg->layout.dim[0].label == "L")
    {
        if(isfirst_L)
        {
            Old_JointAngle_L << 0,0,0,0,0,0,0,0;
            ROS_INFO("TRUE");

        }
        ROS_INFO("Old_JointAngle_L: [%f]", Old_JointAngle_L[4]);
        // tra_gene_thread_ = new boost::thread(boost::bind(&left_arm, New_Pos, &Old_JointAngle_L ));
        VectorXd ret(8);
        //boost::thread th( boost::lambda::var( ret ) = left_arm( New_Pos, Old_JointAngle_L ) );
        // delete tra_gene_thread_;
        //ROS_INFO("I heqqqard: [%d]", ret);
        //thread Thread1(ref(left_arm));
        //Old_JointAngle_L = ret;
        //delete th;

        boost::thread th1(left_arm, New_Pos, boost::ref(Old_JointAngle_L));
        isfirst_L = false;
        //left_arm( New_Pos, Old_JointAngle_L );
    }
    else
    {
        if(isfirst_R)
        {
            Old_JointAngle_R << 0,0,0,0,0,0,0,0;
        }
        //tra_gene_thread_ = new boost::thread(boost::bind(&right_arm, New_Pos, Old_JointAngle_R ));
        VectorXd ret1(8);
        //boost::thread th1( boost::lambda::var( ret1 ) = right_arm( New_Pos, Old_JointAngle_R ) );
        //delete tra_gene_thread_;
        //Old_JointAngle_R = ret1;
        //delete th1;
        boost::thread th2(right_arm, New_Pos, boost::ref(Old_JointAngle_R));

        isfirst_R = false;
        //right_arm( New_Pos, Old_JointAngle );
    }
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "listener");
    ros::NodeHandle n;
    ros::Subscriber sub = n.subscribe("chatter", 1000, chatterCallback);
    ros::spin();
    return 0;
}