# Install script for directory: /home/eight/Downloads/Udemy/Master_the_Key_ROS_Concepts/Lec1_Create_a_Cakin_Workspace/catkin_ws/src/my_number_counter

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/eight/Downloads/Udemy/Master_the_Key_ROS_Concepts/Lec1_Create_a_Cakin_Workspace/catkin_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/eight/Downloads/Udemy/Master_the_Key_ROS_Concepts/Lec1_Create_a_Cakin_Workspace/catkin_ws/build/my_number_counter/catkin_generated/installspace/my_number_counter.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/my_number_counter/cmake" TYPE FILE FILES
    "/home/eight/Downloads/Udemy/Master_the_Key_ROS_Concepts/Lec1_Create_a_Cakin_Workspace/catkin_ws/build/my_number_counter/catkin_generated/installspace/my_number_counterConfig.cmake"
    "/home/eight/Downloads/Udemy/Master_the_Key_ROS_Concepts/Lec1_Create_a_Cakin_Workspace/catkin_ws/build/my_number_counter/catkin_generated/installspace/my_number_counterConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/my_number_counter" TYPE FILE FILES "/home/eight/Downloads/Udemy/Master_the_Key_ROS_Concepts/Lec1_Create_a_Cakin_Workspace/catkin_ws/src/my_number_counter/package.xml")
endif()

