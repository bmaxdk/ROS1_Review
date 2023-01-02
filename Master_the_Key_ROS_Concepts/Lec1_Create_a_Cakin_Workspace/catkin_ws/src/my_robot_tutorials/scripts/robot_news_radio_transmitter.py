#!/usr/bin/env python3

import rospy
from std_msgs.msg import String #simply import string type for topic

if __name__ == '__main__':
    #first initialize node
    rospy.init_node('robot_news_radio_transmitter')

    #we want to publish topic
    pub = rospy.Publisher("/robot_news_radio", String, queue_size=10) #inside () we want to name the topic
    # rospy.Publisher(name of topic, message type, size)
    # now publisher is ready


    rate = rospy.Rate(2) #publish every 2Hz

    # publish the data now!
    while not rospy.is_shutdown():
        msg = String()
        msg.data = "Hi, this is Howard from the Robot News Radio!"#msg.data because .data is where String in std_msgs.msg library
        
        #save publisher
        pub.publish(msg)

        rate.sleep()

    rospy.loginfo("Node was topped")
