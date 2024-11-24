#!/bin/bash

# Instalacija ROS2 Humble
sudo apt install curl gnupg lsb-release
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(source /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
sudo apt update
sudo apt install ros-humble-desktop python3-colcon-common-extensions python3-pip ros-humble-gazebo-* ros-humble-cartographer ros-humble-cartographer-ros ros-humble-cartographer-rviz ros-humble-navigation2 ros-humble-nav2-* ros-humble-dynamixel-sdk ros-humble-turtlebot3-msgs ros-humble-turtlebot3 ros-humble-turtlebot3-gazebo ros-humble-tf-transformations ros-humble-cv-bridge -y
sudo pip3 install transforms3d

# Postavljanje radnog prostora
mkdir -p ~/ros2_ws/src  # Ovdje ćete kreirati vlastite ROS pakete
echo "source /opt/ros/humble/setup.sh" >> ~/.bashrc
echo "source /usr/share/gazebo/setup.sh" >> ~/.bashrc
echo "source ~/ros2_ws/install/local_setup.sh" >> ~/.bashrc
echo "export ROS_DOMAIN_ID=30" >> ~/.bashrc
echo "export TURTLEBOT3_MODEL=burger" >> ~/.bashrc
echo "export GAZEBO_MODEL_PATH=/opt/ros/humble/share/turtlebot3_gazebo/models/" >> ~/.bashrc
