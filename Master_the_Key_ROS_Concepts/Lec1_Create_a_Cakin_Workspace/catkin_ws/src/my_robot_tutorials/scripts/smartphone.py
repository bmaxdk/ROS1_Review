#!/usr/bin/env python3

import rospy
from std_msgs.msg import String

def callback_receive_radio_data(msg):
    rospy.loginfo("Message Received: ")
    rospy.loginfo(msg)


if __name__ == '__main__':
    rospy.init_node('smartphone')


    # Sbuscriber topic .. use same name of topic
    sub = rospy.Subscriber("/robot_news_radio",String, callback_receive_radio_data)
    
    #something that keep this scrip to have callback
    rospy.spin()
