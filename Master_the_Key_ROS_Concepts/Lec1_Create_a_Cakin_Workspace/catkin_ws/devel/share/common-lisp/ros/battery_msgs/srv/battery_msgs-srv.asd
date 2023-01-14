
(cl:in-package :asdf)

(defsystem "battery_msgs-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Battery_Srv" :depends-on ("_package_Battery_Srv"))
    (:file "_package_Battery_Srv" :depends-on ("_package"))
  ))