#!/usr/bin/env python3

import rospy
from rospy_tutorials.srv import AddTwoInts


if __name__ == '__main__':
    rospy.init_node("add_two_ints_client")

    # Need to create service client
    rospy.wait_for_service("/add_two_ints") # /name of the service   where it advertise

    # Create the client to call the service
    # If the client fail the client server, it will need exception
    try:
        # Call the service
        # Create client
        add_two_ints = rospy.ServiceProxy("/add_two_ints", AddTwoInts)
        response = add_two_ints(2,6) #call the client (2,6) is where a and b
        rospy.loginfo("Sum is : " +str(response.sum))
    except rospy.ServiceExcetion as e:
        rospy.lowarn("Service Failed: "+ str(e))

