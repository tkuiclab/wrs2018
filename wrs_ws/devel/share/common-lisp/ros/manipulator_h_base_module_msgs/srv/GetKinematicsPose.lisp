; Auto-generated. Do not edit!


(cl:in-package manipulator_h_base_module_msgs-srv)


;//! \htmlinclude GetKinematicsPose-request.msg.html

(cl:defclass <GetKinematicsPose-request> (roslisp-msg-protocol:ros-message)
  ((group_name
    :reader group_name
    :initarg :group_name
    :type cl:string
    :initform ""))
)

(cl:defclass GetKinematicsPose-request (<GetKinematicsPose-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetKinematicsPose-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetKinematicsPose-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name manipulator_h_base_module_msgs-srv:<GetKinematicsPose-request> is deprecated: use manipulator_h_base_module_msgs-srv:GetKinematicsPose-request instead.")))

(cl:ensure-generic-function 'group_name-val :lambda-list '(m))
(cl:defmethod group_name-val ((m <GetKinematicsPose-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader manipulator_h_base_module_msgs-srv:group_name-val is deprecated.  Use manipulator_h_base_module_msgs-srv:group_name instead.")
  (group_name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetKinematicsPose-request>) ostream)
  "Serializes a message object of type '<GetKinematicsPose-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'group_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'group_name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetKinematicsPose-request>) istream)
  "Deserializes a message object of type '<GetKinematicsPose-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'group_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'group_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetKinematicsPose-request>)))
  "Returns string type for a service object of type '<GetKinematicsPose-request>"
  "manipulator_h_base_module_msgs/GetKinematicsPoseRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetKinematicsPose-request)))
  "Returns string type for a service object of type 'GetKinematicsPose-request"
  "manipulator_h_base_module_msgs/GetKinematicsPoseRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetKinematicsPose-request>)))
  "Returns md5sum for a message object of type '<GetKinematicsPose-request>"
  "2ed4552089555c3a5dd1cab00b55e858")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetKinematicsPose-request)))
  "Returns md5sum for a message object of type 'GetKinematicsPose-request"
  "2ed4552089555c3a5dd1cab00b55e858")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetKinematicsPose-request>)))
  "Returns full string definition for message of type '<GetKinematicsPose-request>"
  (cl:format cl:nil "string    group_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetKinematicsPose-request)))
  "Returns full string definition for message of type 'GetKinematicsPose-request"
  (cl:format cl:nil "string    group_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetKinematicsPose-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'group_name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetKinematicsPose-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetKinematicsPose-request
    (cl:cons ':group_name (group_name msg))
))
;//! \htmlinclude GetKinematicsPose-response.msg.html

(cl:defclass <GetKinematicsPose-response> (roslisp-msg-protocol:ros-message)
  ((group_pose
    :reader group_pose
    :initarg :group_pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose))
   (phi
    :reader phi
    :initarg :phi
    :type cl:float
    :initform 0.0))
)

(cl:defclass GetKinematicsPose-response (<GetKinematicsPose-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetKinematicsPose-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetKinematicsPose-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name manipulator_h_base_module_msgs-srv:<GetKinematicsPose-response> is deprecated: use manipulator_h_base_module_msgs-srv:GetKinematicsPose-response instead.")))

(cl:ensure-generic-function 'group_pose-val :lambda-list '(m))
(cl:defmethod group_pose-val ((m <GetKinematicsPose-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader manipulator_h_base_module_msgs-srv:group_pose-val is deprecated.  Use manipulator_h_base_module_msgs-srv:group_pose instead.")
  (group_pose m))

(cl:ensure-generic-function 'phi-val :lambda-list '(m))
(cl:defmethod phi-val ((m <GetKinematicsPose-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader manipulator_h_base_module_msgs-srv:phi-val is deprecated.  Use manipulator_h_base_module_msgs-srv:phi instead.")
  (phi m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetKinematicsPose-response>) ostream)
  "Serializes a message object of type '<GetKinematicsPose-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'group_pose) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'phi))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetKinematicsPose-response>) istream)
  "Deserializes a message object of type '<GetKinematicsPose-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'group_pose) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'phi) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetKinematicsPose-response>)))
  "Returns string type for a service object of type '<GetKinematicsPose-response>"
  "manipulator_h_base_module_msgs/GetKinematicsPoseResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetKinematicsPose-response)))
  "Returns string type for a service object of type 'GetKinematicsPose-response"
  "manipulator_h_base_module_msgs/GetKinematicsPoseResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetKinematicsPose-response>)))
  "Returns md5sum for a message object of type '<GetKinematicsPose-response>"
  "2ed4552089555c3a5dd1cab00b55e858")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetKinematicsPose-response)))
  "Returns md5sum for a message object of type 'GetKinematicsPose-response"
  "2ed4552089555c3a5dd1cab00b55e858")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetKinematicsPose-response>)))
  "Returns full string definition for message of type '<GetKinematicsPose-response>"
  (cl:format cl:nil "geometry_msgs/Pose group_pose~%float64        phi~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetKinematicsPose-response)))
  "Returns full string definition for message of type 'GetKinematicsPose-response"
  (cl:format cl:nil "geometry_msgs/Pose group_pose~%float64        phi~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetKinematicsPose-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'group_pose))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetKinematicsPose-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetKinematicsPose-response
    (cl:cons ':group_pose (group_pose msg))
    (cl:cons ':phi (phi msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetKinematicsPose)))
  'GetKinematicsPose-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetKinematicsPose)))
  'GetKinematicsPose-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetKinematicsPose)))
  "Returns string type for a service object of type '<GetKinematicsPose>"
  "manipulator_h_base_module_msgs/GetKinematicsPose")