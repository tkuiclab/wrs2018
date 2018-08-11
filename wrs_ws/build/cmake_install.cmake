# Install script for directory: /home/andy/wrs_ws/src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/andy/wrs_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
        file(MAKE_DIRECTORY "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
      endif()
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin")
        file(WRITE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin" "")
      endif()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/andy/wrs_ws/install/_setup_util.py")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/andy/wrs_ws/install" TYPE PROGRAM FILES "/home/andy/wrs_ws/build/catkin_generated/installspace/_setup_util.py")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/andy/wrs_ws/install/env.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/andy/wrs_ws/install" TYPE PROGRAM FILES "/home/andy/wrs_ws/build/catkin_generated/installspace/env.sh")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/andy/wrs_ws/install/setup.bash")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/andy/wrs_ws/install" TYPE FILE FILES "/home/andy/wrs_ws/build/catkin_generated/installspace/setup.bash")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/andy/wrs_ws/install/setup.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/andy/wrs_ws/install" TYPE FILE FILES "/home/andy/wrs_ws/build/catkin_generated/installspace/setup.sh")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/andy/wrs_ws/install/setup.zsh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/andy/wrs_ws/install" TYPE FILE FILES "/home/andy/wrs_ws/build/catkin_generated/installspace/setup.zsh")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/andy/wrs_ws/install/.rosinstall")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/andy/wrs_ws/install" TYPE FILE FILES "/home/andy/wrs_ws/build/catkin_generated/installspace/.rosinstall")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/andy/wrs_ws/build/gtest/cmake_install.cmake")
  include("/home/andy/wrs_ws/build/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h/cmake_install.cmake")
  include("/home/andy/wrs_ws/build/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_bringup/cmake_install.cmake")
  include("/home/andy/wrs_ws/build/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_description/cmake_install.cmake")
  include("/home/andy/wrs_ws/build/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_gazebo/cmake_install.cmake")
  include("/home/andy/wrs_ws/build/wrs_gazebo/dual_arm_control/cmake_install.cmake")
  include("/home/andy/wrs_ws/build/wrs_gazebo/mobile_dual_arm/cmake_install.cmake")
  include("/home/andy/wrs_ws/build/ROBOTIS/ROBOTIS-Framework/robotis_framework/cmake_install.cmake")
  include("/home/andy/wrs_ws/build/wrs_gazebo/single_arm/single_arm_control/cmake_install.cmake")
  include("/home/andy/wrs_ws/build/wrs_gazebo/single_arm/single_arm_description/cmake_install.cmake")
  include("/home/andy/wrs_ws/build/wrs_gazebo/single_arm/single_arm_gazebo/cmake_install.cmake")
  include("/home/andy/wrs_ws/build/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/cmake_install.cmake")
  include("/home/andy/wrs_ws/build/ROBOTIS/ROBOTIS-Framework-msgs/robotis_controller_msgs/cmake_install.cmake")
  include("/home/andy/wrs_ws/build/ROBOTIS/DynamixelSDK/c++/cmake_install.cmake")
  include("/home/andy/wrs_ws/build/kinematic/cmake_install.cmake")
  include("/home/andy/wrs_ws/build/linear_motion/cmake_install.cmake")
  include("/home/andy/wrs_ws/build/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_gui/cmake_install.cmake")
  include("/home/andy/wrs_ws/build/ROBOTIS/ROBOTIS-Framework/robotis_device/cmake_install.cmake")
  include("/home/andy/wrs_ws/build/ROBOTIS/ROBOTIS-Framework/robotis_framework_common/cmake_install.cmake")
  include("/home/andy/wrs_ws/build/ROBOTIS/ROBOTIS-Framework/robotis_controller/cmake_install.cmake")
  include("/home/andy/wrs_ws/build/ROBOTIS/ROBOTIS-Math/robotis_math/cmake_install.cmake")
  include("/home/andy/wrs_ws/build/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_kinematics_dynamics/cmake_install.cmake")
  include("/home/andy/wrs_ws/build/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module/cmake_install.cmake")
  include("/home/andy/wrs_ws/build/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_manager/cmake_install.cmake")
  include("/home/andy/wrs_ws/build/wrs_gazebo/Slide_rail/cmake_install.cmake")
  include("/home/andy/wrs_ws/build/wrs_gazebo/mobile_table/cmake_install.cmake")
  include("/home/andy/wrs_ws/build/wrs_gazebo/testcpp/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/andy/wrs_ws/build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
