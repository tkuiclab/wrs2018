;; Auto-generated. Do not edit!


(when (boundp 'manipulator_h_base_module_msgs::GetKinematicsPose)
  (if (not (find-package "MANIPULATOR_H_BASE_MODULE_MSGS"))
    (make-package "MANIPULATOR_H_BASE_MODULE_MSGS"))
  (shadow 'GetKinematicsPose (find-package "MANIPULATOR_H_BASE_MODULE_MSGS")))
(unless (find-package "MANIPULATOR_H_BASE_MODULE_MSGS::GETKINEMATICSPOSE")
  (make-package "MANIPULATOR_H_BASE_MODULE_MSGS::GETKINEMATICSPOSE"))
(unless (find-package "MANIPULATOR_H_BASE_MODULE_MSGS::GETKINEMATICSPOSEREQUEST")
  (make-package "MANIPULATOR_H_BASE_MODULE_MSGS::GETKINEMATICSPOSEREQUEST"))
(unless (find-package "MANIPULATOR_H_BASE_MODULE_MSGS::GETKINEMATICSPOSERESPONSE")
  (make-package "MANIPULATOR_H_BASE_MODULE_MSGS::GETKINEMATICSPOSERESPONSE"))

(in-package "ROS")



(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass manipulator_h_base_module_msgs::GetKinematicsPoseRequest
  :super ros::object
  :slots (_group_name ))

(defmethod manipulator_h_base_module_msgs::GetKinematicsPoseRequest
  (:init
   (&key
    ((:group_name __group_name) "")
    )
   (send-super :init)
   (setq _group_name (string __group_name))
   self)
  (:group_name
   (&optional __group_name)
   (if __group_name (setq _group_name __group_name)) _group_name)
  (:serialization-length
   ()
   (+
    ;; string _group_name
    4 (length _group_name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _group_name
       (write-long (length _group_name) s) (princ _group_name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _group_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _group_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass manipulator_h_base_module_msgs::GetKinematicsPoseResponse
  :super ros::object
  :slots (_group_pose _phi ))

(defmethod manipulator_h_base_module_msgs::GetKinematicsPoseResponse
  (:init
   (&key
    ((:group_pose __group_pose) (instance geometry_msgs::Pose :init))
    ((:phi __phi) 0.0)
    )
   (send-super :init)
   (setq _group_pose __group_pose)
   (setq _phi (float __phi))
   self)
  (:group_pose
   (&rest __group_pose)
   (if (keywordp (car __group_pose))
       (send* _group_pose __group_pose)
     (progn
       (if __group_pose (setq _group_pose (car __group_pose)))
       _group_pose)))
  (:phi
   (&optional __phi)
   (if __phi (setq _phi __phi)) _phi)
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Pose _group_pose
    (send _group_pose :serialization-length)
    ;; float64 _phi
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Pose _group_pose
       (send _group_pose :serialize s)
     ;; float64 _phi
       (sys::poke _phi (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Pose _group_pose
     (send _group_pose :deserialize buf ptr-) (incf ptr- (send _group_pose :serialization-length))
   ;; float64 _phi
     (setq _phi (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass manipulator_h_base_module_msgs::GetKinematicsPose
  :super ros::object
  :slots ())

(setf (get manipulator_h_base_module_msgs::GetKinematicsPose :md5sum-) "2ed4552089555c3a5dd1cab00b55e858")
(setf (get manipulator_h_base_module_msgs::GetKinematicsPose :datatype-) "manipulator_h_base_module_msgs/GetKinematicsPose")
(setf (get manipulator_h_base_module_msgs::GetKinematicsPose :request) manipulator_h_base_module_msgs::GetKinematicsPoseRequest)
(setf (get manipulator_h_base_module_msgs::GetKinematicsPose :response) manipulator_h_base_module_msgs::GetKinematicsPoseResponse)

(defmethod manipulator_h_base_module_msgs::GetKinematicsPoseRequest
  (:response () (instance manipulator_h_base_module_msgs::GetKinematicsPoseResponse :init)))

(setf (get manipulator_h_base_module_msgs::GetKinematicsPoseRequest :md5sum-) "2ed4552089555c3a5dd1cab00b55e858")
(setf (get manipulator_h_base_module_msgs::GetKinematicsPoseRequest :datatype-) "manipulator_h_base_module_msgs/GetKinematicsPoseRequest")
(setf (get manipulator_h_base_module_msgs::GetKinematicsPoseRequest :definition-)
      "string    group_name
---
geometry_msgs/Pose group_pose
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

(setf (get manipulator_h_base_module_msgs::GetKinematicsPoseResponse :md5sum-) "2ed4552089555c3a5dd1cab00b55e858")
(setf (get manipulator_h_base_module_msgs::GetKinematicsPoseResponse :datatype-) "manipulator_h_base_module_msgs/GetKinematicsPoseResponse")
(setf (get manipulator_h_base_module_msgs::GetKinematicsPoseResponse :definition-)
      "string    group_name
---
geometry_msgs/Pose group_pose
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



(provide :manipulator_h_base_module_msgs/GetKinematicsPose "2ed4552089555c3a5dd1cab00b55e858")


