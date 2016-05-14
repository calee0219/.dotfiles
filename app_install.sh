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
elif which pacman > /dev/null 2>&1; then
    app='sudo pacman -S'
fi

# editor
yes | $app vim
yes | $app emacs

# language
yes | $app go
yes | $app gcc-go
yes | $app python
yes | $app gcc
yes | $app clang
yes | $app nodejs
yes | $app ruby

# language support
# go
#gocode is used by many editors to provide intellisense
go get github.com/nsf/gocode
#goimports is something you should run when saving code to fill in import paths
go get golang.org/x/tools/cmd/goimports
#gorename is used by many editors to provide identifier rename support
go get golang.org/x/tools/cmd/gorename
#oracle is a tool that help with code navigation and search
go get golang.org/x/tools/cmd/oracle
#golint should be run after every build to check your code
go get github.com/golang/lint/golint

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
yes | $app lm_sensors
yes | $app nmon
yes | $app hddtemp

# appearance
yes | $app gnome-tweak-tool
yes | $app powerline
yes | $app tmux-powerline
yes | $app vim-plugin-powerline

# command
sudo touch /usr/local/bin/ptt
sudo touch /usr/local/bin/bs2
sudo touch /usr/local/bin/oop
echo '#!/bin/sh

ssh bbsu@ptt.cc' | sudo tee --append /usr/local/bin/ptt
echo '#!/bin/sh

ssh calee0219@140.113.195.210' | sudo tee --append /usr/local/bin/lab
echo '#!/bin/sh

clang++ -std=c++14 -Wall -Wextra -pedantic -g3 -O2 ${*} -o ${1%.*} && time ./${1%.*}' | sudo tee --append /usr/local/bin/oop
echo '#!/bin/sh

g++ -std=c++17 -Wall -Wextra -pedantic -g3 -O3 ${*} -o ${1%.*} && time ./${1%.*}' | sudo tee --append /usr/local/bin/ggg
sudo chmod 755 /usr/local/bin/ptt /usr/local/bin/lab /usr/local/bin/oop /usr/local/bin/ggg
