#!/bin/bash

# update yum
yes | yum update
yes | yum upgrade

# useful tool
yes | yum install git
yes | yum install tmux
yes | yum install irssi
yes | yum install luit
yes | yum install shutter
yes | yum install htop
yes | yum install texlive
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

# browser
yes | yum install app/google-chrome-stable_current_x86_64.rpm

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
