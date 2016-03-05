#!/bin/bash

#install tmux.conf
ln -fs ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf
cd ~/.dotfiles/tmux/vendor/tmux-mem-cpu-load
sudo yum install cmake
sudo pip install psutil
cmake .
make
sudo make install clean
sudo cp ~/.dotfiles/tmux/vendor/basic-cpu-and-memory.tmux /usr/local/bin/tmux-mem-cpu-load
sudo chmod +x /usr/local/bin/tmux-mem-cpu-load

#install screenrc
ln -fs ~/.dotfiles/screenrc ~/.screenrc

#install bashrc
ln -fs ~/.dotfiles/bashrc ~/.bashrc

#inctall gitconfig
ln -fs ~/.dotfiles/gitconfig ~/.gitconfig
