#include <iostream>
#include <cmath>
#include "dual_arm.h"

using namespace Eigen;
#define _USE_MATH_DEFINES
#define pi M_PI


bool kinematics_slide_left( VectorXd &, VectorXd &, VectorXd & );
VectorXd InverseKinematics_left( double &, double &, double &, double &, double &, double &, double &, double &, double &, double &, double &, double &, double &, MatrixXd &, MatrixXd &, MatrixXd &, MatrixXd &, MatrixXd &, VectorXd & );
bool ForwardKinematics_left( VectorXd &, double &, double &, double &, double &, double &, double &, double &, double &, MatrixXd &, MatrixXd &, MatrixXd &, MatrixXd &, MatrixXd & );
MatrixXd DHparameter_left( double &, double &, double &, double &, double &, double &, double & );
MatrixXd Trans_left( double &, VectorXd  & );
bool rospub_left( VectorXd &, VectorXd & );

VectorXd left_arm( VectorXd &New_Pos, VectorXd &Old_JointAngle )
{
  double X;
  double Y;
  double Z;
  double Pitch;
  double Roll;
  double Yaw;
  double Phi;
  double X_0;
  double Y_0;
  double Z_0;
  double Pitch_0;
  double Roll_0;
  double Yaw_0;
  double Phi_0;
  //VectorXd New_Pos(7);
  //VectorXd Old_JointAngle(8);
  VectorXd JointAngle(8);
  
  X_0 = 0;     Y_0 = 0;     Z_0 = 0;
  Pitch_0 = 0;  Roll_0 = 0;  Yaw_0 = 0;
  Phi_0 = 0;

  X =10;     Y = 20;     Z = -40;
  Pitch = 0;  Roll = 0;  Yaw = 0;
  Phi = -50;

  //New_Pos<< X, Y, Z, Pitch, Roll, Yaw, Phi;
  // vgbfOld_JointAngle << 0, 0, 0, 0, 0, 0, 0, 0;
  kinematics_slide_left( New_Pos, Old_JointAngle, JointAngle );
  std::cout << "JointAngle = " << JointAngle << std::endl;
  rospub_left( JointAngle, Old_JointAngle );
  Old_JointAngle =  JointAngle;
  
  
  return JointAngle;
}
bool kinematics_slide_left( VectorXd &New_Pos, VectorXd &Old_JointAngle, VectorXd &JointAngle )
{
  //////////////////////////////////////////////////////////////////////////////
  int dof = 8;
  
  double d1 = 17.6+9.25;
  double d2 = 29;
  double d3 = 26.3;
  double d4 = 13.5;
  double a1 = 3;
  double a2 = 3;
  double ZZZ = 0;
  
  double X = New_Pos(0);
  double Y = New_Pos(1);
  double Z = New_Pos(2);
  double Pitch = New_Pos(3);
  double Roll = New_Pos(4);
  double Yaw = New_Pos(5);
  double Phi = New_Pos(6);


  
  MatrixXd TT_pos(3,9);
  MatrixXd TT_pry(3,9);
  MatrixXd TT_n(3,9);
  MatrixXd TT_o(3,9);
  MatrixXd TT_a(3,9);
  
  
  
  //////////////////////////////////////////////////////////////////////////////
  Pitch = Pitch*pi/180;
  Roll = Roll  *pi/180;
  Yaw = Yaw    *pi/180;
  Phi = Phi    *pi/180;
  JointAngle = InverseKinematics_left( X, Y, Z , Pitch , Roll , Yaw , Phi ,d1,d2,d3,d4,a1,a2, TT_pos, TT_pry, TT_n, TT_o, TT_a, Old_JointAngle );
}

MatrixXd DHparameter_left( double &d1,double &d2,double &d3,double &d4,double &a1,double &a2,double &ZZZ )
{
  MatrixXd DHTABLE(8,4);
  DHTABLE << 0,  -pi/2, ZZZ, 0,         //左右不同
             0,  -pi/2, d1,  pi/2,
             0,  -pi/2, 0,  -pi/2,
            -a1,  pi/2, d2,  0,
             a2, -pi/2, 0,   0, 
             0,   pi/2, d3,  0,
             0,  -pi/2, 0,   0,
             0,   0,    d4,  0;
  return DHTABLE;
}

