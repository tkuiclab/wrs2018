# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "manipulator_h_base_module_msgs: 3 messages, 2 services")

set(MSG_I_FLAGS "-Imanipulator_h_base_module_msgs:/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(manipulator_h_base_module_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/msg/JointPose.msg" NAME_WE)
add_custom_target(_manipulator_h_base_module_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "manipulator_h_base_module_msgs" "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/msg/JointPose.msg" ""
)

get_filename_component(_filename "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/srv/GetJointPose.srv" NAME_WE)
add_custom_target(_manipulator_h_base_module_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "manipulator_h_base_module_msgs" "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/srv/GetJointPose.srv" ""
)

get_filename_component(_filename "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/msg/KinematicsPose.msg" NAME_WE)
add_custom_target(_manipulator_h_base_module_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "manipulator_h_base_module_msgs" "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/msg/KinematicsPose.msg" "geometry_msgs/Quaternion:geometry_msgs/Pose:geometry_msgs/Point"
)

get_filename_component(_filename "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/srv/GetKinematicsPose.srv" NAME_WE)
add_custom_target(_manipulator_h_base_module_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "manipulator_h_base_module_msgs" "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/srv/GetKinematicsPose.srv" "geometry_msgs/Quaternion:geometry_msgs/Pose:geometry_msgs/Point"
)

