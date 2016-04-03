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
    apt-get update
    apt-get upgrade
    app='apt-get install'
elif which dnf > /dev/null 2>&1; then
    dnf update
    dnf upgrade
    app='dnf install'
elif which pacman > /dev/null 2>&1; then
    app='pacman -S'
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
yes | $app powertop
yes | $app lm_sensors
yes | $app mosh
yes | pip install mitmproxy
git clone git://github.com/huyng/bashmarks.git
cd bashmarks
make install
cd ..
yes | rm -r bashmarks

# appearance
yes | $app powerline
yes | $app tmux-powerline
yes | $app vim-plugin-powerline

# command
echo '#!/bin/sh

ssh bbsu@ptt.cc' > /usr/local/bin/ptt
echo '#!/bin/sh

luit -encoding big5 telnet bs2.to' > /usr/local/bin/bs2
echo '#!/bin/sh

clang++ -std=c++14 -Wall -Wextra -pedantic -g3 -O2 ${*} -o ${1%.*} && time ./${1%.*}' > /usr/local/bin/oop
chmod 755 /usr/local/bin/ptt /usr/local/bin/bs2 /usr/local/bin/oop
