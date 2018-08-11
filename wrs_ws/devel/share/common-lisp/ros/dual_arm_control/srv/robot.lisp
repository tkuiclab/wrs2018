; Auto-generated. Do not edit!


(cl:in-package dual_arm_control-srv)


;//! \htmlinclude robot-request.msg.html

(cl:defclass <robot-request> (roslisp-msg-protocol:ros-message)
  ((slide_R
    :reader slide_R
    :initarg :slide_R
    :type cl:float
    :initform 0.0)
   (joint1_R
    :reader joint1_R
    :initarg :joint1_R
    :type cl:float
    :initform 0.0)
   (joint2_R
    :reader joint2_R
    :initarg :joint2_R
    :type cl:float
    :initform 0.0)
   (joint3_R
    :reader joint3_R
    :initarg :joint3_R
    :type cl:float
    :initform 0.0)
   (joint4_R
    :reader joint4_R
    :initarg :joint4_R
    :type cl:float
    :initform 0.0)
   (joint5_R
    :reader joint5_R
    :initarg :joint5_R
    :type cl:float
    :initform 0.0)
   (joint6_R
    :reader joint6_R
    :initarg :joint6_R
    :type cl:float
    :initform 0.0)
   (joint7_R
    :reader joint7_R
    :initarg :joint7_R
    :type cl:float
    :initform 0.0)
   (gripper_R
    :reader gripper_R
    :initarg :gripper_R
    :type cl:float
    :initform 0.0)
   (slide_L
    :reader slide_L
    :initarg :slide_L
    :type cl:float
    :initform 0.0)
   (joint1_L
    :reader joint1_L
    :initarg :joint1_L
    :type cl:float
    :initform 0.0)
   (joint2_L
    :reader joint2_L
    :initarg :joint2_L
    :type cl:float
    :initform 0.0)
   (joint3_L
    :reader joint3_L
    :initarg :joint3_L
    :type cl:float
    :initform 0.0)
   (joint4_L
    :reader joint4_L
    :initarg :joint4_L
    :type cl:float
    :initform 0.0)
   (joint5_L
    :reader joint5_L
    :initarg :joint5_L
    :type cl:float
    :initform 0.0)
   (joint6_L
    :reader joint6_L
    :initarg :joint6_L
    :type cl:float
    :initform 0.0)
   (joint7_L
    :reader joint7_L
    :initarg :joint7_L
    :type cl:float
    :initform 0.0)
   (gripper_L
    :reader gripper_L
    :initarg :gripper_L
    :type cl:float
    :initform 0.0))
)

