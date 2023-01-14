#include <ros/ros.h>
#include <battery_msgs/Battery_Srv.h>
//#include <cstdlib>
//int state = 1;

#define STATE_FULL 1
#define STATE_EMPTY 2


void set_led(ros::NodeHandle *nh, int battery_state)
{
	ros::service::waitForService("/set_led");
	
	ros::ServiceClient client = nh->serviceClient<battery_msgs::Battery_Srv>("/set_led");

	battery_msgs::Battery_Srv srv;
	srv.request.led_number = 1;
	srv.request.state = 0;

	if(battery_state==STATE_EMPTY)
	{
		srv.request.state = 1;
	}

	if(client.call(srv)){
		ROS_INFO("Set led success flag: %d", srv.response.success);
	}
	else{
		ROS_WARN("Service call failed");
	}
}

int main(int argc, char **argv)
{
	ros::init(argc, argv, "battery_node");
	ros::NodeHandle nh;

	int battery_state = STATE_FULL;
	
	while (ros::ok()){
		ros::Duration(7.0).sleep();
		battery_state = STATE_EMPTY;
		ROS_INFO("Battery is empty!");
		set_led(&nh, battery_state);
		ros::Duration(3.0).sleep();
		battery_state = STATE_FULL;
		ROS_INFO("Battery is full!");
		set_led(&nh, battery_state);
	}
}
