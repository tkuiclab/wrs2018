#include <ros.h>
#include <vacuum_cmd_msg/VacuumCmd.h>
#include <std_msgs/Bool.h>
#include <EEPROM.h>
#include <DynamixelSerial1.h>


#define ID_right  1
#define ID_left   2
#define UPSPEED   150
#define DOWNSPEED 150
#define ADJ_STEP  16
#define POS_LMT   1024


ros::NodeHandle  nh;
using vacuum_cmd_msg::VacuumCmd;

std_msgs::Bool IfSuck_msg;
ros::Publisher IfSuck("right/is_grip", &IfSuck_msg);

void callback(const VacuumCmd::Request& , VacuumCmd::Response& );
void callback_right(const VacuumCmd::Request& , VacuumCmd::Response& );
void callback_left(const VacuumCmd::Request& , VacuumCmd::Response& );
ros::ServiceServer<VacuumCmd::Request, VacuumCmd::Response> vac_srv_right("right/suction_cmd", &callback_right);
ros::ServiceServer<VacuumCmd::Request, VacuumCmd::Response> vac_srv_left("left/suction_cmd", &callback_left);

DynamixelClass Dxl_right(Serial3);
DynamixelClass Dxl_left(Serial1);

int MaxPos;
int MinPos;
byte MinPos_H;
byte MinPos_L; 
byte MaxPos_H; 
byte MaxPos_L; 
int addressMin_L = 13;
int addressMin_H = 15;
int addressMax_L = 17;
int addressMax_H = 19;

const int pin4 = 52;
const int pin5 = 50;
const int pin6 = 48;
const int pin7 = 46;
const int pin8 = 44;
const int led_pin = 13;
const int vac_pin_right = 51;
const int vac_pin_left  = 45;
int ID = 0;
int vac_pin = 0;


void setup() 
{
  nh.initNode();
  nh.advertise(IfSuck);
  nh.advertiseService(vac_srv_right);
  nh.advertiseService(vac_srv_left);
//  nn.initNode();
//  nn.advertiseService(vac_srv_right);
//  nn.advertiseService(vac_srv_left);
  
  pinMode(led_pin, OUTPUT);
  pinMode(vac_pin_right, OUTPUT);
  pinMode(vac_pin_left, OUTPUT);
  
  pinMode(pin7, INPUT_PULLUP);
  pinMode(pin8, INPUT_PULLUP);
  pinMode(pin6, INPUT_PULLUP);
  pinMode(pin5, INPUT_PULLUP);
  pinMode(pin4, INPUT_PULLUP);

  Dxl_right.begin(1000000, 2);
  delay(1000);
  Dxl_left.begin(1000000, 2);
  delay(1000);
  Dxl_right.setEndless(ID_right, OFF);
  Dxl_left.setEndless(ID_left, OFF);
  Dxl_right.torqueStatus(ID_right, 0);
  Dxl_left.torqueStatus(ID_left, 0);

  MaxPos_L = EEPROM.read(addressMax_L);
  MaxPos_H = EEPROM.read(addressMax_H);
  MaxPos = MaxPos_H << 8 | MaxPos_L;

  MinPos_L = EEPROM.read(addressMin_L);
  MinPos_H = EEPROM.read(addressMin_H);
  MinPos = MinPos_H << 8 | MinPos_L;
}
DynamixelClass wDxl(bool rl)
{
  return (rl)?Dxl_right:Dxl_left;
}
void callback_right(const VacuumCmd::Request& req, VacuumCmd::Response& res)
{
  bool rl = true;
  ID = ID_right;
  vac_pin = vac_pin_right;
  callback(req, res, rl);
}
void callback_left(const VacuumCmd::Request& req, VacuumCmd::Response& res)
{
  bool rl = false;
  ID = ID_left;
  vac_pin = vac_pin_left;
  callback(req, res, rl);
}

void callback(const VacuumCmd::Request& req, VacuumCmd::Response& res, bool rl)
{
  if(strcmp(req.cmd, "setMaxPos") == 0)
  {
    MaxPos = wDxl(rl).readPosition(ID) - ADJ_STEP;
    MaxPos = MaxPos > 0 ? MaxPos : 0;
    if (MaxPos < 0)
    {
      res.success = false;
      return;
    }

    MaxPos_L = MaxPos;
    MaxPos_H = MaxPos >> 8;
    
    EEPROM.write(addressMax_H, MaxPos_H);
    EEPROM.write(addressMax_L, MaxPos_L);
  }
  else if(strcmp(req.cmd, "setMinPos") == 0)
  {
    MinPos = wDxl(rl).readPosition(ID) ;//+ ADJ_STEP;
    MinPos = MinPos < POS_LMT ? MinPos : POS_LMT - 1;
    if (MinPos < 0)
    {
      res.success = false;
      return;
    }

    MinPos_L = MinPos;
    MinPos_H = MinPos >> 8;
    
    EEPROM.write(addressMin_H, MinPos_H);
    EEPROM.write(addressMin_L, MinPos_L);
  }
  else if(strcmp(req.cmd, "suctionUp") == 0)
  {
    if (wDxl(rl).moveSpeed(ID, MaxPos, UPSPEED) != 0)
    {
      res.success = false;
      return;
    }
  }
  else if(strcmp(req.cmd, "suctionDown") == 0)
  {   
    if (wDxl(rl).moveSpeed(ID, MinPos, DOWNSPEED) != 0)
    {
      res.success = false;
      return;
    }
  }
  else if(strcmp(req.cmd, "calibration") == 0)
  {
    wDxl(rl).torqueStatus(ID, 0);
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

    int pos = map(-angle, 90.0, 0.0, MaxPos, MinPos);
    int count = 0;
    while (wDxl(rl).moveSpeed(ID, pos, DOWNSPEED) != 0)
    {
      delay(50);
      if(count++ >=20)
      {
        res.success = false;
        return;
      }
    }
//    if (wDxl(rl).moveSpeed(ID, pos, DOWNSPEED) != 0)
//    {
//      delay(50);
//      if (wDxl(rl).moveSpeed(ID, pos, DOWNSPEED) != 0)
//      {
//        delay(50);
//        if (wDxl(rl).moveSpeed(ID, pos, DOWNSPEED) != 0)
//        {
//      
//          res.success = false;
//          return;
//        }
//      }
//    }
  }
  res.success = true;
}

void loop()
{ 
  // byte data[5] = {digitalRead(pin4) , digitalRead(pin5) , digitalRead(pin6) , digitalRead(pin7) , digitalRead(pin8)};

  // IfSuck_msg.data_length = 5;
  IfSuck_msg.data = digitalRead(pin4);
  IfSuck.publish(&IfSuck_msg);

  nh.spinOnce();
  delay(10);
//  nn.spinOnce();
//  delay(10);
}
