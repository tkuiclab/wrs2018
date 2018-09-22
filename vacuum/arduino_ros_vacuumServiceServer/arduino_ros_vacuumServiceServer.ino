#include <ros.h>
#include <vacuum_cmd_msg/VacuumCmd.h>
#include <std_msgs/Bool.h>
#include <EEPROM.h>
#include <DynamixelSerial1.h>


#define ID_right  1
#define ID_left   2
#define UPSPEED   150
#define DOWNSPEED 150
#define ADJ_STEP  4
#define POS_LMT   1024


ros::NodeHandle  nh;
using vacuum_cmd_msg::VacuumCmd;

std_msgs::Bool is_grip_msg;
std_msgs::Bool is_stop_msg;
ros::Publisher isGripR("right/is_grip", &is_grip_msg);
ros::Publisher isGripL("left/is_grip", &is_grip_msg);
ros::Publisher isStop("robot/is_stop", &is_stop_msg);

void callback(const VacuumCmd::Request& , VacuumCmd::Response& ,bool);
void callback_right(const VacuumCmd::Request& , VacuumCmd::Response& );
void callback_left(const VacuumCmd::Request& , VacuumCmd::Response& );
ros::ServiceServer<VacuumCmd::Request, VacuumCmd::Response> vac_srv_right("right/suction_cmd", &callback_right);
ros::ServiceServer<VacuumCmd::Request, VacuumCmd::Response> vac_srv_left("left/suction_cmd", &callback_left);

DynamixelClass Dxl_right(Serial3);
DynamixelClass Dxl_left(Serial1);

int MaxPos;
int MinPos;
int MaxPos_right;
int MinPos_right;
int MaxPos_left;
int MinPos_left;
byte MinPos_H_right;
byte MinPos_L_right; 
byte MaxPos_H_right; 
byte MaxPos_L_right; 
byte MinPos_H_left;
byte MinPos_L_left; 
byte MaxPos_H_left; 
byte MaxPos_L_left; 
int addressMin_L_right = 3;
int addressMin_H_right = 5;
int addressMax_L_right = 7;
int addressMax_H_right = 9;
int addressMin_L_left = 13;
int addressMin_H_left = 15;
int addressMax_L_left = 17;
int addressMax_H_left = 19;

const int is_grip_left  = 52;
const int is_grip_right = 50;
const int is_stop       = 48;

const int led_pin = 13;
const int vac_pin_right = 51;
const int vac_pin_left  = 45;
int ID = 0;
int vac_pin = 0;


void setup() 
{
  nh.initNode();
  nh.advertise(isGripR);
  nh.advertise(isGripL);
  nh.advertise(isStop);
  
  nh.advertiseService(vac_srv_right);
  nh.advertiseService(vac_srv_left);
//  nn.initNode();
//  nn.advertiseService(vac_srv_right);
//  nn.advertiseService(vac_srv_left);
  
  pinMode(led_pin, OUTPUT);
  pinMode(vac_pin_right, OUTPUT);
  pinMode(vac_pin_left, OUTPUT);
  
  pinMode(is_grip_left, INPUT_PULLUP);
  pinMode(is_grip_right, INPUT_PULLUP);
  pinMode(is_stop, INPUT_PULLUP);

  Dxl_right.begin(1000000, 2);
  delay(1000);
  Dxl_left.begin(1000000, 2);
  delay(1000);
  Dxl_right.setEndless(ID_right, OFF);
  Dxl_left.setEndless(ID_left, OFF);
  Dxl_right.torqueStatus(ID_right, 0);
  Dxl_left.torqueStatus(ID_left, 0);

  MaxPos_L_right = EEPROM.read(addressMax_L_right);
  MaxPos_H_right = EEPROM.read(addressMax_H_right);
  MaxPos_right = MaxPos_H_right << 8 | MaxPos_L_right;

  MinPos_L_right = EEPROM.read(addressMin_L_right);
  MinPos_H_right = EEPROM.read(addressMin_H_right);
  MinPos_right = MinPos_H_right << 8 | MinPos_L_right;

  MaxPos_L_left = EEPROM.read(addressMax_L_left);
  MaxPos_H_left = EEPROM.read(addressMax_H_left);
  MaxPos_left = MaxPos_H_left << 8 | MaxPos_L_left;

  MinPos_L_left = EEPROM.read(addressMin_L_left);
  MinPos_H_left = EEPROM.read(addressMin_H_left);
  MinPos_left = MinPos_H_left << 8 | MinPos_L_left;
}
DynamixelClass wDxl(bool isRight)
{
  return (isRight)?Dxl_right:Dxl_left;
}
void callback_right(const VacuumCmd::Request& req, VacuumCmd::Response& res)
{
  bool isRight = true;
  ID = ID_right;
  vac_pin = vac_pin_right;
  MaxPos = MaxPos_right;
  MinPos = MinPos_right;
  callback(req, res, isRight);
}
void callback_left(const VacuumCmd::Request& req, VacuumCmd::Response& res)
{
  bool isRight = false;
  ID = ID_left;
  vac_pin = vac_pin_left;
  MaxPos = MaxPos_left;
  MinPos = MinPos_left;
  callback(req, res, isRight);
}

