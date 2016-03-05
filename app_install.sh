#!/bin/bash

# useful tool
yum install git
yum install tmux
yum install irssi
yum install fish

# editor
yum install vim
yum install emacs

# language
yum install go
yum install python
yum install gcc
yum install clang
yum install nodejs
yum install ruby

# browser
wget http://chrome.richardlloyd.org.uk/install_chrome.sh
chmod u+x install_chrome.sh
./install_chrome.sh
rm install_chrome.sh
