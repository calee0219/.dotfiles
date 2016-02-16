#!/bin/bash

#install tmux.conf
ln -fs `pwd`/tmux/.tmux.conf ~/.tmux.conf
cd `pwd`/tmux/vendor/tmux-mem-cpu-load
sudo yum install cmake
sudo pip install psutil
cmake .
make
sudo make install clean
sudo cp ~/.tmux/vendor/basic-cpu-and-memory.tmux /usr/local/bin/tmux-mem-cpu-load
sudo chmod +x /usr/local/bin/tmux-mem-cpu-load

#install screenrc
ln -fs `pwd`/screenrc ~/.screenrc

#install bashrc
ln -fs `pwd`/bashrc ~/.bashrc
