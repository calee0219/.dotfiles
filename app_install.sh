#!/bin/bash

# useful tool
yum install git
yum install tmux
yum install irssi
yum install fish
yum install luit

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

# developer
yum install ctags

# command
echo '#!/bin/sh

ssh bbsu@ptt.cc' > /usr/local/bin/ptt
echo '#!/bin/sh

luit -encoding big5 telnet bs2.to' > /usr/local/bin/bs2
echo '#!/bin/sh

clang++ -std=c++14 -Wall -Wextra -pedantic -g3 -O2 ${1} -o ${1%.*} && ./${1%.*}' > /usr/local/bin/oop
chmod 755 /usr/local/bin/ptt /usr/local/bin/bs2 /usr/local/bin/oop
