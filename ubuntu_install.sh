#!/bin/bash
#################################################################
#   This is a script for auto installing useful tool on Linux   #
#   File name       > ubuntu_install.sh                         #
#   Author          > Gavin Lee                                 #
#   E-main          > sz110010@gmail.com                        #
#   Created Time    > 2016/04/02                                #
#################################################################

# checking Linux OS
if which apt-get > /dev/null 2>&1; then
    yes | sudo apt update
    yes | sudo apt upgrade
    app='sudo apt install'
    yes | $app golang
else
    echo "this is not ubuntu"
fi

# editor
yes | $app vim
yes | $app emacs

# work
yes | $app openssh-server
yes | $app nginx
yes | $app virtualbox

# language
yes | $app python3
yes | $app python3-pip
yes | $app gcc
yes | $app clang
#yes | $app ruby

# npm
yes | $app nodejs
yes | $app nodejs-legacy
yes | $app npm

# developer
yes | $app ctags
yes | $app silversearcher-ag

# useful tool
yes | $app git
yes | $app tmux
yes | $app irssi
yes | $app shutter
yes | $app curl
yes | $app docker
#yes | $app mosh

# secure
#./security.sh

# server
#./server_install.sh

# monitor tool
yes | $app htop
yes | $app atop
yes | $app dstat
yes | $app glances
#yes | $app nmon
#yes | $app powertop
#yes | $app hddtemp
#yes | $app cpufreq-utils

# appearance
#yes | $app gnome-tweak-tool

./install.sh

# command
#sudo touch /usr/local/bin/ptt
#sudo touch /usr/local/bin/lab
#sudo touch /usr/local/bin/bsd
#sudo touch /usr/local/bin/ser
#sudo touch /usr/local/bin/csl
#sudo touch /usr/local/bin/csb
#sudo touch /usr/local/bin/toolbox
#sudo touch /usr/local/bin/oop
#sudo touch /usr/local/bin/ggg
#echo '#!/bin/sh
#
#ssh bbsu@ptt.cc' | sudo tee /usr/local/bin/ptt
#echo '#!/bin/sh
#
#if getopts :f op ; then
#   sftp calee0219@140.113.195.210
#else
#   ssh -X calee0219@140.113.195.210
#fi' | sudo tee /usr/local/bin/lab
#echo '#!/bin/sh
#
#if getopts :f op ; then
#   sftp -P 222 calee0219@140.113.69.46
#else
#   ssh -X -p 222 calee0219@140.113.69.46
#fi' | sudo tee /usr/local/bin/bsd
#echo '#!/bin/sh
#
#if getopts :f op ; then
#   sftp calee0219@140.113.69.46 -P 50
#else
#   ssh -X calee0219@140.113.69.46 -p 50
#fi' | sudo tee /usr/local/bin/ser
#echo '#!/bin/sh
#
#if getopts :f op ; then
#   sftp calee0219@linux2.cs.nctu.edu.tw
#else
#   ssh -X calee0219@linux2.cs.nctu.edu.tw
#fi' | sudo tee /usr/local/bin/csl
#echo '#!/bin/sh
#
#if getopts :f op ; then
#   sftp calee0219@bsd2.cs.nctu.edu.tw
#else
#   ssh -X calee0219@bsd2.cs.nctu.edu.tw
#fi' | sudo tee /usr/local/bin/csb
#echo '#!/bin/sh
#
#if getopts :f op ; then
#   sftp calee0219@140.113.66.249
#else
#   ssh -X calee0219@140.113.66.249
#fi' | sudo tee /usr/local/bin/toolbox
#echo '#!/bin/sh
#
#clang++ -std=c++14 -Wall -Wextra -pedantic -g3 -O2 ${*} -o ${1%.*} && time ./${1%.*}' | sudo tee /usr/local/bin/oop
#echo '#!/bin/sh
#
#g++ -std=c++17 -Wall -Wextra -pedantic -g3 -O3 ${*} -o ${1%.*} && time ./${1%.*}' | sudo tee /usr/local/bin/ggg
#sudo chmod 755 /usr/local/bin/ptt /usr/local/bin/lab /usr/local/bin/bsd /usr/local/bin/ser /usr/local/bin/csl /usr/local/bin/csb /usr/local/bin/toolbox /usr/local/bin/oop /usr/local/bin/ggg
