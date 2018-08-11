;; Auto-generated. Do not edit!


(when (boundp 'linear_motion::LM_Cmd)
  (if (not (find-package "LINEAR_MOTION"))
    (make-package "LINEAR_MOTION"))
  (shadow 'LM_Cmd (find-package "LINEAR_MOTION")))
(unless (find-package "LINEAR_MOTION::LM_CMD")
  (make-package "LINEAR_MOTION::LM_CMD"))

(in-package "ROS")
;;//! \htmlinclude LM_Cmd.msg.html


(defclass linear_motion::LM_Cmd
  :super ros::object
  :slots (_id _x _z _left _x_curr_pos _z_curr_pos _left_curr_pos _is_busy _status ))

(defmethod linear_motion::LM_Cmd
  (:init
   (&key
    ((:id __id) 0)
    ((:x __x) 0)
    ((:z __z) 0)
    ((:left __left) 0)
    ((:x_curr_pos __x_curr_pos) 0)
    ((:z_curr_pos __z_curr_pos) 0)
    ((:left_curr_pos __left_curr_pos) 0)
    ((:is_busy __is_busy) nil)
    ((:status __status) "")
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _x (round __x))
   (setq _z (round __z))
   (setq _left (round __left))
   (setq _x_curr_pos (round __x_curr_pos))
   (setq _z_curr_pos (round __z_curr_pos))
   (setq _left_curr_pos (round __left_curr_pos))
   (setq _is_busy __is_busy)
   (setq _status (string __status))
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:z
   (&optional __z)
   (if __z (setq _z __z)) _z)
  (:left
   (&optional __left)
   (if __left (setq _left __left)) _left)
  (:x_curr_pos
   (&optional __x_curr_pos)
   (if __x_curr_pos (setq _x_curr_pos __x_curr_pos)) _x_curr_pos)
  (:z_curr_pos
   (&optional __z_curr_pos)
   (if __z_curr_pos (setq _z_curr_pos __z_curr_pos)) _z_curr_pos)
  (:left_curr_pos
   (&optional __left_curr_pos)
   (if __left_curr_pos (setq _left_curr_pos __left_curr_pos)) _left_curr_pos)
  (:is_busy
   (&optional __is_busy)
   (if __is_busy (setq _is_busy __is_busy)) _is_busy)
  (:status
   (&optional __status)
   (if __status (setq _status __status)) _status)
  (:serialization-length
   ()
   (+
    ;; int32 _id
    4
    ;; int32 _x
    4
    ;; int32 _z
    4
    ;; int32 _left
    4
    ;; int32 _x_curr_pos
    4
    ;; int32 _z_curr_pos
    4
    ;; int32 _left_curr_pos
    4
    ;; bool _is_busy
    1
    ;; string _status
    4 (length _status)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _id
       (write-long _id s)
     ;; int32 _x
       (write-long _x s)
     ;; int32 _z
       (write-long _z s)
     ;; int32 _left
       (write-long _left s)
     ;; int32 _x_curr_pos
       (write-long _x_curr_pos s)
     ;; int32 _z_curr_pos
       (write-long _z_curr_pos s)
     ;; int32 _left_curr_pos
       (write-long _left_curr_pos s)
     ;; bool _is_busy
       (if _is_busy (write-byte -1 s) (write-byte 0 s))
     ;; string _status
       (write-long (length _status) s) (princ _status s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _id
     (setq _id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _x
     (setq _x (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _z
     (setq _z (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _left
     (setq _left (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _x_curr_pos
     (setq _x_curr_pos (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _z_curr_pos
     (setq _z_curr_pos (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _left_curr_pos
     (setq _left_curr_pos (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; bool _is_busy
     (setq _is_busy (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _status
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _status (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get linear_motion::LM_Cmd :md5sum-) "8a5050a3fcf89f1ce1c712656c2d84a1")
(setf (get linear_motion::LM_Cmd :datatype-) "linear_motion/LM_Cmd")
(setf (get linear_motion::LM_Cmd :definition-)
      "int32 id

int32 x
int32 z
int32 left

int32 x_curr_pos
int32 z_curr_pos
int32 left_curr_pos

bool is_busy
string status 
")



(provide :linear_motion/LM_Cmd "8a5050a3fcf89f1ce1c712656c2d84a1")


