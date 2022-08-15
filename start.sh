#!/bin/bash

if [ -z "$1" ]; then
    docker exec -it noetic bash
elif [ $1 == "detach" ]; then
    docker exec -t -d noetic bash -c /root/source_this.sh
fi
