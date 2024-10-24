# Instalacija ROS2 Humble
sudo apt install curl gnupg lsb-release
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(source /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
sudo apt update
sudo apt install python3-argcomplete python3-colcon-common-extensions libboost-system-dev build-essential ros-humble-hls-lfcd-lds-driver ros-humble-turtlebot3-msgs ros-humble-turtlebot3 ros-humble-dynamixel-sdk libudev-dev

# Postavljanje radnog prostora
mkdir -p ~/turtlebot3_ws/src && cd ~/turtlebot3_ws/src
# git clone -b humble-devel https://github.com/ROBOTIS-GIT/turtlebot3.git
git clone -b ros2-devel https://github.com/ROBOTIS-GIT/ld08_driver.git
# cd ~/turtlebot3_ws/src/turtlebot3
# rm -r turtlebot3_cartographer turtlebot3_navigation2
cd ~/turtlebot3_ws/
colcon build --symlink-install --parallel-workers 1
echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
echo "source ~/turtlebot3_ws/install/setup.bash" >> ~/.bashrc
echo "export ROS_DOMAIN_ID=30" >> ~/.bashrc
echo "export TURTLEBOT3_MODEL=burger" >> ~/.bashrc
