# Install script for directory: /home/wrs/wrs2018/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/wrs/wrs2018/wrs_ws/install")
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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/manipulator_h_base_module_msgs/msg" TYPE FILE FILES
    "/home/wrs/wrs2018/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/msg/JointPose.msg"
    "/home/wrs/wrs2018/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/msg/KinematicsPose.msg"
    "/home/wrs/wrs2018/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/msg/P2PPose.msg"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/manipulator_h_base_module_msgs/srv" TYPE FILE FILES
    "/home/wrs/wrs2018/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/srv/GetJointPose.srv"
    "/home/wrs/wrs2018/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/srv/GetKinematicsPose.srv"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/manipulator_h_base_module_msgs/cmake" TYPE FILE FILES "/home/wrs/wrs2018/wrs_ws/build/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/catkin_generated/installspace/manipulator_h_base_module_msgs-msg-paths.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/wrs/wrs2018/wrs_ws/devel/include/manipulator_h_base_module_msgs")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/wrs/wrs2018/wrs_ws/devel/share/roseus/ros/manipulator_h_base_module_msgs")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/wrs/wrs2018/wrs_ws/devel/share/common-lisp/ros/manipulator_h_base_module_msgs")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/wrs/wrs2018/wrs_ws/devel/share/gennodejs/ros/manipulator_h_base_module_msgs")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  execute_process(COMMAND "/usr/bin/python" -m compileall "/home/wrs/wrs2018/wrs_ws/devel/lib/python2.7/dist-packages/manipulator_h_base_module_msgs")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/wrs/wrs2018/wrs_ws/devel/lib/python2.7/dist-packages/manipulator_h_base_module_msgs")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/wrs/wrs2018/wrs_ws/build/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/catkin_generated/installspace/manipulator_h_base_module_msgs.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/manipulator_h_base_module_msgs/cmake" TYPE FILE FILES "/home/wrs/wrs2018/wrs_ws/build/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/catkin_generated/installspace/manipulator_h_base_module_msgs-msg-extras.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/manipulator_h_base_module_msgs/cmake" TYPE FILE FILES
    "/home/wrs/wrs2018/wrs_ws/build/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/catkin_generated/installspace/manipulator_h_base_module_msgsConfig.cmake"
    "/home/wrs/wrs2018/wrs_ws/build/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/catkin_generated/installspace/manipulator_h_base_module_msgsConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/manipulator_h_base_module_msgs" TYPE FILE FILES "/home/wrs/wrs2018/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/package.xml")
endif()

