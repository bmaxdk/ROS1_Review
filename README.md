# ROS1_Review
Practical Key ROS Concepts of Create Powerful and Scalable Robot Application

## Initialize
### Create catkin_ws
```bash
$ mkdir catkin_ws
$ cd catkin_ws
$ mkdir src
$ catkin_make
```

## Source your own ROS workspace
To do that, add this line
```bash
$ source devel/setup.bash
or
$ source ~/catkin_ws/devel/setup.bash
```

To add it directly without to open a text editior, simply type 

`echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc`

## Create a ROS Package
```bash
$ cd catkin_ws/src
$ catkin_create_pkg name_of_package roscpp rospy std_msgs
```
* dependencies : roscpp, rospy std_msgs


### Key point for Python
create script in the package to add
`chmod +x name_of_python_node.cpp `
this helps to make execute table.
`#!/usr/bin/env python3`

### Key point for C++
create cppfile in src in pcakage
Inside CMakeLists.txt:
```xml
add_executable(nameofnode src/nameofcppfile.cpp)
target_link_libraries(nameofnode ${catkin_LIBRARIES})
```
`catkin_make`

To run node to node, use `rosrun name_of_pkg node`.


# Handle Parameters
## Create Custom MSG
```bash
$ cd catkin_ws/src
$ catkin_create_pkg name_of_msgs_pkg roscpp rospy std_msgs
$ cd name_of_msgs_pkg
$ rm -rf include/
$ rm -rf src/
```
### Need to add package.xml

`<build_depend>message_generation</build_depend>`

`<exec_depend>message_runtime</exec_depend>`

### Need to add CMakeList.txt
In find_package add
`message_generation`

Uncomment:
generate_messages section

In catkin_package,

uncomment CATKIN_DPENDS roscpp rospy std_msgs
and add message_runtime

`CATKIN_DPENDS roscpp rospy std_msgs message_runtime`

## create folder in /catkin_ws/src/name_of_msgs_pkg
```bash
$ mkdir msg
$ cd msg
$ touch NameOfMsg.msg
```

In NameOfMsg.msg, add msg definition
ex
```msg
int64 temperature
bool are_motors_up
string debug_message
```

In CMakeList.txt uncomment add_message_files
ex:
```txt
add_message_files(
  Files
  NameOfMsg.msg
)
```

Now build in catkin_ws
`catkin_make`

Check where msg at:
```bash
$ cd devel/include/name_of_msg_pkg
```

## To use msg
Go to package and add Package.xml

Add depend type
```xml
<depend>name_of_msgs_pkg</depend>
```

In CMakeList.txt, add in `find_package`
```txt
name_of_msgs_pkg
```

## Create Custom Srv
Create in same name_of_msgs_pkg
```bash
$ mkdir srv
$ cd srv
$ touch Name_Of_Srv.srv
```

In srv file you can add type you want to add. Ex:
```srv
float64 name_of_request
---
float64 name_of_response
```

Add CMakeList.txt. Uncomment `add_service_files` and add into Name_Of_Service.srv

Use `catkin_make`

### To check, go to inside of the directory `devel/include/name_of_msg_pkg`

To use the msg or srv package, add  ` <depend>msg_package_name</depend>` in your package.xml at the package where you want to use.

Also, add 
```cmake
find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
  msg_package_name
)

```
in your CMakeList.txt in the package where you want to use.

## Handle Parameters
```txt
rosparam -h
# to add parameter, you can follow this example
rosparam set /name_of_parameter1 "name"
rosparam set /name_of_parameter2 30
rosparam set /name_of_parameter3 false
```

You can add parameters directly into the node

### rosparam for Python
For example in python check file number_publisher.py

`publish_frequency = rospy.get_param("/number_publish_frequency")`
*Make sure to set /number_publish_frequency to set first before run
ex:
 
`rosparam set /number_publish_frequency 3`

Run the package and the node

then add

`rostopic echo /number`

