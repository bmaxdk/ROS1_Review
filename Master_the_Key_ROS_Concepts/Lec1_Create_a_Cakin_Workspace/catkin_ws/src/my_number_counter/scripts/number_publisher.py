#!/usr/bin/env python3

import rospy
from std_msgs.msg import Int64

if __name__ == '__main__':
    rospy.init_node('number_publisher', anonymous=True)

    pub = rospy.Publisher("/number", Int64, queue_size=10)
    
    # [rosparam] ex:publish_frequency = rospy.get_param("/nameofparam")
    publish_frequency = rospy.get_param("/number_publish_frequency")
    rate = rospy.Rate(publish_frequency)

    
    #rate = rospy.Rate(2)
    
    # [rosparam] for msg.data
    number = rospy.get_param("/number_to_publish")

    # [rosparam] We can also set param here
    rospy.set_param("/another_param", "Hello")

    msg = Int64()
    msg.data = -1
    while not rospy.is_shutdown():
        pub.publish(msg)
        #msg.data += 1
        msg.data = number
        rate.sleep()
        
    rospy.loginfo("Node was stopped")
