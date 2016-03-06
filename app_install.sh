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

# command
echo '#!/bin/sh\n\nssh bbsu@ptt.cc' > /usr/local/bin/ptt
echo '#!/bin/sh\n\nluit -encoding big5 telnet bs2.to' > /usr/local/bin/bs2
