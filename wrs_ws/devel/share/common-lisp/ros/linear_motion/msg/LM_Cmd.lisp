; Auto-generated. Do not edit!


(cl:in-package linear_motion-msg)


;//! \htmlinclude LM_Cmd.msg.html

(cl:defclass <LM_Cmd> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:integer
    :initform 0)
   (x
    :reader x
    :initarg :x
    :type cl:integer
    :initform 0)
   (z
    :reader z
    :initarg :z
    :type cl:integer
    :initform 0)
   (left
    :reader left
    :initarg :left
    :type cl:integer
    :initform 0)
   (x_curr_pos
    :reader x_curr_pos
    :initarg :x_curr_pos
    :type cl:integer
    :initform 0)
   (z_curr_pos
    :reader z_curr_pos
    :initarg :z_curr_pos
    :type cl:integer
    :initform 0)
   (left_curr_pos
    :reader left_curr_pos
    :initarg :left_curr_pos
    :type cl:integer
    :initform 0)
   (is_busy
    :reader is_busy
    :initarg :is_busy
    :type cl:boolean
    :initform cl:nil)
   (status
    :reader status
    :initarg :status
    :type cl:string
    :initform ""))
)

(cl:defclass LM_Cmd (<LM_Cmd>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LM_Cmd>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LM_Cmd)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name linear_motion-msg:<LM_Cmd> is deprecated: use linear_motion-msg:LM_Cmd instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <LM_Cmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader linear_motion-msg:id-val is deprecated.  Use linear_motion-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <LM_Cmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader linear_motion-msg:x-val is deprecated.  Use linear_motion-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'z-val :lambda-list '(m))
(cl:defmethod z-val ((m <LM_Cmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader linear_motion-msg:z-val is deprecated.  Use linear_motion-msg:z instead.")
  (z m))

(cl:ensure-generic-function 'left-val :lambda-list '(m))
(cl:defmethod left-val ((m <LM_Cmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader linear_motion-msg:left-val is deprecated.  Use linear_motion-msg:left instead.")
  (left m))

(cl:ensure-generic-function 'x_curr_pos-val :lambda-list '(m))
(cl:defmethod x_curr_pos-val ((m <LM_Cmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader linear_motion-msg:x_curr_pos-val is deprecated.  Use linear_motion-msg:x_curr_pos instead.")
  (x_curr_pos m))

(cl:ensure-generic-function 'z_curr_pos-val :lambda-list '(m))
(cl:defmethod z_curr_pos-val ((m <LM_Cmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader linear_motion-msg:z_curr_pos-val is deprecated.  Use linear_motion-msg:z_curr_pos instead.")
  (z_curr_pos m))

(cl:ensure-generic-function 'left_curr_pos-val :lambda-list '(m))
(cl:defmethod left_curr_pos-val ((m <LM_Cmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader linear_motion-msg:left_curr_pos-val is deprecated.  Use linear_motion-msg:left_curr_pos instead.")
  (left_curr_pos m))

(cl:ensure-generic-function 'is_busy-val :lambda-list '(m))
(cl:defmethod is_busy-val ((m <LM_Cmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader linear_motion-msg:is_busy-val is deprecated.  Use linear_motion-msg:is_busy instead.")
  (is_busy m))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <LM_Cmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader linear_motion-msg:status-val is deprecated.  Use linear_motion-msg:status instead.")
  (status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LM_Cmd>) ostream)
  "Serializes a message object of type '<LM_Cmd>"
  (cl:let* ((signed (cl:slot-value msg 'id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'x)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'z)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'left)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'x_curr_pos)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'z_curr_pos)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'left_curr_pos)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'is_busy) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'status))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'status))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LM_Cmd>) istream)
  "Deserializes a message object of type '<LM_Cmd>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'x) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'z) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'left) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'x_curr_pos) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'z_curr_pos) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'left_curr_pos) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:setf (cl:slot-value msg 'is_busy) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'status) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'status) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LM_Cmd>)))
  "Returns string type for a message object of type '<LM_Cmd>"
  "linear_motion/LM_Cmd")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LM_Cmd)))
  "Returns string type for a message object of type 'LM_Cmd"
  "linear_motion/LM_Cmd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LM_Cmd>)))
  "Returns md5sum for a message object of type '<LM_Cmd>"
  "8a5050a3fcf89f1ce1c712656c2d84a1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LM_Cmd)))
  "Returns md5sum for a message object of type 'LM_Cmd"
  "8a5050a3fcf89f1ce1c712656c2d84a1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LM_Cmd>)))
  "Returns full string definition for message of type '<LM_Cmd>"
  (cl:format cl:nil "int32 id~%~%int32 x~%int32 z~%int32 left~%~%int32 x_curr_pos~%int32 z_curr_pos~%int32 left_curr_pos~%~%bool is_busy~%string status ~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LM_Cmd)))
  "Returns full string definition for message of type 'LM_Cmd"
  (cl:format cl:nil "int32 id~%~%int32 x~%int32 z~%int32 left~%~%int32 x_curr_pos~%int32 z_curr_pos~%int32 left_curr_pos~%~%bool is_busy~%string status ~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LM_Cmd>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
     4
     1
     4 (cl:length (cl:slot-value msg 'status))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LM_Cmd>))
  "Converts a ROS message object to a list"
  (cl:list 'LM_Cmd
    (cl:cons ':id (id msg))
    (cl:cons ':x (x msg))
    (cl:cons ':z (z msg))
    (cl:cons ':left (left msg))
    (cl:cons ':x_curr_pos (x_curr_pos msg))
    (cl:cons ':z_curr_pos (z_curr_pos msg))
    (cl:cons ':left_curr_pos (left_curr_pos msg))
    (cl:cons ':is_busy (is_busy msg))
    (cl:cons ':status (status msg))
))
