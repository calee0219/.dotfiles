#/bin/bash


# checking Linux OS
if which apt-get > /dev/null 2>&1; then
    yes | sudo apt update
    yes | sudo apt upgrade
    app = 'yes | sudo apt-get install -f'
elif which dnf > /dev/null 2>&1; then
    yes | sudo dnf update
    yes | sudo dnf upgrade
    app = 'yes | sudo dnf install --best --allowerasing'
elif which pacman > /dev/null 2>&1; then
    yes | sudo pacman -Syu
    app='yes | sudo pacman -S'
elif which brew > /dev/null 2>&1; then
    app='yes | brew install'
fi

# system install
$app the_silver_searcher
$app silversearcher-ag
$app git
$app tmux
$app curl
$app wget
$app wireshark
$app nmap
$app python python-setuptools python-pip
$app tor
$app docker

# pip
sudo pip install github3.py
