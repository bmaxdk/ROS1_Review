#include <ros/ros.h>
#include <std_msgs/String.h>

void callback_receive_radio_data(const std_msgs::String& msg)
{
	ROS_INFO("Message Received : %s", msg.data.c_str()); //c_str() is convert data to string
}

int main(int argc, char **argv)
{
	ros::init(argc, argv, "smartphone");
	ros::NodeHandle nh;

	// Create subscriber
	ros::Subscriber sub = nh.subscribe("/robot_news_radio", 1000, callback_receive_radio_data);

	ros::spin(); //keep node runing till we shutdown
}
