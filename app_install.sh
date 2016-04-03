#!/bin/bash
#################################################################
#   This is a script for auto installing useful tool on Linux   #
#   File name       > app_install.sh                            #
#   Author          > Gavin Lee                                 #
#   E-main          > sz110010@gmail.com                        #
#   Created Time    > 2016/04/02                                #
#################################################################

# checking Linux OS
if which apt-get > /dev/null 2>&1; then
    sudo apt-get update
    sudo apt-get upgrade
    app='sudo apt-get install'
elif which dnf > /dev/null 2>&1; then
    sudo dnf update
    sudo dnf upgrade
    app='sudo dnf install'
elif which pacman > /dev/null 2>&1; then
    app='sudo pacman -S'
fi

# editor
yes | $app vim
yes | $app emacs

# language
yes | $app go
yes | $app python
yes | $app gcc
yes | $app clang
yes | $app nodejs
yes | $app ruby

# developer
yes | $app ctags
yes | $app the_silver_searcher

# useful tool
yes | $app git
yes | $app tmux
yes | $app irssi
yes | $app zsh
#yes | $app luit
yes | $app shutter
yes | $app htop
yes | $app texlive
$app powertop
$app lm_sensors
$app mosh
yes | pip install mitmproxy
git clone https://github.com/huyng/bashmarks.git
cd bashmarks
sudo make install
cd ..
yes | rm -r bashmarks

# appearance
yes | $app powerline
yes | $app tmux-powerline
yes | $app vim-plugin-powerline

# command
sudo echo '#!/bin/sh

ssh bbsu@ptt.cc' > /usr/local/bin/ptt
sudo echo '#!/bin/sh

luit -encoding big5 telnet bs2.to' > /usr/local/bin/bs2
sudo echo '#!/bin/sh

clang++ -std=c++14 -Wall -Wextra -pedantic -g3 -O2 ${*} -o ${1%.*} && time ./${1%.*}' > /usr/local/bin/oop
sudo chmod 755 /usr/local/bin/ptt /usr/local/bin/bs2 /usr/local/bin/oop
