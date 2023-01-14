;; Auto-generated. Do not edit!


(when (boundp 'battery_msgs::Battery_Srv)
  (if (not (find-package "BATTERY_MSGS"))
    (make-package "BATTERY_MSGS"))
  (shadow 'Battery_Srv (find-package "BATTERY_MSGS")))
(unless (find-package "BATTERY_MSGS::BATTERY_SRV")
  (make-package "BATTERY_MSGS::BATTERY_SRV"))
(unless (find-package "BATTERY_MSGS::BATTERY_SRVREQUEST")
  (make-package "BATTERY_MSGS::BATTERY_SRVREQUEST"))
(unless (find-package "BATTERY_MSGS::BATTERY_SRVRESPONSE")
  (make-package "BATTERY_MSGS::BATTERY_SRVRESPONSE"))

(in-package "ROS")





(defclass battery_msgs::Battery_SrvRequest
  :super ros::object
  :slots (_led_number _state ))

(defmethod battery_msgs::Battery_SrvRequest
  (:init
   (&key
    ((:led_number __led_number) 0)
    ((:state __state) 0)
    )
   (send-super :init)
   (setq _led_number (round __led_number))
   (setq _state (round __state))
   self)
  (:led_number
   (&optional __led_number)
   (if __led_number (setq _led_number __led_number)) _led_number)
  (:state
   (&optional __state)
   (if __state (setq _state __state)) _state)
  (:serialization-length
   ()
   (+
    ;; int64 _led_number
    8
    ;; int64 _state
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _led_number
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _led_number (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _led_number) (= (length (_led_number . bv)) 2)) ;; bignum
              (write-long (ash (elt (_led_number . bv) 0) 0) s)
              (write-long (ash (elt (_led_number . bv) 1) -1) s))
             ((and (class _led_number) (= (length (_led_number . bv)) 1)) ;; big1
              (write-long (elt (_led_number . bv) 0) s)
              (write-long (if (>= _led_number 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _led_number s)(write-long (if (>= _led_number 0) 0 #xffffffff) s)))
     ;; int64 _state
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _state (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _state) (= (length (_state . bv)) 2)) ;; bignum
              (write-long (ash (elt (_state . bv) 0) 0) s)
              (write-long (ash (elt (_state . bv) 1) -1) s))
             ((and (class _state) (= (length (_state . bv)) 1)) ;; big1
              (write-long (elt (_state . bv) 0) s)
              (write-long (if (>= _state 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _state s)(write-long (if (>= _state 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _led_number
#+(or :alpha :irix6 :x86_64)
      (setf _led_number (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _led_number (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _state
#+(or :alpha :irix6 :x86_64)
      (setf _state (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _state (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(defclass battery_msgs::Battery_SrvResponse
  :super ros::object
  :slots (_success ))

(defmethod battery_msgs::Battery_SrvResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass battery_msgs::Battery_Srv
  :super ros::object
  :slots ())

(setf (get battery_msgs::Battery_Srv :md5sum-) "a5cba455e6c34810630dc8f80babd86a")
(setf (get battery_msgs::Battery_Srv :datatype-) "battery_msgs/Battery_Srv")
(setf (get battery_msgs::Battery_Srv :request) battery_msgs::Battery_SrvRequest)
(setf (get battery_msgs::Battery_Srv :response) battery_msgs::Battery_SrvResponse)

(defmethod battery_msgs::Battery_SrvRequest
  (:response () (instance battery_msgs::Battery_SrvResponse :init)))

(setf (get battery_msgs::Battery_SrvRequest :md5sum-) "a5cba455e6c34810630dc8f80babd86a")
(setf (get battery_msgs::Battery_SrvRequest :datatype-) "battery_msgs/Battery_SrvRequest")
(setf (get battery_msgs::Battery_SrvRequest :definition-)
      "int64 led_number
int64 state
---
bool success

")

(setf (get battery_msgs::Battery_SrvResponse :md5sum-) "a5cba455e6c34810630dc8f80babd86a")
(setf (get battery_msgs::Battery_SrvResponse :datatype-) "battery_msgs/Battery_SrvResponse")
(setf (get battery_msgs::Battery_SrvResponse :definition-)
      "int64 led_number
int64 state
---
bool success

")



(provide :battery_msgs/Battery_Srv "a5cba455e6c34810630dc8f80babd86a")


