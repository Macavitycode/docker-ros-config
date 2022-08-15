#!/bin/bash

./base.sh

if [ -z "$1" ]; then
    docker exec -it noetic bash -c /ros_script.sh
elif [ $1 == "detach" ]; then
    docker exec -t -d noetic bash -c /ros_script.sh
fi
