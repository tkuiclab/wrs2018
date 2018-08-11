;; Auto-generated. Do not edit!


(when (boundp 'dual_arm_control::robot)
  (if (not (find-package "DUAL_ARM_CONTROL"))
    (make-package "DUAL_ARM_CONTROL"))
  (shadow 'robot (find-package "DUAL_ARM_CONTROL")))
(unless (find-package "DUAL_ARM_CONTROL::ROBOT")
  (make-package "DUAL_ARM_CONTROL::ROBOT"))
(unless (find-package "DUAL_ARM_CONTROL::ROBOTREQUEST")
  (make-package "DUAL_ARM_CONTROL::ROBOTREQUEST"))
(unless (find-package "DUAL_ARM_CONTROL::ROBOTRESPONSE")
  (make-package "DUAL_ARM_CONTROL::ROBOTRESPONSE"))

(in-package "ROS")





(defclass dual_arm_control::robotRequest
  :super ros::object
  :slots (_slide_R _joint1_R _joint2_R _joint3_R _joint4_R _joint5_R _joint6_R _joint7_R _gripper_R _slide_L _joint1_L _joint2_L _joint3_L _joint4_L _joint5_L _joint6_L _joint7_L _gripper_L ))

(defmethod dual_arm_control::robotRequest
  (:init
   (&key
    ((:slide_R __slide_R) 0.0)
    ((:joint1_R __joint1_R) 0.0)
    ((:joint2_R __joint2_R) 0.0)
    ((:joint3_R __joint3_R) 0.0)
    ((:joint4_R __joint4_R) 0.0)
    ((:joint5_R __joint5_R) 0.0)
    ((:joint6_R __joint6_R) 0.0)
    ((:joint7_R __joint7_R) 0.0)
    ((:gripper_R __gripper_R) 0.0)
    ((:slide_L __slide_L) 0.0)
    ((:joint1_L __joint1_L) 0.0)
    ((:joint2_L __joint2_L) 0.0)
    ((:joint3_L __joint3_L) 0.0)
    ((:joint4_L __joint4_L) 0.0)
    ((:joint5_L __joint5_L) 0.0)
    ((:joint6_L __joint6_L) 0.0)
    ((:joint7_L __joint7_L) 0.0)
    ((:gripper_L __gripper_L) 0.0)
    )
   (send-super :init)
   (setq _slide_R (float __slide_R))
   (setq _joint1_R (float __joint1_R))
   (setq _joint2_R (float __joint2_R))
   (setq _joint3_R (float __joint3_R))
   (setq _joint4_R (float __joint4_R))
   (setq _joint5_R (float __joint5_R))
   (setq _joint6_R (float __joint6_R))
   (setq _joint7_R (float __joint7_R))
   (setq _gripper_R (float __gripper_R))
   (setq _slide_L (float __slide_L))
   (setq _joint1_L (float __joint1_L))
   (setq _joint2_L (float __joint2_L))
   (setq _joint3_L (float __joint3_L))
   (setq _joint4_L (float __joint4_L))
   (setq _joint5_L (float __joint5_L))
   (setq _joint6_L (float __joint6_L))
   (setq _joint7_L (float __joint7_L))
   (setq _gripper_L (float __gripper_L))
   self)
  (:slide_R
   (&optional __slide_R)
   (if __slide_R (setq _slide_R __slide_R)) _slide_R)
  (:joint1_R
   (&optional __joint1_R)
   (if __joint1_R (setq _joint1_R __joint1_R)) _joint1_R)
  (:joint2_R
   (&optional __joint2_R)
   (if __joint2_R (setq _joint2_R __joint2_R)) _joint2_R)
  (:joint3_R
   (&optional __joint3_R)
   (if __joint3_R (setq _joint3_R __joint3_R)) _joint3_R)
  (:joint4_R
   (&optional __joint4_R)
   (if __joint4_R (setq _joint4_R __joint4_R)) _joint4_R)
  (:joint5_R
   (&optional __joint5_R)
   (if __joint5_R (setq _joint5_R __joint5_R)) _joint5_R)
  (:joint6_R
   (&optional __joint6_R)
   (if __joint6_R (setq _joint6_R __joint6_R)) _joint6_R)
  (:joint7_R
   (&optional __joint7_R)
   (if __joint7_R (setq _joint7_R __joint7_R)) _joint7_R)
  (:gripper_R
   (&optional __gripper_R)
   (if __gripper_R (setq _gripper_R __gripper_R)) _gripper_R)
  (:slide_L
   (&optional __slide_L)
   (if __slide_L (setq _slide_L __slide_L)) _slide_L)
  (:joint1_L
   (&optional __joint1_L)
   (if __joint1_L (setq _joint1_L __joint1_L)) _joint1_L)
  (:joint2_L
   (&optional __joint2_L)
   (if __joint2_L (setq _joint2_L __joint2_L)) _joint2_L)
  (:joint3_L
   (&optional __joint3_L)
   (if __joint3_L (setq _joint3_L __joint3_L)) _joint3_L)
  (:joint4_L
   (&optional __joint4_L)
   (if __joint4_L (setq _joint4_L __joint4_L)) _joint4_L)
  (:joint5_L
   (&optional __joint5_L)
   (if __joint5_L (setq _joint5_L __joint5_L)) _joint5_L)
  (:joint6_L
   (&optional __joint6_L)
   (if __joint6_L (setq _joint6_L __joint6_L)) _joint6_L)
  (:joint7_L
   (&optional __joint7_L)
   (if __joint7_L (setq _joint7_L __joint7_L)) _joint7_L)
  (:gripper_L
   (&optional __gripper_L)
   (if __gripper_L (setq _gripper_L __gripper_L)) _gripper_L)
  (:serialization-length
   ()
   (+
    ;; float32 _slide_R
    4
    ;; float32 _joint1_R
    4
    ;; float32 _joint2_R
    4
    ;; float32 _joint3_R
    4
    ;; float32 _joint4_R
    4
    ;; float32 _joint5_R
    4
    ;; float32 _joint6_R
    4
    ;; float32 _joint7_R
    4
    ;; float32 _gripper_R
    4
    ;; float32 _slide_L
    4
    ;; float32 _joint1_L
    4
    ;; float32 _joint2_L
    4
    ;; float32 _joint3_L
    4
    ;; float32 _joint4_L
    4
    ;; float32 _joint5_L
    4
    ;; float32 _joint6_L
    4
    ;; float32 _joint7_L
    4
    ;; float32 _gripper_L
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _slide_R
       (sys::poke _slide_R (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _joint1_R
       (sys::poke _joint1_R (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _joint2_R
       (sys::poke _joint2_R (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _joint3_R
       (sys::poke _joint3_R (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _joint4_R
       (sys::poke _joint4_R (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _joint5_R
       (sys::poke _joint5_R (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _joint6_R
       (sys::poke _joint6_R (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _joint7_R
       (sys::poke _joint7_R (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _gripper_R
       (sys::poke _gripper_R (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _slide_L
       (sys::poke _slide_L (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _joint1_L
       (sys::poke _joint1_L (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _joint2_L
       (sys::poke _joint2_L (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _joint3_L
       (sys::poke _joint3_L (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _joint4_L
       (sys::poke _joint4_L (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _joint5_L
       (sys::poke _joint5_L (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _joint6_L
       (sys::poke _joint6_L (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _joint7_L
       (sys::poke _joint7_L (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _gripper_L
       (sys::poke _gripper_L (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _slide_R
     (setq _slide_R (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _joint1_R
     (setq _joint1_R (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _joint2_R
     (setq _joint2_R (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _joint3_R
     (setq _joint3_R (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _joint4_R
     (setq _joint4_R (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _joint5_R
     (setq _joint5_R (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _joint6_R
     (setq _joint6_R (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _joint7_R
     (setq _joint7_R (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _gripper_R
     (setq _gripper_R (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _slide_L
     (setq _slide_L (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _joint1_L
     (setq _joint1_L (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _joint2_L
     (setq _joint2_L (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _joint3_L
     (setq _joint3_L (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _joint4_L
     (setq _joint4_L (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _joint5_L
     (setq _joint5_L (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _joint6_L
     (setq _joint6_L (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _joint7_L
     (setq _joint7_L (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _gripper_L
     (setq _gripper_L (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass dual_arm_control::robotResponse
  :super ros::object
  :slots (_state ))

(defmethod dual_arm_control::robotResponse
  (:init
   (&key
    ((:state __state) "")
    )
   (send-super :init)
   (setq _state (string __state))
   self)
  (:state
   (&optional __state)
   (if __state (setq _state __state)) _state)
  (:serialization-length
   ()
   (+
    ;; string _state
    4 (length _state)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _state
       (write-long (length _state) s) (princ _state s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _state
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _state (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass dual_arm_control::robot
  :super ros::object
  :slots ())

(setf (get dual_arm_control::robot :md5sum-) "302798b026bfb5b41c3f90f1e942eb92")
(setf (get dual_arm_control::robot :datatype-) "dual_arm_control/robot")
(setf (get dual_arm_control::robot :request) dual_arm_control::robotRequest)
(setf (get dual_arm_control::robot :response) dual_arm_control::robotResponse)

(defmethod dual_arm_control::robotRequest
  (:response () (instance dual_arm_control::robotResponse :init)))

(setf (get dual_arm_control::robotRequest :md5sum-) "302798b026bfb5b41c3f90f1e942eb92")
(setf (get dual_arm_control::robotRequest :datatype-) "dual_arm_control/robotRequest")
(setf (get dual_arm_control::robotRequest :definition-)
      "float32 slide_R
float32 joint1_R
float32 joint2_R
float32 joint3_R
float32 joint4_R
float32 joint5_R
float32 joint6_R
float32 joint7_R
float32 gripper_R
float32 slide_L
float32 joint1_L
float32 joint2_L
float32 joint3_L
float32 joint4_L
float32 joint5_L
float32 joint6_L
float32 joint7_L
float32 gripper_L
---
string state

")

(setf (get dual_arm_control::robotResponse :md5sum-) "302798b026bfb5b41c3f90f1e942eb92")
(setf (get dual_arm_control::robotResponse :datatype-) "dual_arm_control/robotResponse")
(setf (get dual_arm_control::robotResponse :definition-)
      "float32 slide_R
float32 joint1_R
float32 joint2_R
float32 joint3_R
float32 joint4_R
float32 joint5_R
float32 joint6_R
float32 joint7_R
float32 gripper_R
float32 slide_L
float32 joint1_L
float32 joint2_L
float32 joint3_L
float32 joint4_L
float32 joint5_L
float32 joint6_L
float32 joint7_L
float32 gripper_L
---
string state

")



(provide :dual_arm_control/robot "302798b026bfb5b41c3f90f1e942eb92")


