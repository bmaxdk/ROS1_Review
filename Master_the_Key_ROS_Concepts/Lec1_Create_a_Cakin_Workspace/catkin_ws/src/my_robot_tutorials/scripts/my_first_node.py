#!/usr/bin/env python3

import rospy

if __name__ == '__main__':
    #initialize node
    rospy.init_node('my_first_python_node')

    #log info
    rospy.loginfo("This node has been started")


    #we have rate of 10 hz
    rate = rospy.Rate(10)

    #It will excute bottom loop with .10s
    while not rospy.is_shutdown():
        rospy.loginfo("Hello")
        rate.sleep()
