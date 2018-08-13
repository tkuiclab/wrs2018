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
 * DemoModule.h
 *
 *  Created on: 2016. 3. 9.
 *      Author: SCH
 */

#ifndef SLIDE_CONTROL
#define SLIDE_CONTROL

#include <map>
#include <ros/ros.h>
#include <ros/package.h>
#include <std_msgs/Float64.h>
#include <std_msgs/String.h>

namespace robotis_manipulator_h
{
class slide_control
{
  ros::NodeHandle n;
  ros::Publisher  slide_pos_pub; 

public:
  slide_control();
  ~slide_control();

  /* ROS Topic Callback Functions */
  
  void slide_pub ();

  double goal_slide_pos;
  double result_slide_pos;
  double slide_pos;

};

}

#endif /* MANIPULATOR_BASE_MODULE_BASE_MODULE_H_ */