We can also set rosparam in the file
```xml
# [rosparam] We can also set param here
rospy.set_param("/another_param", "Hello")
```

### Now rosparam with C++

In `my_number_counter` pkg, add `number_publisher.cpp`.

EX:
```cpp
double publish_frequency;
nh.getParam("/number_publish_frequency", publish_frequency);
ros::Rate rate(publish_frequency);
```
Follow same step, `rosparam set /number_publish_frequency 3`.

Also, you can add more. Ex,
```cpp
//[rosparam]
int number;
nh.getParam("/number_to_publish", number);
//update msg.data to
msg.data=number;
```
`rosparam set /number_to_publish 4`

You can also `setParam` to skip typing rosparam set.
Ex, inside the same folder add
```cpp
nh.setParam("/just_another_param", "Bye");

```

You will see in `rosparam list`.
*For C++, always `catkin_make` after update code.


## ROS Launch file
Launch file allows to run several nodes and param in one time.
First in your `catkin_ws/src`, create pkg.

`catkin_create_pkg name_of_launch_file_bringup`

Here you don't have to add any dependencies.

Here inside the pkg, make launch directoy. 

ex.
```bash
$ catkin_create_pkg my_robot_bringup
$ cd my_robot_bringup
$ mkdir launch
$ cd launch
$ touch number_app.launch
```

Inside the launch file, the way to write launch file is basically xml.

Try this first to see launch file indicates parameter once it launched. 
Ex.
```cmake
<launch>

        <param name="/number_publish_frequency" type="double" value="3.0" />
        <param name="/number_to_publish" type="int" value="2" /> 

</launch>

```
Do `catkin_make` and `roscore` and source it.

You will want to lauch file following this method.

`roslaunch name_of_launch_pkg nameoflaunchfile.launch`

EX.

`roslaunch my_robot_bringup number_app.launch`

Once you see `rosparam list`, you will see parameters that you added in launch file.

Now, let's add Node inside of the launch file.
```
<launch>

        <param name="/number_publish_frequency" type="double" value="3.0" />
        <param name="/number_to_publish" type="int" value="2" /> 

        <node name="number_publisher" pkg="my_number_counter" type="number_publisher" />
        <node name="number_counter" pkg="my_number_counter" type="number_counter.py" />

</launch>
               
```
Try `roslaunch my_robot_bringup number_app.launch` without roscore. It will still works.

`roslaunch` first check wheter `roscore` if not there, it will auto-starting newmaster which helps alot.

## `rosbag`
`rosbag` enable to recall and store some message and replay them later. Allow to replay certain situation.

For example,

```
roscore

rosrun my_robot_tutorials hw_status_publisher.py

rostopic echo /my_robot/hardware_status
```

Here, you want to save/record those topic for later

First run the `rosrun my_robot_tutorials hw_status_publisher.py` node. While running,
```
rosbag record /my_robot/hardware_status

```

Once you kill the node, in the folder you will see file.bag. 
```
rosbag info file.bag
```
Now you want to play this message. First you want to check rostopic list which will only run roscore only here. However, once you type
```
rosbag play file.bag
```
You will see in topic list that saved topic appears.
This is useful to test your robot with saved one.

## OOP with ROS Python
Check node file `oop_number_counter.py`


## OOP with ROS C++
Check node file `oop_number_counter.cpp`

## Setup source
cat ~/.bashrc
cat ~/.zshrc
use vim

## Extra
### Publish a message on a topic in cmd line
`rostopic pub -r 10 /topic_name message_type ""` : publish repeat 10 times. if you want to run just one time change `-r 10` to `-1`.

### rqt_graph
`rosrun rqt_graph rqt_graph`

### Showing the contents of ROS msgs published
`rostopic echo /name_of_topic`
To show msg type
```
rostopic info /name_of_topic
rosmsg show /name_of_msg_type
```

## Useful resource
- ROS Wiki
- ROS Answers
- ROS Discourse
Congraturation! Hope you enjoyed this!