get_filename_component(_filename "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/msg/P2PPose.msg" NAME_WE)
add_custom_target(_manipulator_h_base_module_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "manipulator_h_base_module_msgs" "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/msg/P2PPose.msg" "geometry_msgs/Quaternion:geometry_msgs/Pose:geometry_msgs/Point"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(manipulator_h_base_module_msgs
  "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/msg/JointPose.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/manipulator_h_base_module_msgs
)
_generate_msg_cpp(manipulator_h_base_module_msgs
  "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/msg/KinematicsPose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/manipulator_h_base_module_msgs
)
_generate_msg_cpp(manipulator_h_base_module_msgs
  "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/msg/P2PPose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/manipulator_h_base_module_msgs
)

### Generating Services
_generate_srv_cpp(manipulator_h_base_module_msgs
  "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/srv/GetJointPose.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/manipulator_h_base_module_msgs
)
_generate_srv_cpp(manipulator_h_base_module_msgs
  "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/srv/GetKinematicsPose.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/manipulator_h_base_module_msgs
)

### Generating Module File
_generate_module_cpp(manipulator_h_base_module_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/manipulator_h_base_module_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(manipulator_h_base_module_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(manipulator_h_base_module_msgs_generate_messages manipulator_h_base_module_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/msg/JointPose.msg" NAME_WE)
add_dependencies(manipulator_h_base_module_msgs_generate_messages_cpp _manipulator_h_base_module_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/srv/GetJointPose.srv" NAME_WE)
add_dependencies(manipulator_h_base_module_msgs_generate_messages_cpp _manipulator_h_base_module_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/msg/KinematicsPose.msg" NAME_WE)
add_dependencies(manipulator_h_base_module_msgs_generate_messages_cpp _manipulator_h_base_module_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/srv/GetKinematicsPose.srv" NAME_WE)
add_dependencies(manipulator_h_base_module_msgs_generate_messages_cpp _manipulator_h_base_module_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/msg/P2PPose.msg" NAME_WE)
add_dependencies(manipulator_h_base_module_msgs_generate_messages_cpp _manipulator_h_base_module_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(manipulator_h_base_module_msgs_gencpp)
add_dependencies(manipulator_h_base_module_msgs_gencpp manipulator_h_base_module_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS manipulator_h_base_module_msgs_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(manipulator_h_base_module_msgs
  "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/msg/JointPose.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/manipulator_h_base_module_msgs
)
_generate_msg_eus(manipulator_h_base_module_msgs
  "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/msg/KinematicsPose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/manipulator_h_base_module_msgs
)
_generate_msg_eus(manipulator_h_base_module_msgs
  "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/msg/P2PPose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/manipulator_h_base_module_msgs
)

### Generating Services
_generate_srv_eus(manipulator_h_base_module_msgs
  "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/srv/GetJointPose.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/manipulator_h_base_module_msgs
)
_generate_srv_eus(manipulator_h_base_module_msgs
  "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/srv/GetKinematicsPose.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/manipulator_h_base_module_msgs
)

### Generating Module File
_generate_module_eus(manipulator_h_base_module_msgs
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/manipulator_h_base_module_msgs
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(manipulator_h_base_module_msgs_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(manipulator_h_base_module_msgs_generate_messages manipulator_h_base_module_msgs_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/msg/JointPose.msg" NAME_WE)
add_dependencies(manipulator_h_base_module_msgs_generate_messages_eus _manipulator_h_base_module_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/srv/GetJointPose.srv" NAME_WE)
add_dependencies(manipulator_h_base_module_msgs_generate_messages_eus _manipulator_h_base_module_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/msg/KinematicsPose.msg" NAME_WE)
add_dependencies(manipulator_h_base_module_msgs_generate_messages_eus _manipulator_h_base_module_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/srv/GetKinematicsPose.srv" NAME_WE)
add_dependencies(manipulator_h_base_module_msgs_generate_messages_eus _manipulator_h_base_module_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/msg/P2PPose.msg" NAME_WE)
add_dependencies(manipulator_h_base_module_msgs_generate_messages_eus _manipulator_h_base_module_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(manipulator_h_base_module_msgs_geneus)
add_dependencies(manipulator_h_base_module_msgs_geneus manipulator_h_base_module_msgs_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS manipulator_h_base_module_msgs_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(manipulator_h_base_module_msgs
  "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/msg/JointPose.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/manipulator_h_base_module_msgs
)
_generate_msg_lisp(manipulator_h_base_module_msgs
  "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/msg/KinematicsPose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/manipulator_h_base_module_msgs
)
_generate_msg_lisp(manipulator_h_base_module_msgs
  "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/msg/P2PPose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/manipulator_h_base_module_msgs
)

### Generating Services
_generate_srv_lisp(manipulator_h_base_module_msgs
  "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/srv/GetJointPose.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/manipulator_h_base_module_msgs
)
_generate_srv_lisp(manipulator_h_base_module_msgs
  "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/srv/GetKinematicsPose.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/manipulator_h_base_module_msgs
)

### Generating Module File
_generate_module_lisp(manipulator_h_base_module_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/manipulator_h_base_module_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(manipulator_h_base_module_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(manipulator_h_base_module_msgs_generate_messages manipulator_h_base_module_msgs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/msg/JointPose.msg" NAME_WE)
add_dependencies(manipulator_h_base_module_msgs_generate_messages_lisp _manipulator_h_base_module_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/srv/GetJointPose.srv" NAME_WE)
add_dependencies(manipulator_h_base_module_msgs_generate_messages_lisp _manipulator_h_base_module_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/msg/KinematicsPose.msg" NAME_WE)
add_dependencies(manipulator_h_base_module_msgs_generate_messages_lisp _manipulator_h_base_module_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/srv/GetKinematicsPose.srv" NAME_WE)
add_dependencies(manipulator_h_base_module_msgs_generate_messages_lisp _manipulator_h_base_module_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/msg/P2PPose.msg" NAME_WE)
add_dependencies(manipulator_h_base_module_msgs_generate_messages_lisp _manipulator_h_base_module_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(manipulator_h_base_module_msgs_genlisp)
add_dependencies(manipulator_h_base_module_msgs_genlisp manipulator_h_base_module_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS manipulator_h_base_module_msgs_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(manipulator_h_base_module_msgs
  "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/msg/JointPose.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/manipulator_h_base_module_msgs
)
_generate_msg_nodejs(manipulator_h_base_module_msgs
  "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/msg/KinematicsPose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/manipulator_h_base_module_msgs
)
_generate_msg_nodejs(manipulator_h_base_module_msgs
  "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/msg/P2PPose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/manipulator_h_base_module_msgs
)

### Generating Services
_generate_srv_nodejs(manipulator_h_base_module_msgs
  "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/srv/GetJointPose.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/manipulator_h_base_module_msgs
)
_generate_srv_nodejs(manipulator_h_base_module_msgs
  "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/srv/GetKinematicsPose.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/manipulator_h_base_module_msgs
)

### Generating Module File
_generate_module_nodejs(manipulator_h_base_module_msgs
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/manipulator_h_base_module_msgs
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(manipulator_h_base_module_msgs_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(manipulator_h_base_module_msgs_generate_messages manipulator_h_base_module_msgs_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/msg/JointPose.msg" NAME_WE)
add_dependencies(manipulator_h_base_module_msgs_generate_messages_nodejs _manipulator_h_base_module_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/srv/GetJointPose.srv" NAME_WE)
add_dependencies(manipulator_h_base_module_msgs_generate_messages_nodejs _manipulator_h_base_module_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/msg/KinematicsPose.msg" NAME_WE)
add_dependencies(manipulator_h_base_module_msgs_generate_messages_nodejs _manipulator_h_base_module_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/srv/GetKinematicsPose.srv" NAME_WE)
add_dependencies(manipulator_h_base_module_msgs_generate_messages_nodejs _manipulator_h_base_module_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/msg/P2PPose.msg" NAME_WE)
add_dependencies(manipulator_h_base_module_msgs_generate_messages_nodejs _manipulator_h_base_module_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(manipulator_h_base_module_msgs_gennodejs)
add_dependencies(manipulator_h_base_module_msgs_gennodejs manipulator_h_base_module_msgs_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS manipulator_h_base_module_msgs_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(manipulator_h_base_module_msgs
  "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/msg/JointPose.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/manipulator_h_base_module_msgs
)
_generate_msg_py(manipulator_h_base_module_msgs
  "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/msg/KinematicsPose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/manipulator_h_base_module_msgs
)
_generate_msg_py(manipulator_h_base_module_msgs
  "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/msg/P2PPose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/manipulator_h_base_module_msgs
)

### Generating Services
_generate_srv_py(manipulator_h_base_module_msgs
  "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/srv/GetJointPose.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/manipulator_h_base_module_msgs
)
_generate_srv_py(manipulator_h_base_module_msgs
  "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/srv/GetKinematicsPose.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/manipulator_h_base_module_msgs
)

### Generating Module File
_generate_module_py(manipulator_h_base_module_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/manipulator_h_base_module_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(manipulator_h_base_module_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(manipulator_h_base_module_msgs_generate_messages manipulator_h_base_module_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/msg/JointPose.msg" NAME_WE)
add_dependencies(manipulator_h_base_module_msgs_generate_messages_py _manipulator_h_base_module_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/srv/GetJointPose.srv" NAME_WE)
add_dependencies(manipulator_h_base_module_msgs_generate_messages_py _manipulator_h_base_module_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/msg/KinematicsPose.msg" NAME_WE)
add_dependencies(manipulator_h_base_module_msgs_generate_messages_py _manipulator_h_base_module_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/srv/GetKinematicsPose.srv" NAME_WE)
add_dependencies(manipulator_h_base_module_msgs_generate_messages_py _manipulator_h_base_module_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/andy/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/msg/P2PPose.msg" NAME_WE)
add_dependencies(manipulator_h_base_module_msgs_generate_messages_py _manipulator_h_base_module_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(manipulator_h_base_module_msgs_genpy)
add_dependencies(manipulator_h_base_module_msgs_genpy manipulator_h_base_module_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS manipulator_h_base_module_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/manipulator_h_base_module_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/manipulator_h_base_module_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(manipulator_h_base_module_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(manipulator_h_base_module_msgs_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/manipulator_h_base_module_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/manipulator_h_base_module_msgs
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(manipulator_h_base_module_msgs_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(manipulator_h_base_module_msgs_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/manipulator_h_base_module_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/manipulator_h_base_module_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(manipulator_h_base_module_msgs_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(manipulator_h_base_module_msgs_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/manipulator_h_base_module_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/manipulator_h_base_module_msgs
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(manipulator_h_base_module_msgs_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(manipulator_h_base_module_msgs_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/manipulator_h_base_module_msgs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/manipulator_h_base_module_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/manipulator_h_base_module_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(manipulator_h_base_module_msgs_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(manipulator_h_base_module_msgs_generate_messages_py geometry_msgs_generate_messages_py)
endif()