MatrixXd Trans_left( double &Theta, VectorXd &DH )
{
  double c_th = cos(Theta + DH(3));
  double s_th = sin(Theta + DH(3));
  double c_alp = cos(DH(1));
  double s_alp = sin(DH(1));
  MatrixXd A(4,4);
  A << c_th, -s_th*c_alp,  s_th*s_alp,  DH(0)*c_th,
       s_th,  c_th*c_alp, -c_th*s_alp,  DH(0)*s_th,
       0,     s_alp,       c_alp,       DH(2),
       0,     0,           0,           1;  
  return A;
}

bool ForwardKinematics_left( VectorXd &JointAngle,double &dof,double &d1,double &d2,double &d3,double &d4,double &a1,double &a2,double &ZZZ, MatrixXd &TT_pos, MatrixXd &TT_pry, MatrixXd &TT_n, MatrixXd &TT_o, MatrixXd &TT_a )
{
  double p=0;
  double r=0;
  double y=0;
  MatrixXd DHTABLE(8,4);
  MatrixXd T = MatrixXd::Identity(4,4);
  MatrixXd A(4,4);
  VectorXd DH_row(4);

  DHTABLE = DHparameter_left( d1,d2,d3,d4,a1,a2,ZZZ );
  JointAngle(0) = 0;

  for ( int i=0; i<dof; i++ )
  {
    DH_row = DHTABLE.row(i);
    A = Trans_left(JointAngle(i), DH_row);
    T = T*A;
    p = asin(T(0,1));  ////////??????????????????????????//
    if (p == pi/2) 
    {
      y = 0;
      r = atan2(T(0,0),T(1,0));
    }
    else if (p == -pi/2)
    {
      y = 0;
      r = -atan2(T(0,0),T(1,0));
    }
    else
    {
      y = atan2(-T(1,1), T(0,1));
      r = atan2(T(2,0), -T(2,2));
    }
    TT_pos(0,i) = T(0,3);
    TT_pos(1,i) = T(1,3);
    TT_pos(2,i) = T(2,3);
    TT_pry(0,i) = p;
    TT_pry(1,i) = r;
    TT_pry(2,i) = y;
    TT_n(0,i) = T(0,0);
    TT_n(1,i) = T(1,0);
    TT_n(2,i) = T(2,0);
    TT_o(0,i) = T(0,1);
    TT_o(1,i) = T(1,1);
    TT_o(2,i) = T(2,1);
    TT_a(0,i) = T(0,2);
    TT_a(1,i) = T(1,2);
    TT_a(2,i) = T(2,2);
  }
  std::cout<<"pryprypryprypry"<<std::endl<<TT_pry<<std::endl;
}

