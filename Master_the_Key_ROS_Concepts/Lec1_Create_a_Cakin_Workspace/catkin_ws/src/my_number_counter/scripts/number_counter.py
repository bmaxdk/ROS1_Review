#!/usr/bin/env python3

import rospy
from std_msgs.msg import Int64
from std_srvs.srv import SetBool

counter = 0
pub =None

def callback_receive_number_data(msg):
    global counter
    rospy.loginfo("Message Received")
    rospy.loginfo(msg)#msg.data also fine
    counter += msg.data
    new_msg = Int64()
    new_msg.data = counter
    pub.publish(new_msg)

def reset_count(req):
    if req.data:
        global counter
        rospy.loginfo("Counter Reset!")
        counter = 0
        return True, "Counter Reset Success"

    else:
        return False, "Counter Reset False"

if __name__ == '__main__':
    rospy.init_node('number_counter')
    
    #subscriber
    sub = rospy.Subscriber("/number", Int64, callback_receive_number_data)
    
    #publisher
    pub = rospy.Publisher("/number_count", Int64, queue_size=10)

    #create Service server
    service = rospy.Service("/reset_number_count", SetBool, reset_count)

    rospy.spin()
