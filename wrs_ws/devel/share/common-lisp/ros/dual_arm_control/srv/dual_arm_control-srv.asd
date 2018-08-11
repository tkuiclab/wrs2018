
(cl:in-package :asdf)

(defsystem "dual_arm_control-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "robot" :depends-on ("_package_robot"))
    (:file "_package_robot" :depends-on ("_package"))
  ))