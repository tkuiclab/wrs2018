
(cl:in-package :asdf)

(defsystem "linear_motion-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "LM_Cmd" :depends-on ("_package_LM_Cmd"))
    (:file "_package_LM_Cmd" :depends-on ("_package"))
  ))