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
    app='sudo dnf install --best --allowerasing'
elif which pacman > /dev/null 2>&1; then
    app='sudo pacman -S'
fi

# install server
# nginx
yes | $app nginx
sudo systemctl start nginx.service
sudo systemctl enable nginx.service

# mysql -> mariadb
yes | $app mariadb mariadb-server
sudo systemctl start mariadb
sudo systemctl enable mariadb

# php
yes | $app php-fpm php-mysql php-common phpMyAdmin
sudo systemctl start php-fpm.service
sduo systemctl enable php-fpm.service

# go
# goserv
go get github.com/gotschmarcel/goserv

# server monitor and checking tool
