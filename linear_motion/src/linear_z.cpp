#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <unistd.h>
#include <std_msgs/Float64.h>
#include "ros/ros.h"
#include "std_msgs/Int32.h"

#include "std_msgs/String.h"
#include "linear_motion/LM_Cmd.h"
#include "modbus/modbus.h"

#define LOOP 1
#define MODE_GET_CURR_POS 291
#define ADDRESS_START 0
#define ADDRESS_END 99
// #define position

std_msgs::Int32 std_msg;
std_msgs::Int32 feedback;
ros::Publisher feedback_pub;
linear_motion::LM_Cmd LM_Msg;
bool pub_flag = false;
modbus_t *ctx, *ctz, *ct_left, *tmp_ct;
int curr_state = 10;

void SendCmd(bool Is_Pub, modbus_t* ct, int pos);
std::string LM_x_state = "idle";

bool is_x_busy = false;


void slide_callback(const std_msgs::Float64 &slide_command)
{
    int pos = -(double)100000.0*slide_command.data;
    SendCmd(true, ctx    , pos);
    LM_x_state = "execute";
    pub_flag = true;
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
    }
    return ct;
}

void SendCmd(bool Is_Pub, modbus_t* ct, int pos)
{
    int rc;
    //輸入寫入
    rc = modbus_write_register(ct, 125, 0);

    // //運轉方式
    // rc = modbus_write_register(ct, 6144, 0);
    // rc = modbus_write_register(ct, 6145, 1);

    //位置
    int up_pos = pos-65535;
    if(up_pos<=0)
    {
        rc = modbus_write_register(ct, 6146, 0);
        rc = modbus_write_register(ct, 6147, pos);
    }
    else
    {
        rc = modbus_write_register(ct, 6146, 1);
        rc = modbus_write_register(ct, 6147, up_pos);
        std::cout<<"up pos = "<<up_pos<<"\n";
    }

    // //最大速度
    // rc = modbus_write_register(ct, 6148, 0);
    // rc = modbus_write_register(ct, 6149, 10000);

    // //加速度
    // rc = modbus_write_register(ct, 6150, 0);
    // rc = modbus_write_register(ct, 6151, 80000);

    // //減速度
    // rc = modbus_write_register(ct, 6152, 0);
    // printf("6152 rc=%d\n",rc);
    // rc = modbus_write_register(ct, 6153, 80000);
    // printf("6153 rc=%d\n",rc);

    // //運轉電流
    // rc = modbus_write_register(ct, 6154, 0);
    // rc = modbus_write_register(ct, 6155, 500);

    // //結合
    // rc = modbus_write_register(ct, 6158, 0);
    // rc = modbus_write_register(ct, 6159, 0);

    //輸入啟動
    rc = modbus_write_register(ct, 125, 8);

    //輸出結束
    rc = modbus_write_register(ct, 127, 8);

    pub_flag = false;
}

bool Is_LMBusy(modbus_t* ct, uint16_t * tab_rp_registers, uint16_t * tab_rq_registers)
{
    curr_state = modbus_write_register(ct, 257, 1);
    curr_state = modbus_read_registers(ct, 257, 1, tab_rp_registers);
    return (tab_rq_registers[0] != tab_rp_registers[0])?false:true;
}
int Get_CurrPos(modbus_t* ct, uint16_t * tab_rp_registers, uint16_t * tab_rq_registers)
{
    curr_state = modbus_write_register(ct, 291, 1);
    curr_state = modbus_read_registers(ct, 291, 1, tab_rp_registers);
    return tab_rp_registers[0];
}

linear_motion::LM_Cmd Update_LMMsg(uint16_t * tab_rp_registers, uint16_t * tab_rq_registers, std::string &LM_x_state)
{
    linear_motion::LM_Cmd LM;

    is_x_busy    = Is_LMBusy(ctx    , tab_rp_registers, tab_rq_registers);
   
    LM.x_curr_pos    = Get_CurrPos(ctx    , tab_rp_registers, tab_rq_registers);
   
    if (LM_x_state == "execute")
    {
        if (is_x_busy == true)
        {
            // std::cout<<"=== 2 ===\n";
            LM.status = "LM_busy";
            if(is_x_busy == false)         LM_x_state       = "idle";
        }

        // else if ((is_x_busy == false)&&(is_z_busy == false)&&(is_left_busy == false))
        else if (is_x_busy == false)
        {
            // std::cout<<"=== 3 ===\n";
            LM.status     = "LM_complete";
            LM_x_state    = "idle";
            LM.id = 5;
        }
        else 
        {
            std::cout<<"=== 4 ===\n";
            LM.status  = "error";
        }
    }
    else
    {
        LM.status = "LM_idle";
        LM_x_state = "idle";
    }

    return LM;
}

int main(int argc, char **argv)
{
    bool isbusy   = false;
    int  curr_pos = -1;

    // For Allocate_and_Init_MemorySpace
    int nb = 99;
    uint16_t *tab_rq_registers = (uint16_t *)malloc(nb * sizeof(uint16_t));
    uint16_t *tab_rp_registers = (uint16_t *)malloc(nb * sizeof(uint16_t));
    memset(tab_rq_registers, 0, nb * sizeof(uint16_t));
    memset(tab_rp_registers, 0, nb * sizeof(uint16_t));

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
    ctx     = Init_Modus_RTU(Connect_X_OK   , ID, "/dev/wrs/slide_" + side_str, 9600);

    if(Connect_X_OK == false)
    {
        if(Connect_X_OK    == false)   std::cout<<"CONNECT X ERROR!!!!!\n";
        //return -1;
    }
    else
    {
        std::cout<<"All LM Connect ok\n";
    }

    // ============================= Subscribe message =============================
    std::string side_label = "right" == side_str ? "r": "l";
    ros::NodeHandle n;
    ros::Subscriber sub = n.subscribe("/mobile_dual_arm/" + side_label + "_slide_position/command", 10, slide_callback);
    ros::Publisher  pub = n.advertise<linear_motion::LM_Cmd>("/LM_FeedBack", 1);
    ros::Rate loop_rate(50);

    // ============================= ROS Loop =============================
    bool is_send1 = false;

    rc = modbus_write_register(ct, 125, 0);

    //運轉方式
    rc = modbus_write_register(ct, 6144, 0);
    rc = modbus_write_register(ct, 6145, 1);

    //最大速度
    rc = modbus_write_register(ct, 6148, 0);
    rc = modbus_write_register(ct, 6149, 10000);

    //加速度
    rc = modbus_write_register(ct, 6150, 0);
    rc = modbus_write_register(ct, 6151, 80000);

    //減速度
    rc = modbus_write_register(ct, 6152, 0);
    printf("6152 rc=%d\n",rc);
    rc = modbus_write_register(ct, 6153, 80000);
    printf("6153 rc=%d\n",rc);

    //運轉電流
    rc = modbus_write_register(ct, 6154, 0);
    rc = modbus_write_register(ct, 6155, 500);

    //結合
    rc = modbus_write_register(ct, 6158, 0);
    rc = modbus_write_register(ct, 6159, 0);

    //輸入啟動
    rc = modbus_write_register(ct, 125, 8);

    //輸出結束
    rc = modbus_write_register(ct, 127, 8);

    while (ros::ok())
    {
        pub.publish(LM_Msg);
        loop_rate.sleep();
        ros::spinOnce();
    }
    return 0;
}
