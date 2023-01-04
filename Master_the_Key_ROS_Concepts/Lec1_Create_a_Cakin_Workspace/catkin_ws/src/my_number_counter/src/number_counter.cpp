#include <ros/ros.h>
#include <std_msgs/Int64.h>

int counter = 0;
ros::Publisher pub;

void callback_receive_number_data(const std_msgs::Int64& msg)
{
	ROS_INFO("Message Received : %li", msg.data);
	counter += msg.data;
	std_msgs::Int64 new_msg;
	new_msg.data = counter;
	pub.publish(new_msg);
}

int main(int argc, char **argv)
{
	ros::init(argc, argv, "number_counter");

	ros::NodeHandle nh;

	ros::Subscriber sub = nh.subscribe("/number", 1000, callback_receive_number_data);

	pub = nh.advertise<std_msgs::Int64>("/number_count", 10);

	ros::spin(); //Keep node running till we shutdown
}
