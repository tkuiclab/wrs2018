;; Auto-generated. Do not edit!


(when (boundp 'manipulator_h_base_module_msgs::KinematicsPose)
  (if (not (find-package "MANIPULATOR_H_BASE_MODULE_MSGS"))
    (make-package "MANIPULATOR_H_BASE_MODULE_MSGS"))
  (shadow 'KinematicsPose (find-package "MANIPULATOR_H_BASE_MODULE_MSGS")))
(unless (find-package "MANIPULATOR_H_BASE_MODULE_MSGS::KINEMATICSPOSE")
  (make-package "MANIPULATOR_H_BASE_MODULE_MSGS::KINEMATICSPOSE"))

(in-package "ROS")
;;//! \htmlinclude KinematicsPose.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass manipulator_h_base_module_msgs::KinematicsPose
  :super ros::object
  :slots (_name _pose _phi ))

(defmethod manipulator_h_base_module_msgs::KinematicsPose
  (:init
   (&key
    ((:name __name) "")
    ((:pose __pose) (instance geometry_msgs::Pose :init))
    ((:phi __phi) 0.0)
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _pose __pose)
   (setq _phi (float __phi))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:pose
   (&rest __pose)
   (if (keywordp (car __pose))
       (send* _pose __pose)
     (progn
       (if __pose (setq _pose (car __pose)))
       _pose)))
  (:phi
   (&optional __phi)
   (if __phi (setq _phi __phi)) _phi)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; geometry_msgs/Pose _pose
    (send _pose :serialization-length)
    ;; float64 _phi
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; geometry_msgs/Pose _pose
       (send _pose :serialize s)
     ;; float64 _phi
       (sys::poke _phi (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; geometry_msgs/Pose _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;; float64 _phi
     (setq _phi (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get manipulator_h_base_module_msgs::KinematicsPose :md5sum-) "1c397375adafe753ee1c4c4f4e38ef9f")
(setf (get manipulator_h_base_module_msgs::KinematicsPose :datatype-) "manipulator_h_base_module_msgs/KinematicsPose")
(setf (get manipulator_h_base_module_msgs::KinematicsPose :definition-)
      "string    	   name
geometry_msgs/Pose pose
float64        phi
================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

")



(provide :manipulator_h_base_module_msgs/KinematicsPose "1c397375adafe753ee1c4c4f4e38ef9f")


