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
    yes | sudo apt update
    yes | sudo apt upgrade
    app='sudo apt install'
    yes | $app golang
else
    echo "this is not ubuntu"
fi

# editor
yes | $app vim
yes | $app emacs

# work
yes | $app openssh-server
yes | $app nginx
yes | $app virtualbox

# language
yes | $app python3
yes | $app python3-pip
yes | $app gcc
yes | $app clang
#yes | $app ruby

# npm
yes | $app nodejs
yes | $app nodejs-legacy
yes | $app npm

# developer
yes | $app ctags
yes | $app silversearcher-ag
yes | $app zsh
yes | $app cmake

# useful tool
yes | $app git
yes | $app tmux
yes | $app irssi
yes | $app shutter
yes | $app curl
yes | $app docker
#yes | $app mosh

# secure
#./security.sh

# server
#./server_install.sh

# monitor tool
yes | $app htop
yes | $app atop
yes | $app dstat
yes | $app glances
#yes | $app nmon
#yes | $app powertop
#yes | $app hddtemp
#yes | $app cpufreq-utils

# appearance
#yes | $app gnome-tweak-tool

./config_install.sh
