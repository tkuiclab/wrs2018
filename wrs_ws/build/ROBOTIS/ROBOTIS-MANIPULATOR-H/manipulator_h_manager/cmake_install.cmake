# Install script for directory: /home/wrs/wrs2018/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_manager

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/wrs/wrs2018/wrs_ws/build/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_manager/catkin_generated/installspace/manipulator_h_manager.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/manipulator_h_manager/cmake" TYPE FILE FILES
    "/home/wrs/wrs2018/wrs_ws/build/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_manager/catkin_generated/installspace/manipulator_h_managerConfig.cmake"
    "/home/wrs/wrs2018/wrs_ws/build/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_manager/catkin_generated/installspace/manipulator_h_managerConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/manipulator_h_manager" TYPE FILE FILES "/home/wrs/wrs2018/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_manager/package.xml")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/manipulator_h_manager/manipulator_h_manager" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/manipulator_h_manager/manipulator_h_manager")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/manipulator_h_manager/manipulator_h_manager"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/manipulator_h_manager" TYPE EXECUTABLE FILES "/home/wrs/wrs2018/wrs_ws/devel/lib/manipulator_h_manager/manipulator_h_manager")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/manipulator_h_manager/manipulator_h_manager" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/manipulator_h_manager/manipulator_h_manager")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/manipulator_h_manager/manipulator_h_manager"
         OLD_RPATH "/home/wrs/wrs2018/wrs_ws/devel/lib:/opt/ros/kinetic/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/manipulator_h_manager/manipulator_h_manager")
    endif()
  endif()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/manipulator_h_manager" TYPE DIRECTORY FILES
    "/home/wrs/wrs2018/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_manager/config"
    "/home/wrs/wrs2018/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_manager/launch"
    )
endif()

