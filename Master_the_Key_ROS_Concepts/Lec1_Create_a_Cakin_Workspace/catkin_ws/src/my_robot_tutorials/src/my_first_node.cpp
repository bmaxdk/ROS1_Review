#include <ros/ros.h> // using ros library

int main(int argc, char **argv)
{
	ros::init(argc, argv, "my_first_cpp_node"); //you can have same name node running at a time
	ros::NodeHandle nh;

	//use log function
	ROS_INFO("Node has been started");

	//sleep function for this which will use duration
	//ros::Duration(1.0).sleep();

	//ROS_INFO("Exit");
	//
	ros::Rate rate(10);
	while (ros::ok()){
		ROS_INFO("Hello");
		rate.sleep();
	}
}

//make sure to update CMakefile add this
//add_executable(node_cpp src/my_first_node.cpp)
//target_link_libraries(node_cpp ${catkin_LIBRARIES})

