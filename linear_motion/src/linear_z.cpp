#include "linear_motion/slide.h"

void slide_callback(const manipulator_h_base_module_msgs::SlideCommand::ConstPtr& msg)
{
    goal_pos = -(double)100000.0*msg->pos;

    if(goal_pos <= FULL_16_BIT)
    {
        cmd_arr[4] = 0;
        cmd_arr[5] = goal_pos;
    }
    else
    {
        cmd_arr[4] = 1;
        cmd_arr[5] = goal_pos - FULL_16_BIT;
    }
}

modbus_t* Init_Modus_RTU(bool &Is_Success, int ID, std::string Port, int BaudRate)
{
    modbus_t*ct = modbus_new_rtu(Port.c_str(), 9600, 'E', 8, ID);
    modbus_set_slave(ct, ID);
    if (modbus_connect(ct) == -1)
    {
        fprintf(stderr, "Connection failed: %s\n",
        modbus_strerror(errno));
        std::cout<<"ERR connect\n";
        modbus_free(ct);
        Is_Success = false;
    }
    else
    {
        std::cout<<"init ok\n";
        Is_Success = true;
        // modbus_set_debug(ct, true);
    }
    int rc = modbus_read_registers(ct, ADDRESS_FDB, 2, fdb_val);
        
    curr_pos = fdb_val[0] * FULL_16_BIT + fdb_val[1];
    goal_pos = curr_pos;
    return ct;
}

void SendCmd()
{
    int rc, diff_pos, speed = 0, speed_tmp;
    int smp_deleration = DECELERATION * smp_time;
    ros::Rate loop_rate(1 / smp_time);
    while(ros::ok())
    {
        if(goal_pos != curr_pos)
        {
            diff_pos = abs(goal_pos - curr_pos);
            speed_tmp = diff_pos / smp_time;
            speed_tmp = (speed_tmp < MAX_SPEED) ? speed_tmp : MAX_SPEED;
            speed = (speed_tmp < speed) ? (((speed - speed_tmp) < smp_deleration) ? speed_tmp : speed - smp_deleration) : speed_tmp;
            // speed = (speed_tmp < speed) ? speed : speed_tmp;
            cmd_arr[7] = speed;

            std::cout<<"speed = "<<cmd_arr[7]<<std::endl;
            rc = modbus_write_registers(ct, ADDRESS_CMD, 16, cmd_arr);
            if (rc != 16) {
                fprintf(stderr, "modbus write failed: %d %s\n", errno, modbus_strerror(errno));
                errno = 0;
            }
        }
        else
            speed = 0;

        rc = modbus_read_registers(ct, ADDRESS_FDB, 2, fdb_val);
        if (rc != 2) {
            fprintf(stderr, "modbus read failed: %d %s\n", errno, modbus_strerror(errno));
            errno = 0;
        }

        curr_pos = fdb_val[0] * FULL_16_BIT + fdb_val[1];
        
        loop_rate.sleep();
        ros::spinOnce();
    }
}



int main(int argc, char **argv)
{
    //========================= Initialize ROS =============================
    ros::init(argc, argv, "linear_z");
    
    ros::NodeHandle nh_param("~");
    std::string side_str;
    int  baud_rate;
    

    nh_param.param<std::string>("side", side_str, "");
    nh_param.param<int>("baud", baud_rate, 9600);
  
    //========================= Initialize Modbus_RTU ============================= 
    bool Connect_X_OK = false;
    int  ID = side_str == "right" ? 1 : 3;

    std::cout<<"Linear Start\n";

    ct = Init_Modus_RTU(Connect_X_OK   , ID, "/dev/wrs/slide_" + side_str, 1000000);

    std::cout<<"Linear Initted\n";

    if(Connect_X_OK == false)
    {
        if(Connect_X_OK    == false)   std::cout<<"CONNECT " + side_str + " ERROR!!!!!\n";
        //return -1;
    }
    else
    {
        std::cout<<side_str + " Slide Connect ok\n";
    }
 
    tra_gene_thread_ = new boost::thread(boost::bind( &SendCmd ));    
    delete tra_gene_thread_;

    // ============================= Subscribe message =============================
    // std::string side_label = "right" == side_str ? "r": "l";
    ros::NodeHandle n;
    ros::Subscriber sub = n.subscribe("/slide_command_msg", 1, slide_callback);
    ros::Publisher  pub = n.advertise<linear_motion::Slide_Feedback>("/slide_feedback_msg", 1);
    ros::Rate loop_rate(125);

    // ============================= ROS Loop =============================
    // int i = 0;
    while (ros::ok())
    {
        msg_fdb.curr_pos = curr_pos;
        pub.publish(msg_fdb);
        loop_rate.sleep();
        ros::spinOnce();
    }
    return 0;
}
