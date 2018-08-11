/*******************************************************************************
* Copyright 2018 ROBOTIS CO., LTD.
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*******************************************************************************/

/*
 * Link.cpp
 *
 *  Created on: Jan 11, 2016
 *      Author: SCH
 */
#include <assert.h>
#include <iostream>
#include "manipulator_h_kinematics_dynamics/manipulator_h_kinematics_dynamics.h"

namespace robotis_manipulator_h
{

ManipulatorKinematicsDynamics::ManipulatorKinematicsDynamics()
{
}
ManipulatorKinematicsDynamics::~ManipulatorKinematicsDynamics()
{
}

ManipulatorKinematicsDynamics::ManipulatorKinematicsDynamics(TreeSelect tree)
{
  for (int id = 0; id <= ALL_JOINT_ID; id++)
    manipulator_link_data_[id] = new LinkData();

  if (tree == ARM)
  {
    manipulator_link_data_[0]->name_    = "base";
    manipulator_link_data_[0]->parent_  = -1;
    manipulator_link_data_[0]->sibling_ = -1;
    manipulator_link_data_[0]->child_   = 1;
    manipulator_link_data_[0]->mass_    = 0.0;
    manipulator_link_data_[0]->relative_position_ = robotis_framework::getTransitionXYZ(0.0, 0.0, 0.0);
    manipulator_link_data_[0]->joint_axis_        = robotis_framework::getTransitionXYZ(0.0, 0.0, 0.0);
    manipulator_link_data_[0]->center_of_mass_    = robotis_framework::getTransitionXYZ(0.0, 0.0, 0.0);
    manipulator_link_data_[0]->joint_limit_max_   = 100.0;
    manipulator_link_data_[0]->joint_limit_min_   = -100.0;
    manipulator_link_data_[0]->inertia_           = robotis_framework::getInertiaXYZ(0.0, 0.0, 0.0, 0.0, 0.0, 0.0);

    manipulator_link_data_[1]->name_    = "joint1";
    manipulator_link_data_[1]->parent_  = 0;
    manipulator_link_data_[1]->sibling_ = -1;
    manipulator_link_data_[1]->child_   = 2;
    manipulator_link_data_[1]->mass_    = 0.85644;
    manipulator_link_data_[1]->relative_position_ = robotis_framework::getTransitionXYZ(0.0, 0.0, 0.0);
    manipulator_link_data_[1]->joint_axis_        = robotis_framework::getTransitionXYZ(0.0, 0.0, 1.0);
    manipulator_link_data_[1]->center_of_mass_    = robotis_framework::getTransitionXYZ(0.0, 0.0, 0.0);
    manipulator_link_data_[1]->joint_limit_max_   = 1 * M_PI;
    manipulator_link_data_[1]->joint_limit_min_   = -1 * M_PI;
    manipulator_link_data_[1]->inertia_           = robotis_framework::getInertiaXYZ(1.0, 0.0, 0.0, 1.0, 0.0, 1.0);

    manipulator_link_data_[2]->name_    = "joint2";
    manipulator_link_data_[2]->parent_  = 1;
    manipulator_link_data_[2]->sibling_ = -1;
    manipulator_link_data_[2]->child_   = 3;
    manipulator_link_data_[2]->mass_    = 0.94658;
    manipulator_link_data_[2]->relative_position_ = robotis_framework::getTransitionXYZ(0.0, 0.0, 0.16);
    manipulator_link_data_[2]->joint_axis_        = robotis_framework::getTransitionXYZ(0.0, 0.0, -1.0);
    manipulator_link_data_[2]->center_of_mass_    = robotis_framework::getTransitionXYZ(0.0, 0.0, 0.0);
    manipulator_link_data_[2]->joint_limit_max_   = 1 * M_PI;
    manipulator_link_data_[2]->joint_limit_min_   = -0.2 * M_PI;
    manipulator_link_data_[2]->inertia_           = robotis_framework::getInertiaXYZ(1.0, 0.0, 0.0, 1.0, 0.0, 1.0);

    manipulator_link_data_[3]->name_    = "joint3";
    manipulator_link_data_[3]->parent_  = 2;
    manipulator_link_data_[3]->sibling_ = -1;
    manipulator_link_data_[3]->child_   = 4;
    manipulator_link_data_[3]->mass_    = 1.30260;
    manipulator_link_data_[3]->relative_position_ = robotis_framework::getTransitionXYZ(0.0, 0.0, 0.0);
    manipulator_link_data_[3]->joint_axis_        = robotis_framework::getTransitionXYZ(0.0, 0.0, 1.0);
    manipulator_link_data_[3]->center_of_mass_    = robotis_framework::getTransitionXYZ(0.0, 0.0, 0.0);
    manipulator_link_data_[3]->joint_limit_max_   = 1 * M_PI;
    manipulator_link_data_[3]->joint_limit_min_   = -1 * M_PI;
    manipulator_link_data_[3]->inertia_           = robotis_framework::getInertiaXYZ(1.0, 0.0, 0.0, 1.0, 0.0, 1.0);

    manipulator_link_data_[4]->name_    = "joint4";
    manipulator_link_data_[4]->parent_  = 3;
    manipulator_link_data_[4]->sibling_ = -1;
    manipulator_link_data_[4]->child_   = 5;
    manipulator_link_data_[4]->mass_    = 1.236;
    manipulator_link_data_[4]->relative_position_ = robotis_framework::getTransitionXYZ(-0.03, 0, 0.29);
    manipulator_link_data_[4]->joint_axis_        = robotis_framework::getTransitionXYZ(0.0, 0.0, 1.0);
    manipulator_link_data_[4]->center_of_mass_    = robotis_framework::getTransitionXYZ(0.0, 0.0, 0.0);
    manipulator_link_data_[4]->joint_limit_max_   = 1 * M_PI;
    manipulator_link_data_[4]->joint_limit_min_   = -0.1 * M_PI;
    manipulator_link_data_[4]->inertia_           = robotis_framework::getInertiaXYZ(1.0, 0.0, 0.0, 1.0, 0.0, 1.0);

    manipulator_link_data_[5]->name_    = "joint5";
    manipulator_link_data_[5]->parent_  = 4;
    manipulator_link_data_[5]->sibling_ = -1;
    manipulator_link_data_[5]->child_   = 6;
    manipulator_link_data_[5]->mass_    = 0.491;
    manipulator_link_data_[5]->relative_position_ = robotis_framework::getTransitionXYZ(-0.03, 0.0, 0.0);
    manipulator_link_data_[5]->joint_axis_        = robotis_framework::getTransitionXYZ(0.0, 0.0, 1.0);
    manipulator_link_data_[5]->center_of_mass_    = robotis_framework::getTransitionXYZ(0.0, 0.0, 0.0);
    manipulator_link_data_[5]->joint_limit_max_   = 1 * M_PI;
    manipulator_link_data_[5]->joint_limit_min_   = -1 * M_PI;
    manipulator_link_data_[5]->inertia_           = robotis_framework::getInertiaXYZ(1.0, 0.0, 0.0, 1.0, 0.0, 1.0);

    manipulator_link_data_[6]->name_    = "joint6";
    manipulator_link_data_[6]->parent_  = 5;
    manipulator_link_data_[6]->sibling_ = -1;
    manipulator_link_data_[6]->child_   = 7;
    manipulator_link_data_[6]->mass_    = 0.454;
    manipulator_link_data_[6]->relative_position_ = robotis_framework::getTransitionXYZ(0.0, 0.0, 0.263);
    manipulator_link_data_[6]->joint_axis_        = robotis_framework::getTransitionXYZ(0.0, 0.0, -1.0);
    manipulator_link_data_[6]->center_of_mass_    = robotis_framework::getTransitionXYZ(0.0, 0.0, 0.0);
    manipulator_link_data_[6]->joint_limit_max_   = 0.5 * M_PI;
    manipulator_link_data_[6]->joint_limit_min_   = -0.5 * M_PI;
    manipulator_link_data_[6]->inertia_           = robotis_framework::getInertiaXYZ(1.0, 0.0, 0.0, 1.0, 0.0, 1.0);
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    manipulator_link_data_[7]->name_    = "joint7";
    manipulator_link_data_[7]->parent_  = 6;
    manipulator_link_data_[7]->sibling_ = -1;
    manipulator_link_data_[7]->child_   = 8;
    manipulator_link_data_[7]->mass_    = 0.454;
    manipulator_link_data_[7]->relative_position_ = robotis_framework::getTransitionXYZ(0.0, 0.0, 0.0);
    manipulator_link_data_[7]->joint_axis_        = robotis_framework::getTransitionXYZ(0.0, 0.0, 1.0);
    manipulator_link_data_[7]->center_of_mass_    = robotis_framework::getTransitionXYZ(0.0, 0.0, 0.0);
    manipulator_link_data_[7]->joint_limit_max_   = 1 * M_PI;
    manipulator_link_data_[7]->joint_limit_min_   = -1 * M_PI;
    manipulator_link_data_[7]->inertia_           = robotis_framework::getInertiaXYZ(1.0, 0.0, 0.0, 1.0, 0.0, 1.0);
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    manipulator_link_data_[8]->name_    = "end";
    manipulator_link_data_[8]->parent_  = 7;
    manipulator_link_data_[8]->sibling_ = -1;
    manipulator_link_data_[8]->child_   = -1;
    manipulator_link_data_[8]->mass_    = 0.0;
    manipulator_link_data_[8]->relative_position_ = robotis_framework::getTransitionXYZ(0.0, 0.0, 0.3985);
    manipulator_link_data_[8]->joint_axis_        = robotis_framework::getTransitionXYZ(0.0, 0.0, -1.0);
    manipulator_link_data_[8]->center_of_mass_    = robotis_framework::getTransitionXYZ(0.0, 0.0, 0.0);
    manipulator_link_data_[8]->joint_limit_max_   = 100.0;
    manipulator_link_data_[8]->joint_limit_min_   = -100.0;
    manipulator_link_data_[8]->inertia_           = robotis_framework::getInertiaXYZ(1.0, 0.0, 0.0, 1.0, 0.0, 1.0);
  
    load_LinkParam();
  }
}

void ManipulatorKinematicsDynamics::load_LinkParam()
{
    std::string path = ros::package::getPath("manipulator_h_kinematics_dynamics") + "/config/link_param.yaml";
    
    YAML::Node doc;
    try
    {
        // load yaml
        doc = YAML::LoadFile(path.c_str());
    }
    catch (const std::exception &e)
    {
        std::cout << "Fail to load yaml file." << std::endl;
        return;
    }

    DHTABLE.resize(8, 4);

    // parse dh links
    YAML::Node _dh_links = doc["dh_links"];
    for (YAML::iterator _it = _dh_links.begin(); _it != _dh_links.end(); ++_it)
    {
        int link_num = _it->first.as<int>();

        std::map<std::string, double> param = _it->second.as<std::map<std::string, double> >();
        DHTABLE(link_num , 0) = param["a"];
        DHTABLE(link_num , 1) = param["alpha"] * M_PI / 180.0;
        DHTABLE(link_num , 2) = param["d"];
        DHTABLE(link_num , 3) = param["theta"] * M_PI / 180.0;
    }
}

std::vector<int> ManipulatorKinematicsDynamics::findRoute(int to)
{
  int id = manipulator_link_data_[to]->parent_;

  std::vector<int> idx;

  if (id == 0)
  {
    idx.push_back(0);
    idx.push_back(to);
  }
  else
  {
    idx = findRoute(id);
    idx.push_back(to);
  }

  return idx;
}

std::vector<int> ManipulatorKinematicsDynamics::findRoute(int from, int to)
{
  int id = manipulator_link_data_[to]->parent_;

  std::vector<int> idx;

  if (id == from)
  {
    idx.push_back(from);
    idx.push_back(to);
  }
  else if (id != 0)
  {
    idx = findRoute(from, id);
    idx.push_back(to);
  }

  return idx;
}

double ManipulatorKinematicsDynamics::totalMass(int joint_ID)
{
  double mass;

  if (joint_ID == -1)
    mass = 0.0;
  else
    mass = manipulator_link_data_[joint_ID]->mass_ + totalMass(manipulator_link_data_[joint_ID]->sibling_)
                                                   + totalMass(manipulator_link_data_[joint_ID]->child_);

  return mass;
}

Eigen::MatrixXd ManipulatorKinematicsDynamics::calcMC(int joint_ID)
{
  Eigen::MatrixXd mc(3, 1);

  if (joint_ID == -1)
    mc = Eigen::MatrixXd::Zero(3, 1);
  else
  {
    mc = manipulator_link_data_[joint_ID]->mass_ * (manipulator_link_data_[joint_ID]->orientation_
        * manipulator_link_data_[joint_ID]->center_of_mass_ + manipulator_link_data_[joint_ID]->position_);
    mc = mc + calcMC(manipulator_link_data_[joint_ID]->sibling_) + calcMC(manipulator_link_data_[joint_ID]->child_);
  }

  return mc;
}

Eigen::MatrixXd ManipulatorKinematicsDynamics::calcCOM(Eigen::MatrixXd MC)
{
  double mass;
  Eigen::MatrixXd COM(3, 1);

  mass = totalMass(0);

  COM = MC / mass;

  return COM;
}

void ManipulatorKinematicsDynamics::forwardKinematics(int joint_ID)
{
  // if (joint_ID == -1)
  //   return;

  manipulator_link_data_[0]->position_ = Eigen::MatrixXd::Zero(3, 1);
  manipulator_link_data_[0]->orientation_ = robotis_framework::calcRodrigues(
                                                robotis_framework::calcHatto(manipulator_link_data_[0]->joint_axis_),
                                                manipulator_link_data_[0]->joint_angle_
                                            );

  // if (joint_ID != 0)
  // {
  //   int parent = manipulator_link_data_[joint_ID]->parent_;

  //   manipulator_link_data_[joint_ID]->position_ = manipulator_link_data_[parent]->orientation_
  //                                                 * manipulator_link_data_[joint_ID]->relative_position_
  //                                                 + manipulator_link_data_[parent]->position_;
  //   manipulator_link_data_[joint_ID]->orientation_ = manipulator_link_data_[parent]->orientation_
  //                                                   * robotis_framework::calcRodrigues(robotis_framework::calcHatto(manipulator_link_data_[joint_ID]->joint_axis_),
  //                                                                                      manipulator_link_data_[joint_ID]->joint_angle_);

  //   manipulator_link_data_[joint_ID]->transformation_.block<3, 1>(0, 3) = manipulator_link_data_[joint_ID]->position_;
  //   manipulator_link_data_[joint_ID]->transformation_.block<3, 3>(0, 0) = manipulator_link_data_[joint_ID]->orientation_;
  // }

  // forwardKinematics(manipulator_link_data_[joint_ID]->sibling_);
  // forwardKinematics(manipulator_link_data_[joint_ID]->child_);

  Eigen::MatrixXd T = Eigen::MatrixXd::Identity(4,4);
  Eigen::MatrixXd A(4,4);
  Eigen::VectorXd DH_row(4);
  DHTABLE(0,2) = manipulator_link_data_[0]->slide_position_;
  // DHTABLE = DHparameter_left( d1,d2,d3,d4,a1,a2,slide_position );
  //std::cout<<"==================================================================================================="<<std::endl<<std::endl;
  for ( int i=0; i<=joint_ID; i++ )
  {

    DH_row = DHTABLE.row(i);
    A = Trans(manipulator_link_data_[i]->joint_angle_, DH_row);
    // std::cout<<"joint_angle_"<<std::endl<<manipulator_link_data_[i]->joint_angle_<<std::endl<<std::endl;

    T = T*A;
    manipulator_link_data_[i+1]->position_ = T.block(0,3,3,1);
    manipulator_link_data_[i+1]->orientation_ = T.block(0,0,3,3);
    // std::cout<<"TTTTTTTTTTTTTT"<<i<<"=========="<<std::endl<<T<<std::endl<<std::endl;
    // if(i == 7)
      // std::cout<<"manipulator_link_data_[i+1]->orientation_ "<<std::endl<<manipulator_link_data_[i+1]->orientation_<<std::endl<<std::endl;
    manipulator_link_data_[i+1]->transformation_.block<3, 1>(0, 3) = manipulator_link_data_[i+1]->position_;
    manipulator_link_data_[i+1]->transformation_.block<3, 3>(0, 0) = manipulator_link_data_[i+1]->orientation_;
    // std::cout<<"manipulator_link_data_[i+1]->transformation_ "<<std::endl<<manipulator_link_data_[i+1]->transformation_<<std::endl<<std::endl;
    //Eigen::Vector3d rpy convertRotationToRPY(T.block(0,0,3,3));
  }
  getPhiAngle();
}

Eigen::MatrixXd ManipulatorKinematicsDynamics::calcJacobian(std::vector<int> idx)
{
  int idx_size = idx.size();
  int end = idx_size - 1;

  Eigen::MatrixXd tar_position = manipulator_link_data_[idx[end]]->position_;
  Eigen::MatrixXd Jacobian = Eigen::MatrixXd::Zero(6, idx_size);

  for (int index = 0; index < idx_size; index++)
  {
    int id = idx[index];

    Eigen::MatrixXd tar_orientation = manipulator_link_data_[id]->orientation_ * manipulator_link_data_[id]->joint_axis_;

    Jacobian.block(0, index, 3, 1) = robotis_framework::calcCross(tar_orientation,
                                                                  tar_position - manipulator_link_data_[id]->position_);
    Jacobian.block(3, index, 3, 1) = tar_orientation;
  }

  return Jacobian;
}

Eigen::MatrixXd ManipulatorKinematicsDynamics::calcJacobianCOM(std::vector<int> idx)
{
  int idx_size = idx.size();
  int end = idx_size - 1;

  Eigen::MatrixXd target_position = manipulator_link_data_[idx[end]]->position_;
  Eigen::MatrixXd jacobianCOM = Eigen::MatrixXd::Zero(6, idx_size);

  for (int index = 0; index < idx_size; index++)
  {
    int     id    = idx[index];
    double  mass  = totalMass(id);

    Eigen::MatrixXd og = calcMC(id) / mass - manipulator_link_data_[id]->position_;
    Eigen::MatrixXd target_orientation = manipulator_link_data_[id]->orientation_ * manipulator_link_data_[id]->joint_axis_;

    jacobianCOM.block(0, index, 3, 1) = robotis_framework::calcCross(target_orientation, og);
    jacobianCOM.block(3, index, 3, 1) = target_orientation;
  }

  return jacobianCOM;
}

Eigen::MatrixXd ManipulatorKinematicsDynamics::calcVWerr(Eigen::MatrixXd tar_position, Eigen::MatrixXd curr_position,
                                                         Eigen::MatrixXd tar_orientation, Eigen::MatrixXd curr_orientation)
{
  Eigen::MatrixXd pos_err = tar_position - curr_position;
  Eigen::MatrixXd ori_err1 = curr_orientation.inverse() * tar_orientation;
  Eigen::MatrixXd ori_err2 = curr_orientation * robotis_framework::convertRotToOmega(ori_err1);

  Eigen::MatrixXd err = Eigen::MatrixXd::Zero(6, 1);
  err.block(0, 0, 3, 1) = pos_err;
  err.block(3, 0, 3, 1) = ori_err2;

  return err;
}

bool ManipulatorKinematicsDynamics::inverseKinematics(int to, Eigen::MatrixXd tar_position,
    Eigen::MatrixXd tar_orientation, double tar_phi, double tar_slide_pos, int max_iter, double ik_err)
{
  bool ik_success     = false;
  bool limit_success  = false;
  
  forwardKinematics(7);

  std::vector<int> idx = findRoute(to);
  Eigen::VectorXd Old_JointAngle(idx.size());
  Eigen::VectorXd angle;
  
  // std::cout<<"tar_orientationtar_orientation"<<std::endl<<tar_orientation<<std::endl;

  for (int id = 0; id < idx.size(); id++)
  {
    int joint_num = idx[id];
    Old_JointAngle[joint_num] = manipulator_link_data_[joint_num]->joint_angle_;
  }
  // std::cout<<"OLD_ANGLE"<<std::endl<<Old_JointAngle<<std::endl;

  ik_success = InverseKinematics_7(tar_position, tar_orientation, tar_phi, tar_slide_pos, Old_JointAngle);



  // for (int id = 0; id < idx.size(); id++)
  // {
  //   int joint_num = idx[id];
  //   manipulator_link_data_[joint_num]->joint_angle_ += _delta_angle.coeff(id);
  // }
  forwardKinematics(7);
  

  for (int id = 0; id < idx.size(); id++)
  {
    int joint_num = idx[id];

    if (manipulator_link_data_[joint_num]->joint_angle_ >= manipulator_link_data_[joint_num]->joint_limit_max_)
    {
      limit_success = false;   /////////////false
      break;
    }
    else if (manipulator_link_data_[joint_num]->joint_angle_ <= manipulator_link_data_[joint_num]->joint_limit_min_)
    {
      limit_success = false;   /////////////false
      break;
    }
    else
      limit_success = true;
  }
  limit_success = true;
  if (ik_success == true && limit_success == true)
    return true;
  else
    return false;
}

bool ManipulatorKinematicsDynamics::inverseKinematics(int from, int to, Eigen::MatrixXd tar_position,
                                                      Eigen::MatrixXd tar_orientation, int max_iter, double ik_err)
{
  bool ik_success = false;
  bool limit_success = false;

  forwardKinematics(0);

  std::vector<int> idx = findRoute(from, to);

  for (int iter = 0; iter < max_iter; iter++)
  {
    Eigen::MatrixXd jacobian = calcJacobian(idx);

    Eigen::MatrixXd curr_position     = manipulator_link_data_[to]->position_;
    Eigen::MatrixXd curr_orientation  = manipulator_link_data_[to]->orientation_;

    Eigen::MatrixXd err = calcVWerr(tar_position, curr_position, tar_orientation, curr_orientation);

    if (err.norm() < ik_err)
    {
      ik_success = true;
      break;
    }
    else
    {
      ik_success = false;
    }

    Eigen::MatrixXd jacobian2 = jacobian * jacobian.transpose();
    Eigen::MatrixXd jacobian3 = jacobian.transpose() * jacobian2.inverse();

    Eigen::MatrixXd delta_angle = jacobian3 * err;

    for (int id = 0; id < idx.size(); id++)
    {
      int joint_num = idx[id];
      manipulator_link_data_[joint_num]->joint_angle_ += delta_angle.coeff(id);
    }

    forwardKinematics(0);
  }

  for (int id = 0; id < idx.size(); id++)
  {
    int joint_num = idx[id];

    if (manipulator_link_data_[joint_num]->joint_angle_ >= manipulator_link_data_[joint_num]->joint_limit_max_)
    {
      limit_success = false;
      break;
    }
    else if (manipulator_link_data_[joint_num]->joint_angle_ <= manipulator_link_data_[joint_num]->joint_limit_min_)
    {
      limit_success = false;
      break;
    }
    else
      limit_success = true;
  }

  if (ik_success == true && limit_success == true)
    return true;
  else
    return false;
}

Eigen::MatrixXd ManipulatorKinematicsDynamics::Trans( double &Theta, Eigen::VectorXd &DH )
{
  // std::cout<<"Theta==================================================="<<std::endl<<Theta<<std::endl;
  // std::cout<<"DH==================================================="<<std::endl<<DH<<std::endl;
  double c_th = cos(Theta + DH(3));
  double s_th = sin(Theta + DH(3));
  double c_alp = cos(DH(1));
  double s_alp = sin(DH(1));
  Eigen::MatrixXd A(4,4);
  A << c_th, -s_th*c_alp,  s_th*s_alp,  DH(0)*c_th,
       s_th,  c_th*c_alp, -c_th*s_alp,  DH(0)*s_th,
       0,     s_alp,       c_alp,       DH(2),
       0,     0,           0,           1;  
  return A;
}
Eigen::Vector3d ManipulatorKinematicsDynamics::forwardKinematics_7(int joint_ID, Eigen::VectorXd angle)
{
  Eigen::MatrixXd T = Eigen::MatrixXd::Identity(4,4);
  Eigen::MatrixXd A(4,4);
  Eigen::VectorXd DH_row(4);

  for ( int i=0; i<=joint_ID; i++ )
  {
    DH_row = DHTABLE.row(i);
    A = Trans(angle(i), DH_row);
    // std::cout<<"angleeeeeeeee"<<std::endl<<angle(i)<<std::endl<<std::endl;
    // std::cout<<"DH_rowDH_rowDH_row"<<std::endl<<DH_row<<std::endl<<std::endl;

    // std::cout<<"AAAAAAAAAAAAA"<<std::endl<<A<<std::endl<<std::endl;

    T = T*A;
  }
  // std::cout<<"rotation_kine"<<std::endl<<T.block(0,0,3,3)<<std::endl;

  // forwardKinematics(joint_ID);
  // assert(false);
  return T.block(0,3,3,1);
}
bool ManipulatorKinematicsDynamics::InverseKinematics_7( Eigen::VectorXd goal_position, Eigen::Matrix3d rotation, 
                                                            double Phi, double slide_position, Eigen::VectorXd &Old_JointAngle)
{

  // std::cout<<"rotationrotationrotationrotation"<<std::endl<<rotation<<std::endl;

  // double Phi = 0;

  bool ik_success = false;

  double d1 = DHTABLE(1,2);
  double d2 = DHTABLE(3,2);
  double d3 = DHTABLE(5,2);
  double d4 = DHTABLE(7,2);
  double a1 = DHTABLE(4,0);
  double a2 = DHTABLE(4,0);
  
  int isMatch = 0;
  // double slide_position = 0;
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

  Eigen::VectorXd JointAngle(8);
  Eigen::VectorXd Angle(5);
  //Eigen::VectorXd TestJoint1(6);
  //Eigen::VectorXd XYZ(3);
  Eigen::VectorXd Oc(3);
  Eigen::VectorXd testOc(3);
  Eigen::VectorXd Ps(3);
  Eigen::VectorXd Vsw(3);
  double Lsw;
  double Lse;
  double Lew;
  double Lec;
  double Lsc;
  Eigen::VectorXd eRc(3);
  Eigen::VectorXd DH_row(4);
  Eigen::VectorXd tmp_JointAngle(8);
  
  //MatrixXd DHTABLE(8,4);
  Eigen::MatrixXd DH(5,4);
  Eigen::MatrixXd R03(4,4);
  Eigen::MatrixXd R04(4,4);
  Eigen::MatrixXd R07 = Eigen::MatrixXd::Identity(4,4);
  Eigen::MatrixXd R47(4,4);
  Eigen::MatrixXd A(4,4);
  Eigen::MatrixXd T(4,4);
  // MatrixXd RY(4,4);
  // MatrixXd RP(4,4);
  // MatrixXd RR(4,4);
  // MatrixXd Origin(4,4);

  // RY << 1,  0,    0,    X,
  //       0,  c_y, -s_y,  Y,
  //       0,  s_y,  c_y,  Z, 
  //       0,  0,    0,    1;
  // RP <<  c_p,  0,  s_p,  X,
  //        0,    1,  0,    Y,
  //       -s_p,  0,  c_p,  Z,
  //        0,    0,  0,    1;   
  // RR << c_r, -s_r, 0,  X,
  //        s_r, c_r, 0,  Y,
  //        0,   0,   1,  Z,
  //        0,   0,   0,  1;
  // Origin << 1,  0,  0,  X,
  //           0, -1,  0,  Y,
  //           0,  0, -1,  Z,
  //           0,  0,  0,  1;
  // R07 = Origin*RP*RY*RR;        
  // XYZ << X, Y, Z;

  R07.block(0,0,3,3) = rotation;
  // R07.block(0,0,3,3) <<1,0,0,0,-1,0,0,0,-1;
  //R07(3,3) = 1;
  // std::cout<<"R07R07R07R07R07R07R07R07"<<std::endl<<R07<<std::endl;
  Oc << goal_position(0)-d4*R07(0,2), goal_position(1)-d4*R07(1,2), goal_position(2)-d4*R07(2,2);
  // std::cout<<"============OcOcOcOc==============="<<std::endl<<Oc<<std::endl;
  // std::cout<<"goal_position"<<std::endl<<goal_position<<std::endl;
  // std::cout<<"cos( DHTABLE(0,3) )cos( DHTABLE(0,3) )"<<std::endl<<cos( DHTABLE(0,3) )<<std::endl;

  ////////////////////////////////////////////////////////////////////////////////////////
  // testOc = Oc;
  // testOc(1) = testOc(1) - (d1*cos(DHTABLE(0,3)));
  // if(testOc.norm()>(d2+d3))
  // {
  //   if(Oc(2) < -0.8){                                         
  //       testOc << testOc(0), testOc(1), testOc(2)-(-0.8);
  //   }else{
  //       testOc << testOc(0), testOc(1), 0;
  //   }  
  //   if(Oc(2)>0 && testOc.norm()>(d2+d3))
  //   {
  //       return false;
  //   }
  //   slide_position = Oc(2);
  //   for( int i = 1; i<=5; i++ )
  //   {
  //     slide_position = Oc(2) - Oc(2)/(pow(2,i));
  //     if(slide_position<-0.8)
  //     {
  //         slide_position = -0.8;
  //     }
  //     testOc(2) = Oc(2)-slide_position;
  //     if(testOc.norm()<(d2+d3))
  //     {
  //         break;
  //     }
  //     if(i==5)
  //     {
  //         return false;
  //     }
  //   }
  // }
  
  DHTABLE(0,2) = slide_position;                 
  ////////////////////////////////////////////////////////////////////////////////////////////////

  Ps << 0, d1*cos(DHTABLE(0,3)), slide_position;   
  Vsw = Oc - Ps;     
  Lsw = Vsw.norm();  
  Lse = sqrt(pow(a1,2)+pow(d2,2));
  Lew = sqrt(pow(a2,2)+pow(d3,2));
  theta_e = acos((Lse*Lse + Lsw*Lsw - Lew*Lew) / (2*Lse*Lsw));  
  eRc = Ps + (Vsw * Lse * cos(theta_e) / Lsw);    //Phi旋轉中心位置
  //////////////////////////////////////////////////////////////////////////////////////////
  Lsc = Lse * cos(theta_e); 
  Lec = Lse * sin(theta_e); 

  DH << 0,   -pi/2, slide_position, DHTABLE(0,3),    
        0,   -pi/2, d1,             pi/2,
        0,   -pi/2, 0,             -pi/2, 
        Lec,  pi/2, Lsc,            0,    
        0,    0,    0,              0;
  
  theta_1 = atan2(-cos( DHTABLE(0,3) )*eRc(0) , -(eRc(2)-slide_position));   //左右不同
  theta_2 = asin((d1 - cos( DHTABLE(0,3) )*eRc(1)) / Lsc);         //左右不同
  theta_3 = Phi;
  theta_4 = -(theta_e + atan(a1/d2));
 
  Angle << 0, theta_1, theta_2, theta_3, theta_4;
  T = Eigen::MatrixXd::Identity(4,4);

  for ( int i=0; i<5; i++ )
  {
    DH_row = DH.row(i);
    A = Trans( Angle(i), DH_row );
    T = T*A;
  }
  R03 = T;

  //DHTABLE = DHparameter_left( d1,d2,d3,d4,a1,a2,slide_position );  //左右不同
  theta_4 = M_PI - acos((Lse*Lse + Lew*Lew - Lsw*Lsw) / (2*Lse*Lew)) + atan(a1/d2) + atan(a2/d3);
  
  DH_row = DHTABLE.row(4);
  A = Trans(theta_4, DH_row);   
  R04 = R03 * A;

  JointAngle << 0, 0, 0, 0, 0, 0, 0, 0;
  // TODO: comming soon
  // theta_1 = atan2((-cos( DHTABLE(0,3) )*R03(0,1)) , -R03(2,1));    //左右不同
  // theta_2 = asin(-cos( DHTABLE(0,3) )*R03(1,1));             //左右不同
  // theta_3 = atan2( (cos( DHTABLE(0,3) )*R03(1,2)) , (cos( DHTABLE(0,3) )*R03(1,0)));     //左右不同

  theta_1 = atan((-cos( DHTABLE(0,3) )*R03(0,1)) / -R03(2,1));    //左右不同
  theta_2 = asin(-cos( DHTABLE(0,3) )*R03(1,1));             //左右不同
  theta_3 = atan( (cos( DHTABLE(0,3) )*R03(1,2)) / (cos( DHTABLE(0,3) )*R03(1,0)));     //左右不同

  R47 = R04.inverse() * R07;
  theta_5 = atan(-R47(1,2) / -R47(0,2));
  theta_6 = acos(R47(2,2));
  // std::cout<<"theta_6"<<std::endl<<theta_6<<std::endl;
  theta_7 = atan(-R47(2,1) / R47(2,0));


  //std::cout<<"theta_6theta_6theta_6theta_6theta_6theta_6theta_6theta_6theta_6theta_6"<<std::endl<<theta_6<<std::endl;
  // std::cout<<"R47(2,2)R47(2,2)R47(2,2)R47(2,2)R47(2,2)R47(2,2)"<<std::endl<<R47(2,2)<<std::endl;

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
    if( cos( DHTABLE(0,3) )*R03(1,0)*i >= 0)                         //左右不同
        JointAngle(3) = theta_3;
    else if( cos( DHTABLE(0,3) )*R03(1,0)*i<0 && theta_3>=0)       //左右不同
        JointAngle(3) = theta_3 - pi;
    else
        JointAngle(3) = pi + theta_3;
    

    JointAngle(4) = theta_4;

    //TestJoint1 << 0, JointAngle(1), JointAngle(2), JointAngle(3), JointAngle(4), JointAngle(5);
    

    // for (int id = 0; id <= 5; id++)
    // {
    //   manipulator_link_data_[id]->joint_angle_ = JointAngle.coeff(id);
    // }
    Eigen::VectorXd testPos = forwardKinematics_7(5,JointAngle);
    // std::cout<<"========testpos==========="<<std::endl<<testPos<<std::endl;
    testPos = testPos - Oc;
    
    // std::cout<<"========Oc==========="<<std::endl<<Oc<<std::endl; 
    Deviation = testPos.norm();
    if ( Deviation < 0.0001 )
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
    else
    {
        // std::cout<<"============goal_position==============="<<std::endl<<goal_position<<std::endl;
        // std::cout<<"============Deviation_1to5==============="<<std::endl<<Deviation<<std::endl;
        // std::cout<<"============jointangle_fale_1to5==============="<<std::endl<<JointAngle<<std::endl;
    }
    if( isMatch == 0 && i == 2)
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

    // for (int id = 0; id <= 7; id++)
    // {
    //   manipulator_link_data_[id]->joint_angle_ = JointAngle.coeff(id);
    // }    
    Eigen::VectorXd testPos = forwardKinematics_7(7,JointAngle);
    // std::cout<<"testpos211"<<std::endl<<testPos<<std::endl;
    testPos = testPos - goal_position;

    // std::cout<<"goal_position"<<std::endl<<goal_position<<std::endl;
    // std::cout<<"testpos222"<<std::endl<<testPos<<std::endl; 

    Eigen::VectorXd Joint_dev(8);
    Deviation = testPos.norm();
    if ( Deviation < 0.0001 )
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
    else
    {
        // std::cout<<"============goal_position==============="<<std::endl<<goal_position<<std::endl;
        // std::cout<<"============Deviation_1to7==============="<<std::endl<<Deviation<<std::endl;
        // std::cout<<"============jointangle_fale_1to7==============="<<std::endl<<JointAngle<<std::endl;  
    }
    if( isMatch == 0 && i == 2)
    {
        JointAngle = Old_JointAngle;
        ik_success = false;
    }
    else if( isMatch == 1 && D_Joint_2 == 0)
    {
        JointAngle = tmp_JointAngle;
        ik_success = true;
    }
    else if( isMatch == 2 && D_Joint_1 < D_Joint_2 )
    {
        JointAngle = tmp_JointAngle;
        ik_success = true;
    }
  }
  for (int id = 0; id <= MAX_JOINT_ID; id++)
  {
    manipulator_link_data_[id]->joint_angle_ = JointAngle.coeff(id);
    // std::cout<<"angleangle"<<std::endl<<JointAngle.coeff(id)*180/M_PI<<std::endl;
  }
  if(ik_success)
  {
    manipulator_link_data_[END_LINK]->phi_ = Phi;
    manipulator_link_data_[0]->slide_position_ = slide_position;
    for (int id = 0; id <= MAX_JOINT_ID; id++)
      manipulator_link_data_[id]->joint_angle_ = JointAngle.coeff(id);
  }
  /////////////////////////////////////////////////////////////////////////////////////////////////
  return ik_success;
}
bool ManipulatorKinematicsDynamics::slideInverseKinematics(Eigen::Vector3d goal_position, Eigen::Matrix3d rotation, 
                                                            double slide_pos, double& goal_slide_pos)
{
  double d1 = DHTABLE(1,2);
  double d2 = DHTABLE(3,2);
  double d3 = DHTABLE(5,2);
  double d4 = DHTABLE(7,2);

  double slide_position;
 
  Eigen::Vector3d Oc;
  Eigen::Vector3d test_pos;
  // std::cout<<"============goal_position==============="<<std::endl<<goal_position<<std::endl;
  Oc << goal_position(0)-d4*rotation(0,2), goal_position(1)-d4*rotation(1,2), goal_position(2)-d4*rotation(2,2);
  
  // std::cout<<"============OcOcOcOc==============="<<std::endl<<Oc<<std::endl;
  // std::cout<<"============Oc.norm()==============="<<std::endl<<Oc.norm()<<std::endl;  
  ////////////////////////////////////////////////////////////////////////////////////////
  test_pos = Oc;
  test_pos(1) = test_pos(1) - (d1*cos(DHTABLE(0,3)));

  if(test_pos.norm()>(d2+d3))
  {
    if(Oc(2) < -0.8){                                         
        test_pos << test_pos(0), test_pos(1), test_pos(2)-(-0.8);
    }else{
        test_pos << test_pos(0), test_pos(1), 0;
    }  
    if(Oc(2)>0 && test_pos.norm()>(d2+d3))
    {
        return false;
    }
    slide_position = Oc(2);
    for( int i = 1; i<=5; i++ )
    {
      slide_position = Oc(2) - Oc(2)/(pow(2,i));
      if(slide_position<-0.8)
      {
          slide_position = -0.8;
      }
      test_pos(2) = Oc(2)-slide_position;
      if(test_pos.norm()<(d2+d3))
      {
        goal_slide_pos = slide_position;
        return true;
      }
      if(i==5)
      {
          return false;
      }
    }
  }
  else
  {
    goal_slide_pos = 0;
    return true;
  }
}
void ManipulatorKinematicsDynamics::getPhiAngle()
{
  double d1 = DHTABLE(1,2);
  double d2 = DHTABLE(3,2);
  double d3 = DHTABLE(5,2);
  double d4 = DHTABLE(7,2);
  double a1 = DHTABLE(4,0);
  double a2 = DHTABLE(4,0);
  double Lsw;
  double Lse;
  double Lew;
  double Lec;
  double Lsc;
  double theta_e = 0;
  double slide_position = manipulator_link_data_[0]->slide_position_;
  Eigen::VectorXd Oc(3);
  Eigen::VectorXd Ps(3);
  Eigen::VectorXd Vsw(3);
  Eigen::VectorXd eRc(3);
  Eigen::VectorXd Angle(5);
  Eigen::MatrixXd DH(5,4);
  Eigen::MatrixXd A(4,4);
  Eigen::MatrixXd T(4,4);
  Eigen::VectorXd DH_row(4);

  Eigen::VectorXd elbow_origin(3);
  Eigen::VectorXd elbow_goal(3);

  Oc = manipulator_link_data_[6]->position_;
  Ps = manipulator_link_data_[2]->position_;   
  Vsw = Oc - Ps;     
  Lsw = Vsw.norm();  
  Lse = sqrt(pow(a1,2)+pow(d2,2));
  Lew = sqrt(pow(a2,2)+pow(d3,2));
  theta_e = acos((Lse*Lse + Lsw*Lsw - Lew*Lew) / (2*Lse*Lsw));
  eRc = Ps + (Vsw * Lse * cos(theta_e) / Lsw);    //Phi旋轉中心位置
  Lsc = Lse * cos(theta_e); 
  Lec = Lse * sin(theta_e); 

  DH << 0,   -pi/2, slide_position, DHTABLE(0,3),    
        0,   -pi/2, d1,             pi/2,
        0,   -pi/2, 0,             -pi/2, 
        Lec,  pi/2, Lsc,            0,    
        0,    0,    0,              0;
  Angle(1) = 0;
  Angle(1) = atan2(-cos( DHTABLE(0,3) )*eRc(0) , -(eRc(2)-slide_position));   
  Angle(2) = asin((d1 - cos( DHTABLE(0,3) )*eRc(1)) / Lsc);         
  Angle(3) = 0;
  Angle(4) = -(theta_e + atan(a1/d2));
 
  T = Eigen::MatrixXd::Identity(4,4);

  for ( int i=0; i<5; i++ )
  {
    DH_row = DH.row(i);
    A = Trans( Angle(i), DH_row );
    T = T*A;
  }
  elbow_goal = manipulator_link_data_[4]->position_;
  elbow_origin = T.block(0,3,3,1);
  double a = (elbow_goal - elbow_origin).norm();
  double b = (elbow_goal - eRc).norm();
  double c = (elbow_origin - eRc).norm();
  double Phi = acos((b*b + c*c - a*a)/(2*b*c));
  if(manipulator_link_data_[4]->joint_angle_ < 0.2167)
  {
    Phi = Phi - M_PI;
    if(manipulator_link_data_[4]->joint_angle_ > 0.2166)
      Phi = 0;
  }
  if(manipulator_link_data_[3]->joint_angle_ >= 0)
    manipulator_link_data_[END_LINK]->phi_ = Phi;
  else
    manipulator_link_data_[END_LINK]->phi_ = -Phi;
}
}
