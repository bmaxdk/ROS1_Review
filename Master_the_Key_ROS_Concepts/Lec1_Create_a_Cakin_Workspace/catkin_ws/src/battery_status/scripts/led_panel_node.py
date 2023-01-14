#!/usr/bin/env python3

import rospy
from battery_msgs.srv import Battery_Srv

led_states = [0, 0, 0]

def callback_set_led(req):
    led_number = req.led_number
    state = req.state
    global led_state

    if (led_number > len(led_states)) or (led_number <=0):
        return False

    if not(state == 0 or state == 1):
        return False
    led_states[led_number-1] = state
    return True

if __name__ == '__main__':
    rospy.init_node('led_panel_node')

    server = rospy.Service("/set_led", Battery_Srv, callback_set_led)
    
    rate = rospy.Rate(10)

    while not rospy.is_shutdown():
        rospy.loginfo(led_states)
        rate.sleep()

