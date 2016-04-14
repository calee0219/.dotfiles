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
    app='sudo apt-get install'
elif which dnf > /dev/null 2>&1; then
    app='sudo dnf install'
elif which pacman > /dev/null 2>&1; then
    app='sudo pacman -S'
fi

# install server
yes | $app nginx
sudo systemctl enable nginx.service
yes | $app mysql mysql-server
sudo systemctl enable mariadb.service

# server monitor and checking tool
yes | pip install mitmproxy
