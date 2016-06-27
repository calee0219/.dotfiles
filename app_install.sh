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
    yes | sudo apt-get update
    yes | sudo apt-get upgrade
    app='sudo apt-get install -f'
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
elif which pacman > /dev/null 2>&1; then
    app='sudo pacman -S'
fi

# editor
yes | $app vim
yes | $app emacs

# language
yes | $app python
yes | $app gcc
yes | $app clang
yes | $app nodejs
yes | $app ruby

# developer
yes | $app ctags
yes | $app the_silver_searcher

# useful tool
yes | $app git
yes | $app tmux
yes | $app irssi
yes | $app zsh
yes | $app luit
yes | $app shutter
yes | $app texlive
yes | $app mosh

# monitor tool
yes | $app conky
yes | $app conky-manager
yes | $app htop
yes | $app powertop
yes | $app nmon
yes | $app hddtemp
yes | $app cpufreq-utils
yes | $app glances

# appearance
yes | $app gnome-tweak-tool
yes | $app powerline

# command
sudo touch /usr/local/bin/ptt
sudo touch /usr/local/bin/lab
sudo touch /usr/local/bin/oop
sudo touch /usr/local/bin/ggg
echo '#!/bin/sh

ssh bbsu@ptt.cc' | sudo tee --append /usr/local/bin/ptt
echo '#!/bin/sh

ssh calee0219@140.113.195.210' | sudo tee --append /usr/local/bin/lab
echo '#!/bin/sh

clang++ -std=c++14 -Wall -Wextra -pedantic -g3 -O2 ${*} -o ${1%.*} && time ./${1%.*}' | sudo tee --append /usr/local/bin/oop
echo '#!/bin/sh

g++ -std=c++17 -Wall -Wextra -pedantic -g3 -O3 ${*} -o ${1%.*} && time ./${1%.*}' | sudo tee --append /usr/local/bin/ggg
sudo chmod 755 /usr/local/bin/ptt /usr/local/bin/lab /usr/local/bin/oop /usr/local/bin/ggg
