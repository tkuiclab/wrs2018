;; Auto-generated. Do not edit!


(when (boundp 'manipulator_h_base_module_msgs::GetJointPose)
  (if (not (find-package "MANIPULATOR_H_BASE_MODULE_MSGS"))
    (make-package "MANIPULATOR_H_BASE_MODULE_MSGS"))
  (shadow 'GetJointPose (find-package "MANIPULATOR_H_BASE_MODULE_MSGS")))
(unless (find-package "MANIPULATOR_H_BASE_MODULE_MSGS::GETJOINTPOSE")
  (make-package "MANIPULATOR_H_BASE_MODULE_MSGS::GETJOINTPOSE"))
(unless (find-package "MANIPULATOR_H_BASE_MODULE_MSGS::GETJOINTPOSEREQUEST")
  (make-package "MANIPULATOR_H_BASE_MODULE_MSGS::GETJOINTPOSEREQUEST"))
(unless (find-package "MANIPULATOR_H_BASE_MODULE_MSGS::GETJOINTPOSERESPONSE")
  (make-package "MANIPULATOR_H_BASE_MODULE_MSGS::GETJOINTPOSERESPONSE"))

(in-package "ROS")





(defclass manipulator_h_base_module_msgs::GetJointPoseRequest
  :super ros::object
  :slots (_joint_name ))

(defmethod manipulator_h_base_module_msgs::GetJointPoseRequest
  (:init
   (&key
    ((:joint_name __joint_name) (let (r) (dotimes (i 0) (push "" r)) r))
    )
   (send-super :init)
   (setq _joint_name __joint_name)
   self)
  (:joint_name
   (&optional __joint_name)
   (if __joint_name (setq _joint_name __joint_name)) _joint_name)
  (:serialization-length
   ()
   (+
    ;; string[] _joint_name
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _joint_name)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string[] _joint_name
     (write-long (length _joint_name) s)
     (dolist (elem _joint_name)
       (write-long (length elem) s) (princ elem s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string[] _joint_name
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _joint_name (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _joint_name i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;;
   self)
  )

(defclass manipulator_h_base_module_msgs::GetJointPoseResponse
  :super ros::object
  :slots (_joint_name _joint_value ))

(defmethod manipulator_h_base_module_msgs::GetJointPoseResponse
  (:init
   (&key
    ((:joint_name __joint_name) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:joint_value __joint_value) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _joint_name __joint_name)
   (setq _joint_value __joint_value)
   self)
  (:joint_name
   (&optional __joint_name)
   (if __joint_name (setq _joint_name __joint_name)) _joint_name)
  (:joint_value
   (&optional __joint_value)
   (if __joint_value (setq _joint_value __joint_value)) _joint_value)
  (:serialization-length
   ()
   (+
    ;; string[] _joint_name
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _joint_name)) 4
    ;; float64[] _joint_value
    (* 8    (length _joint_value)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string[] _joint_name
     (write-long (length _joint_name) s)
     (dolist (elem _joint_name)
       (write-long (length elem) s) (princ elem s)
       )
     ;; float64[] _joint_value
     (write-long (length _joint_value) s)
     (dotimes (i (length _joint_value))
       (sys::poke (elt _joint_value i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string[] _joint_name
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _joint_name (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _joint_name i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; float64[] _joint_value
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _joint_value (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _joint_value i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(defclass manipulator_h_base_module_msgs::GetJointPose
  :super ros::object
  :slots ())

(setf (get manipulator_h_base_module_msgs::GetJointPose :md5sum-) "a41e2236bf819259792cbf06540699bd")
(setf (get manipulator_h_base_module_msgs::GetJointPose :datatype-) "manipulator_h_base_module_msgs/GetJointPose")
(setf (get manipulator_h_base_module_msgs::GetJointPose :request) manipulator_h_base_module_msgs::GetJointPoseRequest)
(setf (get manipulator_h_base_module_msgs::GetJointPose :response) manipulator_h_base_module_msgs::GetJointPoseResponse)

(defmethod manipulator_h_base_module_msgs::GetJointPoseRequest
  (:response () (instance manipulator_h_base_module_msgs::GetJointPoseResponse :init)))

(setf (get manipulator_h_base_module_msgs::GetJointPoseRequest :md5sum-) "a41e2236bf819259792cbf06540699bd")
(setf (get manipulator_h_base_module_msgs::GetJointPoseRequest :datatype-) "manipulator_h_base_module_msgs/GetJointPoseRequest")
(setf (get manipulator_h_base_module_msgs::GetJointPoseRequest :definition-)
      "string[]    joint_name
---
string[]    joint_name
float64[]   joint_value

")

(setf (get manipulator_h_base_module_msgs::GetJointPoseResponse :md5sum-) "a41e2236bf819259792cbf06540699bd")
(setf (get manipulator_h_base_module_msgs::GetJointPoseResponse :datatype-) "manipulator_h_base_module_msgs/GetJointPoseResponse")
(setf (get manipulator_h_base_module_msgs::GetJointPoseResponse :definition-)
      "string[]    joint_name
---
string[]    joint_name
float64[]   joint_value

")



(provide :manipulator_h_base_module_msgs/GetJointPose "a41e2236bf819259792cbf06540699bd")