(cl:defclass robot-request (<robot-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <robot-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'robot-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dual_arm_control-srv:<robot-request> is deprecated: use dual_arm_control-srv:robot-request instead.")))

(cl:ensure-generic-function 'slide_R-val :lambda-list '(m))
(cl:defmethod slide_R-val ((m <robot-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dual_arm_control-srv:slide_R-val is deprecated.  Use dual_arm_control-srv:slide_R instead.")
  (slide_R m))

(cl:ensure-generic-function 'joint1_R-val :lambda-list '(m))
(cl:defmethod joint1_R-val ((m <robot-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dual_arm_control-srv:joint1_R-val is deprecated.  Use dual_arm_control-srv:joint1_R instead.")
  (joint1_R m))

(cl:ensure-generic-function 'joint2_R-val :lambda-list '(m))
(cl:defmethod joint2_R-val ((m <robot-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dual_arm_control-srv:joint2_R-val is deprecated.  Use dual_arm_control-srv:joint2_R instead.")
  (joint2_R m))

(cl:ensure-generic-function 'joint3_R-val :lambda-list '(m))
(cl:defmethod joint3_R-val ((m <robot-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dual_arm_control-srv:joint3_R-val is deprecated.  Use dual_arm_control-srv:joint3_R instead.")
  (joint3_R m))

(cl:ensure-generic-function 'joint4_R-val :lambda-list '(m))
(cl:defmethod joint4_R-val ((m <robot-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dual_arm_control-srv:joint4_R-val is deprecated.  Use dual_arm_control-srv:joint4_R instead.")
  (joint4_R m))

(cl:ensure-generic-function 'joint5_R-val :lambda-list '(m))
(cl:defmethod joint5_R-val ((m <robot-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dual_arm_control-srv:joint5_R-val is deprecated.  Use dual_arm_control-srv:joint5_R instead.")
  (joint5_R m))

(cl:ensure-generic-function 'joint6_R-val :lambda-list '(m))
(cl:defmethod joint6_R-val ((m <robot-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dual_arm_control-srv:joint6_R-val is deprecated.  Use dual_arm_control-srv:joint6_R instead.")
  (joint6_R m))

(cl:ensure-generic-function 'joint7_R-val :lambda-list '(m))
(cl:defmethod joint7_R-val ((m <robot-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dual_arm_control-srv:joint7_R-val is deprecated.  Use dual_arm_control-srv:joint7_R instead.")
  (joint7_R m))

(cl:ensure-generic-function 'gripper_R-val :lambda-list '(m))
(cl:defmethod gripper_R-val ((m <robot-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dual_arm_control-srv:gripper_R-val is deprecated.  Use dual_arm_control-srv:gripper_R instead.")
  (gripper_R m))

(cl:ensure-generic-function 'slide_L-val :lambda-list '(m))
(cl:defmethod slide_L-val ((m <robot-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dual_arm_control-srv:slide_L-val is deprecated.  Use dual_arm_control-srv:slide_L instead.")
  (slide_L m))

(cl:ensure-generic-function 'joint1_L-val :lambda-list '(m))
(cl:defmethod joint1_L-val ((m <robot-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dual_arm_control-srv:joint1_L-val is deprecated.  Use dual_arm_control-srv:joint1_L instead.")
  (joint1_L m))

(cl:ensure-generic-function 'joint2_L-val :lambda-list '(m))
(cl:defmethod joint2_L-val ((m <robot-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dual_arm_control-srv:joint2_L-val is deprecated.  Use dual_arm_control-srv:joint2_L instead.")
  (joint2_L m))

(cl:ensure-generic-function 'joint3_L-val :lambda-list '(m))
(cl:defmethod joint3_L-val ((m <robot-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dual_arm_control-srv:joint3_L-val is deprecated.  Use dual_arm_control-srv:joint3_L instead.")
  (joint3_L m))

(cl:ensure-generic-function 'joint4_L-val :lambda-list '(m))
(cl:defmethod joint4_L-val ((m <robot-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dual_arm_control-srv:joint4_L-val is deprecated.  Use dual_arm_control-srv:joint4_L instead.")
  (joint4_L m))

(cl:ensure-generic-function 'joint5_L-val :lambda-list '(m))
(cl:defmethod joint5_L-val ((m <robot-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dual_arm_control-srv:joint5_L-val is deprecated.  Use dual_arm_control-srv:joint5_L instead.")
  (joint5_L m))

(cl:ensure-generic-function 'joint6_L-val :lambda-list '(m))
(cl:defmethod joint6_L-val ((m <robot-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dual_arm_control-srv:joint6_L-val is deprecated.  Use dual_arm_control-srv:joint6_L instead.")
  (joint6_L m))

(cl:ensure-generic-function 'joint7_L-val :lambda-list '(m))
(cl:defmethod joint7_L-val ((m <robot-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dual_arm_control-srv:joint7_L-val is deprecated.  Use dual_arm_control-srv:joint7_L instead.")
  (joint7_L m))

(cl:ensure-generic-function 'gripper_L-val :lambda-list '(m))
(cl:defmethod gripper_L-val ((m <robot-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dual_arm_control-srv:gripper_L-val is deprecated.  Use dual_arm_control-srv:gripper_L instead.")
  (gripper_L m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <robot-request>) ostream)
  "Serializes a message object of type '<robot-request>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'slide_R))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'joint1_R))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'joint2_R))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'joint3_R))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'joint4_R))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'joint5_R))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'joint6_R))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'joint7_R))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'gripper_R))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'slide_L))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'joint1_L))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'joint2_L))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'joint3_L))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'joint4_L))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'joint5_L))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'joint6_L))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'joint7_L))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'gripper_L))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <robot-request>) istream)
  "Deserializes a message object of type '<robot-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'slide_R) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'joint1_R) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'joint2_R) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'joint3_R) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'joint4_R) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'joint5_R) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'joint6_R) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'joint7_R) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'gripper_R) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'slide_L) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'joint1_L) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'joint2_L) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'joint3_L) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'joint4_L) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'joint5_L) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'joint6_L) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'joint7_L) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'gripper_L) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<robot-request>)))
  "Returns string type for a service object of type '<robot-request>"
  "dual_arm_control/robotRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'robot-request)))
  "Returns string type for a service object of type 'robot-request"
  "dual_arm_control/robotRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<robot-request>)))
  "Returns md5sum for a message object of type '<robot-request>"
  "302798b026bfb5b41c3f90f1e942eb92")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'robot-request)))
  "Returns md5sum for a message object of type 'robot-request"
  "302798b026bfb5b41c3f90f1e942eb92")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<robot-request>)))
  "Returns full string definition for message of type '<robot-request>"
  (cl:format cl:nil "float32 slide_R~%float32 joint1_R~%float32 joint2_R~%float32 joint3_R~%float32 joint4_R~%float32 joint5_R~%float32 joint6_R~%float32 joint7_R~%float32 gripper_R~%float32 slide_L~%float32 joint1_L~%float32 joint2_L~%float32 joint3_L~%float32 joint4_L~%float32 joint5_L~%float32 joint6_L~%float32 joint7_L~%float32 gripper_L~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'robot-request)))
  "Returns full string definition for message of type 'robot-request"
  (cl:format cl:nil "float32 slide_R~%float32 joint1_R~%float32 joint2_R~%float32 joint3_R~%float32 joint4_R~%float32 joint5_R~%float32 joint6_R~%float32 joint7_R~%float32 gripper_R~%float32 slide_L~%float32 joint1_L~%float32 joint2_L~%float32 joint3_L~%float32 joint4_L~%float32 joint5_L~%float32 joint6_L~%float32 joint7_L~%float32 gripper_L~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <robot-request>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <robot-request>))
  "Converts a ROS message object to a list"
  (cl:list 'robot-request
    (cl:cons ':slide_R (slide_R msg))
    (cl:cons ':joint1_R (joint1_R msg))
    (cl:cons ':joint2_R (joint2_R msg))
    (cl:cons ':joint3_R (joint3_R msg))
    (cl:cons ':joint4_R (joint4_R msg))
    (cl:cons ':joint5_R (joint5_R msg))
    (cl:cons ':joint6_R (joint6_R msg))
    (cl:cons ':joint7_R (joint7_R msg))
    (cl:cons ':gripper_R (gripper_R msg))
    (cl:cons ':slide_L (slide_L msg))
    (cl:cons ':joint1_L (joint1_L msg))
    (cl:cons ':joint2_L (joint2_L msg))
    (cl:cons ':joint3_L (joint3_L msg))
    (cl:cons ':joint4_L (joint4_L msg))
    (cl:cons ':joint5_L (joint5_L msg))
    (cl:cons ':joint6_L (joint6_L msg))
    (cl:cons ':joint7_L (joint7_L msg))
    (cl:cons ':gripper_L (gripper_L msg))
))
;//! \htmlinclude robot-response.msg.html

(cl:defclass <robot-response> (roslisp-msg-protocol:ros-message)
  ((state
    :reader state
    :initarg :state
    :type cl:string
    :initform ""))
)

(cl:defclass robot-response (<robot-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <robot-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'robot-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dual_arm_control-srv:<robot-response> is deprecated: use dual_arm_control-srv:robot-response instead.")))

(cl:ensure-generic-function 'state-val :lambda-list '(m))
(cl:defmethod state-val ((m <robot-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dual_arm_control-srv:state-val is deprecated.  Use dual_arm_control-srv:state instead.")
  (state m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <robot-response>) ostream)
  "Serializes a message object of type '<robot-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'state))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'state))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <robot-response>) istream)
  "Deserializes a message object of type '<robot-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'state) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'state) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<robot-response>)))
  "Returns string type for a service object of type '<robot-response>"
  "dual_arm_control/robotResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'robot-response)))
  "Returns string type for a service object of type 'robot-response"
  "dual_arm_control/robotResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<robot-response>)))
  "Returns md5sum for a message object of type '<robot-response>"
  "302798b026bfb5b41c3f90f1e942eb92")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'robot-response)))
  "Returns md5sum for a message object of type 'robot-response"
  "302798b026bfb5b41c3f90f1e942eb92")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<robot-response>)))
  "Returns full string definition for message of type '<robot-response>"
  (cl:format cl:nil "string state~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'robot-response)))
  "Returns full string definition for message of type 'robot-response"
  (cl:format cl:nil "string state~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <robot-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'state))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <robot-response>))
  "Converts a ROS message object to a list"
  (cl:list 'robot-response
    (cl:cons ':state (state msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'robot)))
  'robot-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'robot)))
  'robot-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'robot)))
  "Returns string type for a service object of type '<robot>"
  "dual_arm_control/robot")