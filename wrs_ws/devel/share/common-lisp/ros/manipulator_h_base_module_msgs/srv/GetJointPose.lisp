; Auto-generated. Do not edit!


(cl:in-package manipulator_h_base_module_msgs-srv)


;//! \htmlinclude GetJointPose-request.msg.html

(cl:defclass <GetJointPose-request> (roslisp-msg-protocol:ros-message)
  ((joint_name
    :reader joint_name
    :initarg :joint_name
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element "")))
)

(cl:defclass GetJointPose-request (<GetJointPose-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetJointPose-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetJointPose-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name manipulator_h_base_module_msgs-srv:<GetJointPose-request> is deprecated: use manipulator_h_base_module_msgs-srv:GetJointPose-request instead.")))

(cl:ensure-generic-function 'joint_name-val :lambda-list '(m))
(cl:defmethod joint_name-val ((m <GetJointPose-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader manipulator_h_base_module_msgs-srv:joint_name-val is deprecated.  Use manipulator_h_base_module_msgs-srv:joint_name instead.")
  (joint_name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetJointPose-request>) ostream)
  "Serializes a message object of type '<GetJointPose-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'joint_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'joint_name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetJointPose-request>) istream)
  "Deserializes a message object of type '<GetJointPose-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'joint_name) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'joint_name)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetJointPose-request>)))
  "Returns string type for a service object of type '<GetJointPose-request>"
  "manipulator_h_base_module_msgs/GetJointPoseRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetJointPose-request)))
  "Returns string type for a service object of type 'GetJointPose-request"
  "manipulator_h_base_module_msgs/GetJointPoseRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetJointPose-request>)))
  "Returns md5sum for a message object of type '<GetJointPose-request>"
  "a41e2236bf819259792cbf06540699bd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetJointPose-request)))
  "Returns md5sum for a message object of type 'GetJointPose-request"
  "a41e2236bf819259792cbf06540699bd")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetJointPose-request>)))
  "Returns full string definition for message of type '<GetJointPose-request>"
  (cl:format cl:nil "string[]    joint_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetJointPose-request)))
  "Returns full string definition for message of type 'GetJointPose-request"
  (cl:format cl:nil "string[]    joint_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetJointPose-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'joint_name) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetJointPose-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetJointPose-request
    (cl:cons ':joint_name (joint_name msg))
))
;//! \htmlinclude GetJointPose-response.msg.html

(cl:defclass <GetJointPose-response> (roslisp-msg-protocol:ros-message)
  ((joint_name
    :reader joint_name
    :initarg :joint_name
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element ""))
   (joint_value
    :reader joint_value
    :initarg :joint_value
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass GetJointPose-response (<GetJointPose-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetJointPose-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetJointPose-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name manipulator_h_base_module_msgs-srv:<GetJointPose-response> is deprecated: use manipulator_h_base_module_msgs-srv:GetJointPose-response instead.")))

(cl:ensure-generic-function 'joint_name-val :lambda-list '(m))
(cl:defmethod joint_name-val ((m <GetJointPose-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader manipulator_h_base_module_msgs-srv:joint_name-val is deprecated.  Use manipulator_h_base_module_msgs-srv:joint_name instead.")
  (joint_name m))

(cl:ensure-generic-function 'joint_value-val :lambda-list '(m))
(cl:defmethod joint_value-val ((m <GetJointPose-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader manipulator_h_base_module_msgs-srv:joint_value-val is deprecated.  Use manipulator_h_base_module_msgs-srv:joint_value instead.")
  (joint_value m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetJointPose-response>) ostream)
  "Serializes a message object of type '<GetJointPose-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'joint_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'joint_name))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'joint_value))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'joint_value))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetJointPose-response>) istream)
  "Deserializes a message object of type '<GetJointPose-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'joint_name) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'joint_name)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'joint_value) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'joint_value)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetJointPose-response>)))
  "Returns string type for a service object of type '<GetJointPose-response>"
  "manipulator_h_base_module_msgs/GetJointPoseResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetJointPose-response)))
  "Returns string type for a service object of type 'GetJointPose-response"
  "manipulator_h_base_module_msgs/GetJointPoseResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetJointPose-response>)))
  "Returns md5sum for a message object of type '<GetJointPose-response>"
  "a41e2236bf819259792cbf06540699bd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetJointPose-response)))
  "Returns md5sum for a message object of type 'GetJointPose-response"
  "a41e2236bf819259792cbf06540699bd")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetJointPose-response>)))
  "Returns full string definition for message of type '<GetJointPose-response>"
  (cl:format cl:nil "string[]    joint_name~%float64[]   joint_value~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetJointPose-response)))
  "Returns full string definition for message of type 'GetJointPose-response"
  (cl:format cl:nil "string[]    joint_name~%float64[]   joint_value~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetJointPose-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'joint_name) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'joint_value) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetJointPose-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetJointPose-response
    (cl:cons ':joint_name (joint_name msg))
    (cl:cons ':joint_value (joint_value msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetJointPose)))
  'GetJointPose-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetJointPose)))
  'GetJointPose-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetJointPose)))
  "Returns string type for a service object of type '<GetJointPose>"
  "manipulator_h_base_module_msgs/GetJointPose")