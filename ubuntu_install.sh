#!/bin/bash
#################################################################
#   This is a script for auto installing useful tool on Linux   #
#   File name       > ubuntu_install.sh                         #
#   Author          > Gavin Lee                                 #
#   E-main          > sz110010@gmail.com                        #
#   Created Time    > 2016/04/02                                #
#################################################################

# checking Linux OS
if which apt-get > /dev/null 2>&1; then
    sudo apt update
    sudo apt upgrade -y
    app='sudo apt install -y'
    $app golang
else
    echo "this is not ubuntu"
fi

# editor
$app vim
$app emacs

# work
$app openssh-server
#$app nginx
#$app virtualbox

# language
$app python3
$app python3-pip
$app python
$app python-pip
$app gcc
$app clang
#$app ruby

# npm
#$app nodejs
#$app nodejs-legacy
#$app npm

# developer
$app ctags
$app silversearcher-ag
$app zsh
$app cmake

# useful tool
$app git
$app tmux
$app irssi
#$app shutter
$app curl
$app docker
#$app mosh

# secure
#./security.sh

# server
#./server_install.sh

# monitor tool
$app htop
$app atop
#$app dstat
#$app glances
#$app nmon
#$app powertop
#$app hddtemp
#$app cpufreq-utils

# appearance
#$app gnome-tweak-tool

./config_install.sh
