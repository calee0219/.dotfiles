#!/bin/bash
#################################################################
#   This is a script for auto installing useful tool on Linux   #
#   File name       > app_install.sh                            #
#   Author          > Gavin Lee                                 #
#   E-main          > sz110010@gmail.com                        #
#   Created Time    > 2016/04/02                                #
#################################################################

# checking Linux OS
if which yum > /dev/null; then
    app='yum'
elif which apt-get > /dev/null; then
    app='apt-get'
elif which pacman > /dev/null; then
    app='pacman'
fi

# update $app
yes | $app update
yes | $app upgrade

# editor
yes | $app install vim
yes | $app install emacs

# language
yes | $app install go
yes | $app install python
yes | $app install gcc
yes | $app install clang
yes | $app install nodejs
yes | $app install ruby

# developer
yes | $app install ctags

# useful tool
yes | $app install git
yes | $app install tmux
yes | $app install irssi
yes | $app install zsh
#yes | $app install luit
yes | $app install shutter
yes | $app install htop
yes | $app install texlive
yes | $app install powertop
yes | $app install lm_sensors
yes | $app install the_silver_searcher
yes | $app install mosh
yes | pip install mitmproxy
git clone git://github.com/huyng/bashmarks.git
cd bashmarks
make install clean
cd ..
yes | rm -r bashmarks

# command
echo '#!/bin/sh

ssh bbsu@ptt.cc' > /usr/local/bin/ptt
echo '#!/bin/sh

luit -encoding big5 telnet bs2.to' > /usr/local/bin/bs2
echo '#!/bin/sh

clang++ -std=c++14 -Wall -Wextra -pedantic -g3 -O2 ${*} -o ${1%.*} && time ./${1%.*}' > /usr/local/bin/oop
chmod 755 /usr/local/bin/ptt /usr/local/bin/bs2 /usr/local/bin/oop