VectorXd InverseKinematics_left( double &X, double &Y, double &Z , double &Pitch , double &Roll , double &Yaw , double &Phi ,double &d1,double &d2,double &d3,double &d4,double &a1,double &a2, MatrixXd &TT_pos, MatrixXd &TT_pry, MatrixXd &TT_n, MatrixXd &TT_o, MatrixXd &TT_a, VectorXd &Old_JointAngle )
{
  int isMatch = 0;
  double ZZZ = 0;
  double  c_p = cos(Pitch);
  double  s_p = sin(Pitch);
  double  c_r = cos(Roll);
  double  s_r = sin(Roll);
  double  c_y = cos(Yaw);
  double  s_y = sin(Yaw);
  double theta_e = 0;
  double theta_1 = 0;
  double theta_2 = 0;
  double theta_3 = 0;
  double theta_4 = 0;
  double theta_5 = 0;
  double theta_6 = 0;
  double theta_7 = 0;
  double Deviation = 0;
  double D_Joint_1 = 0;
  double D_Joint_2 = 0;


  VectorXd JointAngle(8);
  VectorXd Angle(5);
  VectorXd TestJoint1(6);
  VectorXd XYZ(3);
  VectorXd Oc(3);
  VectorXd testOc(3);
  VectorXd Ps(3);
  VectorXd Vsw(3);
  double Lsw;
  double Lse;
  double Lew;
  double Lec;
  double Lsc;
  VectorXd eRc(3);
  VectorXd DH_row(4);
  VectorXd tmp_JointAngle(8);
  
  MatrixXd DHTABLE(8,4);
  MatrixXd DH(5,4);
  MatrixXd R03(4,4);
  MatrixXd R04(4,4);
  MatrixXd R07(4,4);
  MatrixXd R47(4,4);
  MatrixXd A(4,4);
  MatrixXd T(4,4);
  MatrixXd RY(4,4);
  MatrixXd RP(4,4);
  MatrixXd RR(4,4);
  MatrixXd Origin(4,4);

  RY << 1,  0,    0,    X,
        0,  c_y, -s_y,  Y,
        0,  s_y,  c_y,  Z, 
        0,  0,    0,    1;
  RP <<  c_p,  0,  s_p,  X,
         0,    1,  0,    Y,
        -s_p,  0,  c_p,  Z,
         0,    0,  0,    1;   
  RR << c_r, -s_r, 0,  X,
         s_r, c_r, 0,  Y,
         0,   0,   1,  Z,
         0,   0,   0,  1;
  Origin << 1,  0,  0,  X,
            0, -1,  0,  Y,
            0,  0, -1,  Z,
            0,  0,  0,  1;
  R07 = Origin*RP*RY*RR;        
 
  XYZ << X, Y, Z;
  Oc << XYZ(0)-d4*R07(0,2), XYZ(1)-d4*R07(1,2), XYZ(2)-d4*R07(2,2);

  ////////////////////////////////////////////////////////////////////////////////////////
  testOc = Oc;
  testOc(1) = testOc(1) - d1;  //左右不同
  if(testOc.norm()>(d2+d3))
  {
    if(Oc(2) < -80){
        testOc << testOc(0), testOc(1), testOc(2)-(-80);
    }else{
        testOc << testOc(0), testOc(1), 0;
    }  
    if(Oc(2)>0 && testOc.norm()>(d2+d3))
    {
        JointAngle << 0, 0, 0, 0, 0, 0, 0, 0;
        return JointAngle;
    }
    ZZZ = Oc(2);
    for( int i = 1; i<=5; i++ )
    {
      ZZZ = Oc(2) - Oc(2)/(pow(2,i));
      if(ZZZ<-80)
      {
          ZZZ = -80;
      }
      testOc(2) = Oc(2)-ZZZ;
      if(testOc.norm()<(d2+d3))
      {
          break;
      }
      if(i==5)
      {
          JointAngle << 0, 0, 0, 0, 0, 0, 0, 0;
          return JointAngle;
      }
    }
  }                 
  ////////////////////////////////////////////////////////////////////////////////////////////////

  Ps << 0, d1, ZZZ;   //左右不同
  Vsw = Oc - Ps;     
  Lsw = Vsw.norm();  
  Lse = sqrt(pow(a1,2)+pow(d2,2));
  Lew = sqrt(pow(a2,2)+pow(d3,2));
  theta_e = acos((Lse*Lse + Lsw*Lsw - Lew*Lew) / (2*Lse*Lsw));  
  eRc = Ps + (Vsw * Lse * cos(theta_e) / Lsw);
  //////////////////////////////////////////////////////////////////////////////////////////
  Lsc = Lse * cos(theta_e); 
  Lec = Lse * sin(theta_e); 

  DH << 0,   -pi/2, ZZZ, 0,    //左右不同
        0,   -pi/2, d1,  pi/2,
        0,   -pi/2, 0,  -pi/2, 
        Lec,  pi/2, Lsc, 0,    
        0,    0,    0,   0;
  
  theta_1 = atan2(-eRc(0) , -(eRc(2)-ZZZ));   //左右不同
  theta_2 = asin(-(eRc(1)-d1) / Lsc);         //左右不同
  theta_3 = Phi;
  theta_4 = -(theta_e + atan(a1/d2));
 
  Angle << 0, theta_1, theta_2, theta_3, theta_4;
  T = MatrixXd::Identity(4,4);

  for ( int i=0; i<5; i++ )
  {
    DH_row = DH.row(i);
    A = Trans_left( Angle(i), DH_row );   //左右不同
    T = T*A;
  }
  R03 = T;

  DHTABLE = DHparameter_left( d1,d2,d3,d4,a1,a2,ZZZ );  //左右不同
  theta_4 = M_PI - acos((Lse*Lse + Lew*Lew - Lsw*Lsw) / (2*Lse*Lew)) + atan(a1/d2) + atan(a2/d3);
  
  DH_row = DHTABLE.row(4);
  A = Trans_left(theta_4, DH_row);   //左右不同
  R04 = R03 * A;

  JointAngle << 0, 0, 0, 0, 0, 0, 0, 0;
  theta_1 = atan(-R03(0,1)/-R03(2,1));    //左右不同
  theta_2 = asin(-R03(1,1));             //左右不同
  theta_3 = atan(R03(1,2)/R03(1,0));     //左右不同

  R47 = R04.inverse() * R07;
  theta_5 = atan(-R47(1,2) / -R47(0,2));
  theta_6 = acos(R47(2,2));
  theta_7 = atan(-R47(2,1) / R47(2,0));

  ////////////////////////////////////////////////////////////////////////////////////////////

  for ( int i = 1; i>= -1; i-=2 )
  { 
    if( -R03(2,1)*i>= 0)  
        JointAngle(1) = theta_1;
    else if( -R03(2,1)*i<0 && theta_1>=0 )  
        JointAngle(1) = theta_1 - pi;
    else                                 
        JointAngle(1) = pi + theta_1;
    
    if ( i == 1 )
        JointAngle(2) = theta_2;
    else
        JointAngle(2) = (theta_2/fabs(theta_2))*(pi - fabs(theta_2));
    
    if(R03(1,0)*i>=0)                         //左右不同
        JointAngle(3) = theta_3;
    else if(R03(1,0)*i<0 && theta_3>=0)       //左右不同
        JointAngle(3) = theta_3 - pi;
    else
        JointAngle(3) = pi + theta_3;
    

    JointAngle(4) = theta_4;
    TestJoint1 << 0, JointAngle(1), JointAngle(2), JointAngle(3), JointAngle(4), JointAngle(5);
    double dof1 = 6;
    ForwardKinematics_left(TestJoint1,dof1,d1,d2,d3,d4,a1,a2,ZZZ, TT_pos, TT_pry, TT_n, TT_o, TT_a );

    VectorXd testPos = TT_pos.col(5) - Oc;
    Deviation = testPos.norm();
    if ( Deviation < 0.01 )
    {
        isMatch = isMatch + 1;
        if( i == 1 )
        {
            D_Joint_1 = (JointAngle - Old_JointAngle).cwiseAbs().maxCoeff();
            tmp_JointAngle = JointAngle;
        }
        else
        {
            D_Joint_2 = (JointAngle - Old_JointAngle).cwiseAbs().maxCoeff();
        }
    }  
    if( isMatch == 0 )
    {
        JointAngle = Old_JointAngle;
    }
    else if( isMatch == 1 && D_Joint_2 == 0)
    {
        JointAngle = tmp_JointAngle;
    }
    else if( isMatch == 2 && D_Joint_1 < D_Joint_2 )
    {
        JointAngle = tmp_JointAngle;
    }
  }

  isMatch = 0;
  tmp_JointAngle = JointAngle;
  D_Joint_1 = 0;
  D_Joint_2 = 0;

  for ( int i = 1; i>=-1; i-=2 ) 
  {
    if( -R47(0,2)*i>=0 )
        JointAngle(5) = theta_5;
    else if( -R47(0,2)*i<0 && theta_5>=0 )  
        JointAngle(5) = theta_5 - pi;
    else
        JointAngle(5) = pi + theta_5;   
    
    if (i == 1)
        JointAngle(6) = theta_6;
    else
        JointAngle(6) = -theta_6;
    
            
    if( R47(2,0)*i>=0 )
        JointAngle(7) = theta_7;
    else if( R47(2,0)*i<0 && theta_7>=0 )
        JointAngle(7) = theta_7 - pi;
    else
        JointAngle(7) = pi + theta_7;
    double dof2 = 8;
    ForwardKinematics_left(JointAngle,dof2,d1,d2,d3,d4,a1,a2,ZZZ, TT_pos, TT_pry, TT_n, TT_o, TT_a );  //左右不同
    
    VectorXd testPos = TT_pos.col(7) - XYZ;
    VectorXd Joint_dev(8);
    Deviation = testPos.norm();
    if ( Deviation < 0.01 )
    {
        isMatch = isMatch + 1;
        if( i == 1 )
        {
            D_Joint_1 = (JointAngle - Old_JointAngle).cwiseAbs().maxCoeff();
            tmp_JointAngle = JointAngle;
        }
        else
        {
            D_Joint_2 = (JointAngle - Old_JointAngle).cwiseAbs().maxCoeff();
        }
    }  
    if( isMatch == 0 )
    {
        JointAngle = Old_JointAngle;
    }
    else if( isMatch == 1 && D_Joint_2 == 0)
    {
        JointAngle = tmp_JointAngle;
    }
    else if( isMatch == 2 && D_Joint_1 < D_Joint_2 )
    {
        JointAngle = tmp_JointAngle;
    }
  }
  /////////////////////////////////////////////////////////////////////////////////////////////////
  JointAngle(0) = ZZZ;
  return JointAngle;
}

