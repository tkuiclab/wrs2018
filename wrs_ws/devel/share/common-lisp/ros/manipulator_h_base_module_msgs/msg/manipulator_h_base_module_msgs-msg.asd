
(cl:in-package :asdf)

(defsystem "manipulator_h_base_module_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "JointPose" :depends-on ("_package_JointPose"))
    (:file "_package_JointPose" :depends-on ("_package"))
    (:file "KinematicsPose" :depends-on ("_package_KinematicsPose"))
    (:file "_package_KinematicsPose" :depends-on ("_package"))
    (:file "P2PPose" :depends-on ("_package_P2PPose"))
    (:file "_package_P2PPose" :depends-on ("_package"))
  ))