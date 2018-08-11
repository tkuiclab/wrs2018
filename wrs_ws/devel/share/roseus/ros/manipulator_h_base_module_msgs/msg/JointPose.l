;; Auto-generated. Do not edit!


(when (boundp 'manipulator_h_base_module_msgs::JointPose)
  (if (not (find-package "MANIPULATOR_H_BASE_MODULE_MSGS"))
    (make-package "MANIPULATOR_H_BASE_MODULE_MSGS"))
  (shadow 'JointPose (find-package "MANIPULATOR_H_BASE_MODULE_MSGS")))
(unless (find-package "MANIPULATOR_H_BASE_MODULE_MSGS::JOINTPOSE")
  (make-package "MANIPULATOR_H_BASE_MODULE_MSGS::JOINTPOSE"))

(in-package "ROS")
;;//! \htmlinclude JointPose.msg.html


(defclass manipulator_h_base_module_msgs::JointPose
  :super ros::object
  :slots (_name _value _slide_pos ))

(defmethod manipulator_h_base_module_msgs::JointPose
  (:init
   (&key
    ((:name __name) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:value __value) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:slide_pos __slide_pos) 0.0)
    )
   (send-super :init)
   (setq _name __name)
   (setq _value __value)
   (setq _slide_pos (float __slide_pos))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:value
   (&optional __value)
   (if __value (setq _value __value)) _value)
  (:slide_pos
   (&optional __slide_pos)
   (if __slide_pos (setq _slide_pos __slide_pos)) _slide_pos)
  (:serialization-length
   ()
   (+
    ;; string[] _name
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _name)) 4
    ;; float64[] _value
    (* 8    (length _value)) 4
    ;; float64 _slide_pos
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string[] _name
     (write-long (length _name) s)
     (dolist (elem _name)
       (write-long (length elem) s) (princ elem s)
       )
     ;; float64[] _value
     (write-long (length _value) s)
     (dotimes (i (length _value))
       (sys::poke (elt _value i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64 _slide_pos
       (sys::poke _slide_pos (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string[] _name
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _name (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _name i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; float64[] _value
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _value (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _value i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64 _slide_pos
     (setq _slide_pos (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get manipulator_h_base_module_msgs::JointPose :md5sum-) "176844734ff1e686d883687541cbc2ab")
(setf (get manipulator_h_base_module_msgs::JointPose :datatype-) "manipulator_h_base_module_msgs/JointPose")
(setf (get manipulator_h_base_module_msgs::JointPose :definition-)
      "string[]    name
float64[]   value
float64     slide_pos

")



(provide :manipulator_h_base_module_msgs/JointPose "176844734ff1e686d883687541cbc2ab")


