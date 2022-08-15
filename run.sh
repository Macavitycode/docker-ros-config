#!/bin/bash

./stop.sh

xhost +local:root

docker run -t -d --privileged --net=host \
--name noetic \
-v $PWD/ros_script.sh:/root/source_this.sh \
-v $PWD/code:/root/code \
--env="DISPLAY" \
--env="QT_X11_NO_MITSHM=1" \
 noetic:gazebo
