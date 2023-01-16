#!/usr/bin/env python3

import rospy
from std_msgs.msg import Int64
from std_srvs.srv import SetBool

class NumberCounter:
    def __init__(self):
        # counter=0
        # pub=None
        self.counter = 0

        #subscriber
        self.number_subscribe = rospy.Subscriber("/number", Int64, self.callback_receive_number_data)
        
        #publisher
        self.pub = rospy.Publisher("/number_count", Int64, queue_size=10)

        #create Service server
        self.reset_service = rospy.Service("/reset_number_count", SetBool, self.reset_count)
        
    def callback_receive_number_data(self, msg):
        # global counter
        rospy.loginfo("Message Received")
        rospy.loginfo(msg)#msg.data also fine
        # counter += msg.data
        self.counter += msg.data
        new_msg = Int64()
        # new_msg.data = counter
        new_msg.data = self.counter
        # pub.publish(new_msg)
        self.pub.publish(new_msg)

    def reset_count(self, req):
        if req.data:
            # global counter
            self.counter = 0
            rospy.loginfo("Counter Reset!")
            # counter = 0
            return True, "Counter Reset Success"

        else:
            return False, "Counter Reset False"

if __name__ == '__main__':
    rospy.init_node('number_counter')
    NumberCounter()
    # #subscriber
    # sub = rospy.Subscriber("/number", Int64, callback_receive_number_data)
    
    # #publisher
    # pub = rospy.Publisher("/number_count", Int64, queue_size=10)

    # #create Service server
    # service = rospy.Service("/reset_number_count", SetBool, reset_count)

    rospy.spin()
