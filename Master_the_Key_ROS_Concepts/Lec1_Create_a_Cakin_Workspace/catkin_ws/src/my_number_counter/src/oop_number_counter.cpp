#include <ros/ros.h>
#include <std_msgs/Int64.h>
#include <std_srvs/SetBool.h>

// int counter = 0;
// ros::Publisher pub;
class NumberCounter{
    private:
    int counter;
    ros::Publisher pub;
    ros::Subscriber sub;
    ros::ServiceServer server;

    public:
    NumberCounter(ros::NodeHandle *nh){
        counter = 0;
        pub = nh->advertise<std_msgs::Int64>("/number_count", 10);
	    sub = nh->subscribe("/number", 1000, &NumberCounter::callback_receive_number_data, this);

        // Create Server
        server = nh->advertiseService("/reset_number_count", &NumberCounter::reset_number_count, this);

    }

    void callback_receive_number_data(const std_msgs::Int64& msg)
    {
        ROS_INFO("Message Received : %li", msg.data);
        counter += msg.data;
        std_msgs::Int64 new_msg;
        new_msg.data = counter;
        pub.publish(new_msg);

    }

    bool reset_number_count(std_srvs::SetBool::Request &req, std_srvs::SetBool::Response &res){
        if (req.data){
            ROS_INFO("Reset Succeed");
            counter = 0;
            res.success = true;
            res.message = "Counter Reset Success";
        }
        else{
            res.success = false;
            res.message = "Counter Reset False";
        }
        return true;
    }
};



int main(int argc, char **argv)
{
	ros::init(argc, argv, "number_counter");

	ros::NodeHandle nh;
    
    NumberCounter nc = NumberCounter(&nh);
    
	ros::spin(); //Keep node running till we shutdown
}
