; Auto-generated. Do not edit!


(cl:in-package dual_arm_control-msg)


;//! \htmlinclude robot_msg.msg.html

(cl:defclass <robot_msg> (roslisp-msg-protocol:ros-message)
  ((A
    :reader A
    :initarg :A
    :type cl:float
    :initform 0.0))
)

(cl:defclass robot_msg (<robot_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <robot_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'robot_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dual_arm_control-msg:<robot_msg> is deprecated: use dual_arm_control-msg:robot_msg instead.")))

(cl:ensure-generic-function 'A-val :lambda-list '(m))
(cl:defmethod A-val ((m <robot_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dual_arm_control-msg:A-val is deprecated.  Use dual_arm_control-msg:A instead.")
  (A m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <robot_msg>) ostream)
  "Serializes a message object of type '<robot_msg>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'A))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <robot_msg>) istream)
  "Deserializes a message object of type '<robot_msg>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'A) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<robot_msg>)))
  "Returns string type for a message object of type '<robot_msg>"
  "dual_arm_control/robot_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'robot_msg)))
  "Returns string type for a message object of type 'robot_msg"
  "dual_arm_control/robot_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<robot_msg>)))
  "Returns md5sum for a message object of type '<robot_msg>"
  "86dc5e57feab1a2b50e6db6b5a647d08")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'robot_msg)))
  "Returns md5sum for a message object of type 'robot_msg"
  "86dc5e57feab1a2b50e6db6b5a647d08")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<robot_msg>)))
  "Returns full string definition for message of type '<robot_msg>"
  (cl:format cl:nil "float32 A~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'robot_msg)))
  "Returns full string definition for message of type 'robot_msg"
  (cl:format cl:nil "float32 A~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <robot_msg>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <robot_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'robot_msg
    (cl:cons ':A (A msg))
))
