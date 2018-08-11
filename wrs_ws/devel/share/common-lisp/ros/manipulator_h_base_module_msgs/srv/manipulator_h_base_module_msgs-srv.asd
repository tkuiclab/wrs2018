
(cl:in-package :asdf)

(defsystem "manipulator_h_base_module_msgs-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "GetJointPose" :depends-on ("_package_GetJointPose"))
    (:file "_package_GetJointPose" :depends-on ("_package"))
    (:file "GetKinematicsPose" :depends-on ("_package_GetKinematicsPose"))
    (:file "_package_GetKinematicsPose" :depends-on ("_package"))
  ))