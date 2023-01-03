#!/usr/bin/env python3

import rospy
from std_msgs.msg import Int64

if __name__ == '__main__':
    rospy.init_node('number_publisher', anonymous=True)

    pub = rospy.Publisher("/number", Int64, queue_size=10)

    rate = rospy.Rate(2)
    
    msg = Int64()
    msg.data = -1
    while not rospy.is_shutdown():
        pub.publish(msg)
        msg.data += 1
        rate.sleep()
        
    rospy.loginfo("Node was stopped")
