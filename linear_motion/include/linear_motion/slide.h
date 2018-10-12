#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <unistd.h>
#include <std_msgs/Float64.h>
#include "ros/ros.h"
#include "std_msgs/Int32.h"
#include <boost/thread.hpp>
#include "std_msgs/String.h"
#include "linear_motion/Slide_Feedback.h"
#include "manipulator_h_base_module_msgs/SlideCommand.h"   //new

#include "modbus/modbus.h"

// #define MODE_GET_CURR_POS 291
#define ADDRESS_CMD 88
#define ADDRESS_FDB 204
#define FULL_16_BIT 65535
#define MAX_SPEED   20000
#define ACCELERATION 40000      
#define DECELERATION 40000

uint16_t cmd_arr[16] = {0, 0, 0, 1, 0, 0, 0, MAX_SPEED, 0, ACCELERATION, 0, DECELERATION, 0, 800, 0, 1};
uint16_t fdb_val[6] = {0, 0, 0, 0, 0, 0};
linear_motion::Slide_Feedback msg_fdb;
modbus_t *ct;
int goal_pos, curr_pos, curr_speed; 
double smp_time = 0.01;
boost::thread  *tra_gene_thread_;

void SendCmd();