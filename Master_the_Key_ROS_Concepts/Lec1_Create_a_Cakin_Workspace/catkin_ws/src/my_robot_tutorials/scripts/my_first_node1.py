#!/usr/bin/env python3

import rospy

if __name__ == '__main__':
    # Initialize node: name of the file and name of the node maybe different
    rospy.init_node('my_first_python_node')

    # Log functionalty for ros: Save somthing information of the log
    rospy.loginfo("This node has been started")

    # let's sleep for 1 second
    rospy.sleep(1)

    # Say something else
    rospy.loginfo("Exit Now")
