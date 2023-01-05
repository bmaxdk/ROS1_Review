#include <ros/ros.h>
#include <rospy_tutorials/AddTwoInts.h>


int main(int argc, char **argv)
{
	ros::init(argc, argv, "add_two_ints_client");
	ros::NodeHandle nh;

	// Create service client
	ros::ServiceClient client = nh.serviceClient<rospy_tutorials::AddTwoInts>("/add_two_ints");

	// Directly create message
	rospy_tutorials::AddTwoInts srv;
	srv.request.a = 12;
	srv.request.b = 5;

	// call function client.call(service)
	if (client.call(srv)){
		//process data if True
		ROS_INFO("Returned sum is %d", (int)srv.response.sum);
	}
	else {
		ROS_WARN("SERVICE CALL FAILED");	
	}
}
