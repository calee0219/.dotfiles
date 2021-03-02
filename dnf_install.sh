#!/bin/bash
#################################################################
#   This is a script for auto installing useful tool on Linux   #
#   File name       > ubuntu_install.sh                         #
#   Author          > Gavin Lee                                 #
#   E-main          > sz110010@gmail.com                        #
#   Created Time    > 2016/04/02                                #
#################################################################

sudo dnf update -y
sudo dnf upgrade -y
app='sudo dnf install -y'

# editor
$app vim
$app emacs

# work
$app openssh-server
#$app nginx
#$app virtualbox

# language
#$app python36u
#$app python36u-pip
$app python3
$app python3-pip
$app gcc
$app clang
#$app go
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
#$app docker
#$app mosh

# secure
#./security.sh

# server
#./server_install.sh

# Third-part
## Telegram
curl -s https://gist.githubusercontent.com/calee0219/e16b15e53be953a0f033d7939829e586/raw/gnome-telegram-desktop-installer.sh | bash
## GitHub CLI
sudo dnf config-manager -y --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
$app gh

# monitor tool
$app htop
$app bashtop
#$app mtr
$app ncdu
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
