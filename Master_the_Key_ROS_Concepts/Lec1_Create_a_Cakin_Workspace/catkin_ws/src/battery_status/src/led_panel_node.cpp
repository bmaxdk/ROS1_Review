#include <ros/ros.h>
#include <battery_msgs/Battery_Srv.h>

#define LED_ARRAY_SIZE 3

int led_states[LED_ARRAY_SIZE] = {0};

bool callback(battery_msgs::Battery_Srv::Request &req, battery_msgs::Battery_Srv::Response &res)
{
	int led_number = req.led_number;
	int state = req.state;

	if((led_number>LED_ARRAY_SIZE)||(led_number <=0)){
		res.success =false;
		return true;
	}
	if(!(state ==0 || state ==1)){
		res.success = false;
		return true;
	}

	led_states[led_number-1] =state;
	ROS_INFO("[%d, %d, %d]", led_states[0], led_states[1], led_states[2]);
	res.success =true;
	return true;

}

int main(int argc, char **argv)
{
	ros::init(argc, argv, "led_panel_node");
	ros::NodeHandle nh;

	// Create server
	ros::ServiceServer server = nh.advertiseService("/set_led", callback);
	ROS_INFO("[%d, %d, %d]", led_states[0], led_states[1], led_states[2]);
	ros::spin();

}
