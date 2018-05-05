#!/bin/bash
#################################################################
#   This is a script for auto installing useful tool on Linux   #
#   File name       > ubuntu_install.sh                         #
#   Author          > Gavin Lee                                 #
#   E-main          > sz110010@gmail.com                        #
#   Created Time    > 2016/04/02                                #
#################################################################

sudo apt update
sudo apt upgrade
app='sudo yum install -y'

$app epel-release
$app yum-utils
$app groupinstall development
$app https://centos7.iuscommunity.org/ius-release.rpm

# editor
$app vim
$app emacs

# work
$app openssh-server
$app nginx
#$app virtualbox

# language
$app python36u
$app python36u-pip
$app python
$app python-pip
$app gcc
$app clang
#$app golang
#$app ruby

# developer
$app ctags
$app the_silver_searcher
$app zsh
$app cmake

# useful tool
$app git
$app tmux
$app curl
$app docker
#$app mosh

# secure
#./security.sh

# server
#./server_install.sh

# monitor tool
$app htop
#$app atop
#$app dstat
#$app glances
#$app nmon
#$app powertop
#$app hddtemp
#$app cpufreq-utils

# appearance
#$app gnome-tweak-tool

./config_install.sh
