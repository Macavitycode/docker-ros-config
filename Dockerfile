FROM ros:noetic

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get clean && rm -rf /var/lib/apt/lists/* && apt-get update && apt-get upgrade -y

# Generic software
RUN apt install -y curl git neovim ranger neofetch htop

# Installing node
RUN curl -sL https://deb.nodesource.com/setup_19.x | sudo -E bash -

# Setup neovim
RUN mkdir -p /root/.config/nvim && \
    wget https://github.com/Macavitycode/Dotfiles/blob/master/nvim/init.vim &&\
    mv ./init.vim /root/.config/nvim/

RUN nvim +'PlugInstall' +qall && \
    nvim +'CocInstall -sync coc-python coc-clangd' +qall


# Gazebo 11 Installation
RUN curl -sSL http://get.gazebosim.org | sh

# ROS Gazebo Dependencies
RUN apt-get install -y \
    ros-noetic-gazebo-ros ros-noetic-gazebo-plugins ros-noetic-gazebo-msgs \
    ros-noetic-gazebo-dev

# ROS Dependencies
RUN apt-get install -y \
    ros-noetic-xacro ros-noetic-robot-state-publisher \
    ros-noetic-teleop-twist-keyboard ros-noetic-rviz \
    ros-noetic-velocity-controllers ros-noetic-effort-controllers \
    ros-noetic-position-controllers


USER root

SHELL [ "/bin/bash", "-c" ]

WORKDIR /root/