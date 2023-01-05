#!/usr/bin/env python3

import rospy
from rospy_tutorials.srv import AddTwoInts
# message tpye will use rospy_turoials/AddTwoInts.srv

def handle_add_two_ints(req): #req is from AddTwoInts
    result = req.a + req.b
    rospy.loginfo("Sum of " + str(req.a) + " and " + str(req.b) + " is " + str(result))
    return result

if __name__ == '__main__':
    rospy.init_node("add_two_ints_server")
    rospy.loginfo("Add two ints server node created")

    # Create service server
    service = rospy.Service("/add_two_ints",AddTwoInts, handle_add_two_ints) #we need function callback which service surver requests

    rospy.loginfo("Service server has been started")

    rospy.spin()
