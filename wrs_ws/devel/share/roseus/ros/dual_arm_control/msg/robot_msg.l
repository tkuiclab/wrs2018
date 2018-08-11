;; Auto-generated. Do not edit!


(when (boundp 'dual_arm_control::robot_msg)
  (if (not (find-package "DUAL_ARM_CONTROL"))
    (make-package "DUAL_ARM_CONTROL"))
  (shadow 'robot_msg (find-package "DUAL_ARM_CONTROL")))
(unless (find-package "DUAL_ARM_CONTROL::ROBOT_MSG")
  (make-package "DUAL_ARM_CONTROL::ROBOT_MSG"))

(in-package "ROS")
;;//! \htmlinclude robot_msg.msg.html


(defclass dual_arm_control::robot_msg
  :super ros::object
  :slots (_A ))

(defmethod dual_arm_control::robot_msg
  (:init
   (&key
    ((:A __A) 0.0)
    )
   (send-super :init)
   (setq _A (float __A))
   self)
  (:A
   (&optional __A)
   (if __A (setq _A __A)) _A)
  (:serialization-length
   ()
   (+
    ;; float32 _A
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _A
       (sys::poke _A (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _A
     (setq _A (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get dual_arm_control::robot_msg :md5sum-) "86dc5e57feab1a2b50e6db6b5a647d08")
(setf (get dual_arm_control::robot_msg :datatype-) "dual_arm_control/robot_msg")
(setf (get dual_arm_control::robot_msg :definition-)
      "float32 A

")



(provide :dual_arm_control/robot_msg "86dc5e57feab1a2b50e6db6b5a647d08")


