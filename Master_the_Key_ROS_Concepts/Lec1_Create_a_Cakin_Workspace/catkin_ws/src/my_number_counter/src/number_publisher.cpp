#include <ros/ros.h>
#include <std_msgs/Int64.h>

int main(int argc, char **argv)
{
	ros::init(argc, argv, "number_publisher", ros::init_options::AnonymousName);

	ros::NodeHandle nh;

	ROS_INFO("Node has been started: ");

	ros::Publisher pub = nh.advertise<std_msgs::Int64>("/number",10);
	
	//[rosparam] 
	double publish_frequency;
	nh.getParam("/number_publish_frequency", publish_frequency);
	ros::Rate rate(publish_frequency);
	//ros::Rate rate(3);
	
	//[rosparam]
	int number;
	nh.getParam("/number_to_publish", number);
	
	nh.setParam("/just_another_param", "Bye");

	std_msgs::Int64 msg;
	msg.data = -1;
	while(ros::ok()){
		pub.publish(msg);
		msg.data= number;
		//msg.data+=1;
		rate.sleep();
	}

}
