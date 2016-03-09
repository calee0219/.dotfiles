#!/bin/bash

yes y |

# update yum
yum update
yum upgrade

# useful tool
yum install git
yum install tmux
yum install irssi
yum install luit
yum install shutter
#yum install fish

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
yum install google-chrome-stable_current_x86_64.rpm

# developer
yum install ctags

# command
echo '#!/bin/sh

ssh bbsu@ptt.cc' > /usr/local/bin/ptt
echo '#!/bin/sh

luit -encoding big5 telnet bs2.to' > /usr/local/bin/bs2
echo '#!/bin/sh

clang++ -std=c++14 -Wall -Wextra -pedantic -g3 -O2 ${*} -o ${1%.*} && ./${1%.*}' > /usr/local/bin/oop
chmod 755 /usr/local/bin/ptt /usr/local/bin/bs2 /usr/local/bin/oop
