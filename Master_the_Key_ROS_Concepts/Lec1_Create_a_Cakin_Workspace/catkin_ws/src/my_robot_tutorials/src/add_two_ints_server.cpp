#include <ros/ros.h>
#include <rospy_tutorials/AddTwoInts.h>


// use bool tell wheter service call is successful
bool handle_add_two_ints(rospy_tutorials::AddTwoInts::Request &req, rospy_tutorials::AddTwoInts::Response &res)
{
	//req from a and b from request
	int result = req.a + req.b;
	ROS_INFO("%d + %d = %d", (int)req.a, (int)req.b, (int)result);

	//res from response
	res.sum = result;
	return true;
}

int main(int argc, char **argv)
{
	ros::init(argc, argv, "add_two_ints_server");
	ros::NodeHandle nh;

	// Create server
	ros::ServiceServer server = nh.advertiseService("/add_two_ints", handle_add_two_ints); //add callback

	ros::spin();
}
