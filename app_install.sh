#!/bin/bash

# update yum
yes | yum update
yes | yum upgrade

# useful tool
yes | yum install git
yes | yum install tmux
yes | yum install irssi
yes | yum install zsh
#yes | yum install luit
yes | yum install shutter
yes | yum install htop
yes | yum install texlive
yes | yum install powertop
yes | yum install lm_sensors
yes | yum install the_silver_searcher
yes | yum install mosh
yes | pip install mitmproxy
git clone git://github.com/huyng/bashmarks.git
cd bashmarks
make install clean
cd ..
yes | rm -r bashmarks
#yum install fish

# editor
yes | yum install vim
yes | yum install emacs

# language
yes | yum install go
yes | yum install python
yes | yum install gcc
yes | yum install clang
yes | yum install nodejs
yes | yum install ruby

# developer
yes | yum install ctags

# command
echo '#!/bin/sh

ssh bbsu@ptt.cc' > /usr/local/bin/ptt
echo '#!/bin/sh

luit -encoding big5 telnet bs2.to' > /usr/local/bin/bs2
echo '#!/bin/sh

clang++ -std=c++14 -Wall -Wextra -pedantic -g3 -O2 ${*} -o ${1%.*} && time ./${1%.*}' > /usr/local/bin/oop
chmod 755 /usr/local/bin/ptt /usr/local/bin/bs2 /usr/local/bin/oop
