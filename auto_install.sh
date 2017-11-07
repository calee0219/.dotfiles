#!/bin/sh

OS=$(uname -s)
echo "OS is $OS"

if [ $OS = "Darwin" ] ;then
    ./mac_install.sh
    ./config_install.sh
    ./python_tools.sh
elif [ $OS = "Linux" ] ;then
    ./ubuntu_install.sh
    ./docker_install.sh
    ./go_install.sh
    ./net.sh
    ./python_tools.sh
    ./server_install.sh
    ./security.sh
    ./config_install.sh
fi
