; Auto-generated. Do not edit!


(cl:in-package battery_msgs-srv)


;//! \htmlinclude Battery_Srv-request.msg.html

(cl:defclass <Battery_Srv-request> (roslisp-msg-protocol:ros-message)
  ((led_number
    :reader led_number
    :initarg :led_number
    :type cl:integer
    :initform 0)
   (state
    :reader state
    :initarg :state
    :type cl:integer
    :initform 0))
)

(cl:defclass Battery_Srv-request (<Battery_Srv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Battery_Srv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Battery_Srv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name battery_msgs-srv:<Battery_Srv-request> is deprecated: use battery_msgs-srv:Battery_Srv-request instead.")))

(cl:ensure-generic-function 'led_number-val :lambda-list '(m))
(cl:defmethod led_number-val ((m <Battery_Srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader battery_msgs-srv:led_number-val is deprecated.  Use battery_msgs-srv:led_number instead.")
  (led_number m))

(cl:ensure-generic-function 'state-val :lambda-list '(m))
(cl:defmethod state-val ((m <Battery_Srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader battery_msgs-srv:state-val is deprecated.  Use battery_msgs-srv:state instead.")
  (state m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Battery_Srv-request>) ostream)
  "Serializes a message object of type '<Battery_Srv-request>"
  (cl:let* ((signed (cl:slot-value msg 'led_number)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'state)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Battery_Srv-request>) istream)
  "Deserializes a message object of type '<Battery_Srv-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'led_number) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'state) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Battery_Srv-request>)))
  "Returns string type for a service object of type '<Battery_Srv-request>"
  "battery_msgs/Battery_SrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Battery_Srv-request)))
  "Returns string type for a service object of type 'Battery_Srv-request"
  "battery_msgs/Battery_SrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Battery_Srv-request>)))
  "Returns md5sum for a message object of type '<Battery_Srv-request>"
  "a5cba455e6c34810630dc8f80babd86a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Battery_Srv-request)))
  "Returns md5sum for a message object of type 'Battery_Srv-request"
  "a5cba455e6c34810630dc8f80babd86a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Battery_Srv-request>)))
  "Returns full string definition for message of type '<Battery_Srv-request>"
  (cl:format cl:nil "int64 led_number~%int64 state~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Battery_Srv-request)))
  "Returns full string definition for message of type 'Battery_Srv-request"
  (cl:format cl:nil "int64 led_number~%int64 state~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Battery_Srv-request>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Battery_Srv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Battery_Srv-request
    (cl:cons ':led_number (led_number msg))
    (cl:cons ':state (state msg))
))
;//! \htmlinclude Battery_Srv-response.msg.html

(cl:defclass <Battery_Srv-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Battery_Srv-response (<Battery_Srv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Battery_Srv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Battery_Srv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name battery_msgs-srv:<Battery_Srv-response> is deprecated: use battery_msgs-srv:Battery_Srv-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <Battery_Srv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader battery_msgs-srv:success-val is deprecated.  Use battery_msgs-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Battery_Srv-response>) ostream)
  "Serializes a message object of type '<Battery_Srv-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Battery_Srv-response>) istream)
  "Deserializes a message object of type '<Battery_Srv-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Battery_Srv-response>)))
  "Returns string type for a service object of type '<Battery_Srv-response>"
  "battery_msgs/Battery_SrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Battery_Srv-response)))
  "Returns string type for a service object of type 'Battery_Srv-response"
  "battery_msgs/Battery_SrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Battery_Srv-response>)))
  "Returns md5sum for a message object of type '<Battery_Srv-response>"
  "a5cba455e6c34810630dc8f80babd86a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Battery_Srv-response)))
  "Returns md5sum for a message object of type 'Battery_Srv-response"
  "a5cba455e6c34810630dc8f80babd86a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Battery_Srv-response>)))
  "Returns full string definition for message of type '<Battery_Srv-response>"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Battery_Srv-response)))
  "Returns full string definition for message of type 'Battery_Srv-response"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Battery_Srv-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Battery_Srv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Battery_Srv-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Battery_Srv)))
  'Battery_Srv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Battery_Srv)))
  'Battery_Srv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Battery_Srv)))
  "Returns string type for a service object of type '<Battery_Srv>"
  "battery_msgs/Battery_Srv")