; Auto-generated. Do not edit!


(cl:in-package manipulator_h_base_module_msgs-msg)


;//! \htmlinclude KinematicsPose.msg.html

(cl:defclass <KinematicsPose> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (pose
    :reader pose
    :initarg :pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose))
   (phi
    :reader phi
    :initarg :phi
    :type cl:float
    :initform 0.0))
)

(cl:defclass KinematicsPose (<KinematicsPose>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <KinematicsPose>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'KinematicsPose)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name manipulator_h_base_module_msgs-msg:<KinematicsPose> is deprecated: use manipulator_h_base_module_msgs-msg:KinematicsPose instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <KinematicsPose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader manipulator_h_base_module_msgs-msg:name-val is deprecated.  Use manipulator_h_base_module_msgs-msg:name instead.")
  (name m))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <KinematicsPose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader manipulator_h_base_module_msgs-msg:pose-val is deprecated.  Use manipulator_h_base_module_msgs-msg:pose instead.")
  (pose m))

(cl:ensure-generic-function 'phi-val :lambda-list '(m))
(cl:defmethod phi-val ((m <KinematicsPose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader manipulator_h_base_module_msgs-msg:phi-val is deprecated.  Use manipulator_h_base_module_msgs-msg:phi instead.")
  (phi m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <KinematicsPose>) ostream)
  "Serializes a message object of type '<KinematicsPose>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <KinematicsPose>) istream)
  "Deserializes a message object of type '<KinematicsPose>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<KinematicsPose>)))
  "Returns string type for a message object of type '<KinematicsPose>"
  "manipulator_h_base_module_msgs/KinematicsPose")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'KinematicsPose)))
  "Returns string type for a message object of type 'KinematicsPose"
  "manipulator_h_base_module_msgs/KinematicsPose")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<KinematicsPose>)))
  "Returns md5sum for a message object of type '<KinematicsPose>"
  "1c397375adafe753ee1c4c4f4e38ef9f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'KinematicsPose)))
  "Returns md5sum for a message object of type 'KinematicsPose"
  "1c397375adafe753ee1c4c4f4e38ef9f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<KinematicsPose>)))
  "Returns full string definition for message of type '<KinematicsPose>"
  (cl:format cl:nil "string    	   name~%geometry_msgs/Pose pose~%float64        phi~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'KinematicsPose)))
  "Returns full string definition for message of type 'KinematicsPose"
  (cl:format cl:nil "string    	   name~%geometry_msgs/Pose pose~%float64        phi~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <KinematicsPose>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <KinematicsPose>))
  "Converts a ROS message object to a list"
  (cl:list 'KinematicsPose
    (cl:cons ':name (name msg))
    (cl:cons ':pose (pose msg))
    (cl:cons ':phi (phi msg))
))
