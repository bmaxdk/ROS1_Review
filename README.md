# ROS1_Review
Practical Key ROS Concepts of Create Powerful and Scalable Robot Application

## Initialize
### Create catkin_ws
mkdir catkin_ws
cd catkin_ws
mkdir src
catkin_make

## Source your own ROS workspace
To do that, add this line
source devel/setup.bash
or
source ~/catkin_ws/devel/setup.bash

To add it directly without to open a text editior, simply type 
`echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc`

## Create a ROS Package
cd catkin_ws/src
catkin_create_pkg name_of_package roscpp rospy std_msgs
* dependencies : roscpp, rospy std_msgs


### Key point for Python
create script in the package to add
chmod +x name_of_python_node.cpp 
this helps to make execute table.
#!/usr/bin/env python3

### Key point for C++
create cppfile in src in pcakage
Inside CMakeLists.txt:
add_executable(nameofnode src/nameofcppfile.cpp)
target_link_libraries(nameofnode ${catkin_LIBRARIES})

catkin_make

