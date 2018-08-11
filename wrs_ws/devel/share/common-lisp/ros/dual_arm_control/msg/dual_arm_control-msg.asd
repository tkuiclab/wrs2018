
(cl:in-package :asdf)

(defsystem "dual_arm_control-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "robot_msg" :depends-on ("_package_robot_msg"))
    (:file "_package_robot_msg" :depends-on ("_package"))
  ))