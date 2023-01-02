#include <ros/ros.h>
#include <std_msgs/String.h> //include header of the msg file

int main(int argc, char **argv)
{
	//Create node
	ros::init(argc, argv, "robot_news_radio_transmitter");
	ros::NodeHandle nh;
	
	ROS_INFO("Node has been started");
	
	// Begin publisher object
	ros::Publisher pub = nh.advertise<std_msgs::String>("/robot_news_radio", 10); //Publisher object = nodehandle.advertise<type of message>(name of the topic, queue size)

	ros::Rate rate(3);

	while (ros::ok()){
		std_msgs::String msg;//create new msg
		msg.data = "Hi, This is Howard from the Robot News Radio";
		pub.publish(msg);
		rate.sleep();
	}
}