bool rospub_left ( VectorXd &JointAngle, VectorXd &Old_JointAngle)
{
    // int argc;
    // char **argv;
    // ros::init(argc, argv, "talker");
    VectorXd Angle_tick(8);
    ros::NodeHandle n;
    ros::Rate loop_rate(10);
    ros::Publisher Slide_L_pub = n.advertise<std_msgs::Float64>("/mobile_dual_arm/Slide_L_position_controller/command", 1000);
    ros::Publisher Joint_L1_pub = n.advertise<std_msgs::Float64>("/mobile_dual_arm/l_joint1_position/command", 1000);
    ros::Publisher Joint_L2_pub = n.advertise<std_msgs::Float64>("/mobile_dual_arm/l_joint2_position/command", 1000);
    ros::Publisher Joint_L3_pub = n.advertise<std_msgs::Float64>("/mobile_dual_arm/l_joint3_position/command", 1000);
    ros::Publisher Joint_L4_pub = n.advertise<std_msgs::Float64>("/mobile_dual_arm/l_joint4_position/command", 1000);
    ros::Publisher Joint_L5_pub = n.advertise<std_msgs::Float64>("/mobile_dual_arm/l_joint5_position/command", 1000);
    ros::Publisher Joint_L6_pub = n.advertise<std_msgs::Float64>("/mobile_dual_arm/l_joint6_position/command", 1000);
    ros::Publisher Joint_L7_pub = n.advertise<std_msgs::Float64>("/mobile_dual_arm/l_joint7_position/command", 1000);

    std_msgs::Float64 msg;
    Angle_tick = (JointAngle - Old_JointAngle)/70;
    for( int i=1; i<=70; i++ )
    {
        for( int j=0; j<1; j++ )
        {
            msg.data = (Old_JointAngle(0)+Angle_tick(0)*i)/100;
//            ROS_INFO("%f", msg.data);
            Slide_L_pub.publish(msg);
//            ros::spinOnce();
//            loop_rate.sleep();

            msg.data = Old_JointAngle(1)+Angle_tick(1)*i;
//            ROS_INFO("%f", msg.data);
            Joint_L1_pub.publish(msg);
//            ros::spinOnce();
//            loop_rate.sleep();

            msg.data = Old_JointAngle(2)+Angle_tick(2)*i;
//            ROS_INFO("%f", msg.data);
            Joint_L2_pub.publish(msg);
//            ros::spinOnce();
//            loop_rate.sleep();

            msg.data = Old_JointAngle(3)+Angle_tick(3)*i;
//            ROS_INFO("%f", msg.data);
            Joint_L3_pub.publish(msg);
//            ros::spinOnce();
//            loop_rate.sleep();

            msg.data = Old_JointAngle(4)+Angle_tick(4)*i;
//            ROS_INFO("%f", msg.data);
            Joint_L4_pub.publish(msg);
//            ros::spinOnce();
//            loop_rate.sleep();

            msg.data = Old_JointAngle(5)+Angle_tick(5)*i;
//            ROS_INFO("%f", msg.data);
            Joint_L5_pub.publish(msg);
//            ros::spinOnce();
//            loop_rate.sleep();

            msg.data = Old_JointAngle(6)+Angle_tick(6)*i;
//            ROS_INFO("%f", msg.data);
            Joint_L6_pub.publish(msg);
            ros::spinOnce();
            // loop_rate.sleep();

            msg.data = Old_JointAngle(7)+Angle_tick(7)*i;
//            ROS_INFO("%f", msg.data);
            Joint_L7_pub.publish(msg);
//            ros::spinOnce();
            loop_rate.sleep();
            
        }
    }
}


