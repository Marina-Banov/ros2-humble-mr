# ROS2 Humble Docker Image for Mobile Robotics

This Docker image is designed for use in the Mobile Robotics course at the University of Rijeka, Faculty of Engineering. It includes the ROS2 Humble environment based on the official [OSRF Docker image](https://hub.docker.com/layers/osrf/ros/humble-desktop/images/sha256-43b24c3e69ece4fdc45f8c8bb9141ed79992bd2e175fb06057acd61bbbca4ff9?context=explore), along with all the necessary pre-configured tools and libraries.

## Getting Started

### Prerequisites

Docker should be installed on your system. You can install Docker Desktop for Windows [here](https://docs.docker.com/desktop/install/windows-install/) or Docker Engine for Linux [here](https://docs.docker.com/engine/install/ubuntu/).  

Create a directory on your host machine in which you'll store all your RO2 packages, e.g. `Documents/mr_src`. This will allow you to edit the source code on the host machine using your favorite IDE, and all changes will be reflected inside the Docker container.

### Pull the Docker Image

```sh
docker pull ghcr.io/marina-banov/ros2-humble-mr:latest
```

### Running the Docker Container on Windows

```sh
docker run -it --env="DISPLAY=:0" --env="WAYLAND_DISPLAY=wayland-0" --env="XDG_RUNTIME_DIR=/run/user/1000" --env="PULSE_SERVER=/mnt/wslg/PulseServer" --volume="/run/desktop/mnt/host/wslg/.X11-unix:/tmp/.X11-unix" --volume="/run/desktop/mnt/host/wslg:/mnt/wslg" --volume="[your-mr_src-directory]:/home/student/ros2_ws/src" --net=host --name ros2_humble_mr ghcr.io/marina-banov/ros2-humble-mr:latest
```

### Running the Docker Container on Linux

```sh
XAUTH=/tmp/.docker.xauth
xauth_list=$(xauth nlist :0 | tail -n 1 | sed -e 's/^..../ffff/')
if [ ! -f $XAUTH ]; then if [ ! -z "$xauth_list" ]; then echo $xauth_list | xauth -f $XAUTH nmerge -; else touch $XAUTH; fi; chmod a+r $XAUTH; fi
docker run -it --env="DISPLAY=$DISPLAY" --env="QT_X11_NO_MITSHM=1" --volume="/dev:/dev" --volume="/tmp/.X11-unix:/tmp/.X11-unix" --volume="$HOME/.Xauthority:/home/student/.Xauthority:rw" --volume="[your-mr_src-directory]:/home/student/ros2_ws/src" --net=host --name ros2_humble_mr ghcr.io/marina-banov/ros2-humble-mr:latest
```

## Usage

Once the Docker container is running, you can use it as your development environment.

- Build Your Workspace: `cd ~/ros2_ws && colcon build`
- Exit the container: `Ctrl+D`
- Access the container: `docker start -i ros2_humble_mr`
- Additional terminals (tabs): `docker exec -it ros2_humble_mr bash`

## Resources

- [Presentation](https://docs.google.com/presentation/d/e/2PACX-1vQvvt5oWvZtaLXbC93j_N56ytbrQf8UtfW2hM6J0kZsOo--1YBFJ2Hth8z7QqbMKciTNGwP4q9SIJ_1/pub?start=false&loop=false&delayms=60000&pli=1#slide=id.p) *"Start a Robot in a Docker Container"*
