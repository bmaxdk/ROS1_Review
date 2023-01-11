# ROS1_Review
Practical Key ROS Concepts of Create Powerful and Scalable Robot Application

## Initialize
### Create catkin_ws
```
mkdir catkin_ws
cd catkin_ws
mkdir src
catkin_make
```

## Source your own ROS workspace
To do that, add this line
```
source devel/setup.bash
or
source ~/catkin_ws/devel/setup.bash
```
To add it directly without to open a text editior, simply type 

`echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc`

## Create a ROS Package
```
cd catkin_ws/src
catkin_create_pkg name_of_package roscpp rospy std_msgs
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
```
add_executable(nameofnode src/nameofcppfile.cpp)
target_link_libraries(nameofnode ${catkin_LIBRARIES})
```
`catkin_make`

# Handle Parameters
## Create Custom MSG
```
cd catkin_ws/src
catkin_create_pkg name_of_msgs_pkg roscpp rospy std_msgs
cd name_of_msgs_pkg
rm -rf include/
rm -rf src/
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
```
mkdir msg
cd msg
touch NameOfMsg.msg
```

In NameOfMsg.msg, add msg definition
ex
```
int64 temperature
bool are_motors_up
string debug_message
```

In CMakeList.txt uncomment add_message_files
ex:
```
add_message_files(
  Files
  NameOfMsg.msg
)
```

Now build in catkin_ws
`catkin_make`

Check where msg at:
```
cd devel/include/name_of_msg_pkg
```

## To use msg
Go to package and add Package.xml

Add depend type
```
<depend>name_of_msgs_pkg</depend>
```

In CMakeList.txt, add in `find_package`
```
name_of_msgs_pkg
```

## Create Custom Srv
