#include <ros/ros.h>
#include <std_msgs/Int64.h>

int main(int argc, char **argv)
{
	ros::init(argc, argv, "number_publisher", ros::init_options::AnonymousName);

	ros::NodeHandle nh;

	ROS_INFO("Node has been started: ");

	ros::Publisher pub = nh.advertise<std_msgs::Int64>("/number",10);

	ros::Rate rate(3);
	
	std_msgs::Int64 msg;
	msg.data = -1;
	while(ros::ok()){
		pub.publish(msg);
		msg.data+=1;
		rate.sleep();
	}

}
