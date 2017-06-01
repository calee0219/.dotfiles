#!/bin/bash
#################################################################
#   This is a script for auto installing linux server tool      #
#   File name       > server_install.sh                         #
#   Author          > Gavin Lee                                 #
#   E-main          > sz110010@gmail.com                        #
#   Created Time    > 2016/04/02                                #
#################################################################

# checking Linux OS
if which apt-get > /dev/null 2>&1; then
    yes | sudo apt update
    yes | sudo apt upgrade
    app='sudo apt-get install -f'
elif which dnf > /dev/null 2>&1; then
    yes | sudo dnf update
    yes | sudo dnf upgrade
    app='sudo dnf install --best --allowerasing'
elif which pacman > /dev/null 2>&1; then
    yes | sudo pacman -Syu
    app='sudo pacman -S'
elif which brew > /dev/null 2>&1; then
    app='brew install'
fi

# server monitor and checking tool
yes | $app bmon
yes | $app ss
yes | $app tcptrack
yes | $app iftop
yes | $app fping

# install server
# nginx
yes | $app nginx
sudo systemctl start nginx.service
sudo systemctl enable nginx.service

# mysql -> mariadb
yes | $app mariadb
yes | $app mariadb-server
sudo systemctl start mariadb
sudo systemctl enable mariadb
