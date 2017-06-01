#!/bin/bash


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

# system install
yes | $app the_silver_searcher
yes | $app silversearcher-ag
yes | $app git
yes | $app tmux
yes | $app curl
yes | $app wget
yes | $app wireshark
yes | $app nmap
yes | $app python python-setuptools python-pip
yes | $app tor
yes | $app docker
yes | $app virtualbox

# pip
sudo pip install github3.py
