FROM ros:noetic

ARG DEBIAN_FRONTEND=noninteractive

RUN apt clean && rm -rf /var/lib/apt/lists/* && apt update && \
    apt upgrade -y

# Generic software
RUN apt install -y curl git ranger neofetch htop apt-utils software-properties-common

# Add neovim repo and install
RUN add-apt-repository ppa:neovim-ppa/unstable && apt update && \
    apt install -y neovim

# Installing node
RUN curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash -

# Setup neovim
RUN mkdir -p /root/.config/nvim; \
    curl -o /root/.config/nvim/init.vim \
    https://raw.githubusercontent.com/Macavitycode/Dotfiles/master/nvim/minimal.vim

# RUN nvim +'PlugInstall' +qall && \
#     nvim +'CocInstall -sync coc-python coc-clangd' +qall


# Gazebo 11 Installation
RUN curl -sSL http://get.gazebosim.org | sh

# ROS Gazebo Dependencies
RUN apt install -y \
    ros-noetic-gazebo-ros ros-noetic-gazebo-plugins ros-noetic-gazebo-msgs \
    ros-noetic-gazebo-dev

# ROS Dependencies
RUN apt install -y \
    ros-noetic-xacro ros-noetic-robot-state-publisher \
    ros-noetic-teleop-twist-keyboard ros-noetic-rviz \
    ros-noetic-velocity-controllers ros-noetic-effort-controllers \
    ros-noetic-position-controllers ros-noetic-controller-* \
    ros-noetic-joint-state-* ros-noetic-controller-manager* \
    ros-noetic-joint-state* ros-noetic-hector-sensors* \
    ros-noetic-realsense* ros-noetic-gazebo-ros-control \
    ros-noetic-ackermann*

USER root

SHELL [ "/bin/bash", "-c" ]

WORKDIR /root/