void callback(const VacuumCmd::Request& req, VacuumCmd::Response& res, bool isRight)
{
  if(strcmp(req.cmd, "setMaxPos") == 0)
  {
    MaxPos = wDxl(isRight).readPosition(ID) - ADJ_STEP;
    MaxPos = MaxPos > 0 ? MaxPos : 0;
    if (MaxPos < 0)
    {
      res.success = false;
      return;
    }
    if(isRight)
    {
      MaxPos_L_right = MaxPos;
      MaxPos_H_right = MaxPos >> 8;
      MaxPos_right = MaxPos;
      EEPROM.write(addressMax_H_right, MaxPos_H_right);
      EEPROM.write(addressMax_L_right, MaxPos_L_right);
    }else{
      MaxPos_L_left = MaxPos;
      MaxPos_H_left = MaxPos >> 8;
      MaxPos_left = MaxPos;
      EEPROM.write(addressMax_H_left, MaxPos_H_left);
      EEPROM.write(addressMax_L_left, MaxPos_L_left);
    }
  }
  else if(strcmp(req.cmd, "setMinPos") == 0)
  {
    MinPos = wDxl(isRight).readPosition(ID) + ADJ_STEP;
    MinPos = MinPos < POS_LMT ? MinPos : POS_LMT - 1;
    if (MinPos < 0)
    {
      res.success = false;
      return;
    }

    if(isRight)
    {
      MinPos_L_right = MinPos;
      MinPos_H_right = MinPos >> 8;
      MinPos_right = MinPos;
      EEPROM.write(addressMin_H_right, MinPos_H_right);
      EEPROM.write(addressMin_L_right, MinPos_L_right);
    }else{
      MinPos_L_left = MinPos;
      MinPos_H_left = MinPos >> 8;
      MinPos_left = MinPos;
      EEPROM.write(addressMin_H_left, MinPos_H_left);
      EEPROM.write(addressMin_L_left, MinPos_L_left);
    }
  }
  else if(strcmp(req.cmd, "suctionUp") == 0)
  {
    int count = 0;
    while (wDxl(isRight).moveSpeed(ID, MaxPos, UPSPEED) != 0)
    {
      delay(10);
      if(count++ >=10)
      {
        res.success = false;
        return;
      }
    }
  }
  else if(strcmp(req.cmd, "suctionDown") == 0)
  {   
    int count = 0;
    while (wDxl(isRight).moveSpeed(ID, MinPos, DOWNSPEED) != 0)
    {
      delay(10);
      if(count++ >=10)
      {
        res.success = false;
        return;
      }
    }
  }
  else if(strcmp(req.cmd, "calibration") == 0)
  {
    int count = 0;
    while (wDxl(isRight).torqueStatus(ID, 0) != 0)
    {
      delay(10);
      if(count++ >=10)
      {
        res.success = false;
        return;
      }
    }
  }
  else if(strcmp(req.cmd, "vacuumOn") == 0)
  {   
    digitalWrite(vac_pin, HIGH);
    digitalWrite(led_pin, HIGH);
  }
  else if(strcmp(req.cmd, "vacuumOff") == 0)
  {   
    digitalWrite(vac_pin, LOW);
    digitalWrite(led_pin, LOW);
  }
  else
  {
    String cmd(req.cmd);
    double angle = cmd.toDouble();

    int pos = map(angle, 0.0, -90.0, MaxPos, MinPos);
    int count = 0;
    while (wDxl(isRight).moveSpeed(ID, pos, DOWNSPEED) != 0)
    {
      delay(10);
      if(count++ >=10)
      {
        res.success = false;
        return;
      }
    }
  }
  res.success = true;
}

void loop()
{ 
  is_grip_msg.data = digitalRead(is_grip_right);
  isGripR.publish(&is_grip_msg);

  is_grip_msg.data = digitalRead(is_grip_left);
  isGripL.publish(&is_grip_msg);

  is_stop_msg.data = digitalRead(is_stop);
  isStop.publish(&is_stop_msg);

  nh.spinOnce();
  delay(10);
}
