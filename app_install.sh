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
    # spotify
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
    echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
    sudo apt-get update
    sudo apt-get install spotify-client
    yes | sudo apt update
    yes | sudo apt upgrade
    app='sudo apt-get install -f'
    yes | $app gccgo
elif which dnf > /dev/null 2>&1; then
    yes | sudo dnf update
    yes | sudo dnf upgrade
    app='sudo dnf install --best --allowerasing'

    # Browser
    #su -c "wget https://repos.fedorapeople.org/repos/spot/chromium/fedora-chromium-stable.repo -O /etc/yum.repos.d/fedora-chromium-stable.repo"
    #sudo rpm --import https://repos.fedorapeople.org/repos/spot/chromium/spot.gpg
    #yes | $app chromium

    # language
    yes | $app go
    yes | $app gcc-go

    # monitor tool
    yes | $app lm_sensors

    # appearance
    yes | $app tmux-powerline
    yes | $app vim-plugin-powerline
	yes | $app powerline
elif which pacman > /dev/null 2>&1; then
    app='sudo pacman -S'
fi

# input
yes | $app fcitx
yes | $app im-config
sudo add-apt-repository ppa:fcitx-team/nightly
sudo apt update
yes | $app fcitx-table-boshiamy
yes | $app fcitx-chewing

# editor
yes | $app vim
yes | $app emacs

# work
yes | $app slack-desktop
yes | $app nginx

# language
yes | $app python
yes | $app python-pip
yes | $app gcc
yes | $app clang
yes | $app nodejs
yes | $app nodejs-legacy
yes | $app npm
#yes | $app ruby

# developer
yes | $app ctags
yes | $app the_silver_searcher
yes | $app silversearcher-ag
sudo npm install -g angular angular-cli

# useful tool
yes | $app git
yes | $app tmux
yes | $app irssi
yes | $app shutter
#yes | $app zsh
#yes | $app luit
#yes | $app texlive
#yes | $app mosh

# monitor tool
#yes | $app conky
#yes | $app conky-manager
yes | $app htop
#yes | $app powertop
#yes | $app nmon
#yes | $app bmon
#yes | $app hddtemp
#yes | $app cpufreq-utils
yes | $app glances

# appearance
#yes | $app gnome-tweak-tool

# command
sudo touch /usr/local/bin/ptt
sudo touch /usr/local/bin/lab
sudo touch /usr/local/bin/bsd
sudo touch /usr/local/bin/ser
sudo touch /usr/local/bin/csl
sudo touch /usr/local/bin/csb
sudo touch /usr/local/bin/toolbox
sudo touch /usr/local/bin/oop
sudo touch /usr/local/bin/ggg
echo '#!/bin/sh

ssh bbsu@ptt.cc' | sudo tee /usr/local/bin/ptt
echo '#!/bin/sh

if getopts :f op ; then
	sftp calee0219@140.113.195.210
else
	ssh -X calee0219@140.113.195.210
fi' | sudo tee /usr/local/bin/lab
echo '#!/bin/sh

if getopts :f op ; then
	sftp -P 222 calee0219@140.113.69.46
else
	ssh -X -p 222 calee0219@140.113.69.46
fi' | sudo tee /usr/local/bin/bsd
echo '#!/bin/sh

if getopts :f op ; then
	sftp calee0219@140.113.69.46
else
	ssh -X calee0219@140.113.69.46
fi' | sudo tee /usr/local/bin/ser
echo '#!/bin/sh

if getopts :f op ; then
	sftp calee0219@linux2.cs.nctu.edu.tw
else
	ssh -X calee0219@linux2.cs.nctu.edu.tw
fi' | sudo tee /usr/local/bin/csl
echo '#!/bin/sh

if getopts :f op ; then
	sftp calee0219@bsd2.cs.nctu.edu.tw
else
	ssh -X calee0219@bsd2.cs.nctu.edu.tw
fi' | sudo tee /usr/local/bin/csb
echo '#!/bin/sh

if getopts :f op ; then
	sftp calee0219@140.113.66.249
else
	ssh -X calee0219@140.113.66.249
fi' | sudo tee /usr/local/bin/toolbox
echo '#!/bin/sh

clang++ -std=c++14 -Wall -Wextra -pedantic -g3 -O2 ${*} -o ${1%.*} && time ./${1%.*}' | sudo tee /usr/local/bin/oop
echo '#!/bin/sh

g++ -std=c++17 -Wall -Wextra -pedantic -g3 -O3 ${*} -o ${1%.*} && time ./${1%.*}' | sudo tee /usr/local/bin/ggg
sudo chmod 755 /usr/local/bin/ptt /usr/local/bin/lab /usr/local/bin/bsd /usr/local/bin/ser /usr/local/bin/csl /usr/local/bin/csb /usr/local/bin/toolbox /usr/local/bin/oop /usr/local/bin/ggg

./install.sh
