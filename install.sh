#!/bin/bash

#install tmux.conf
ln -fs ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf
sudo apt-get install gcc python-dev
sudo yum install gcc python-devel
python setup.py install
pip install psutil
cd ~/.dotfiles/tmux
git submodule init
git submodule update
cd ~/.dotfiles/tmux/vendor/tmux-mem-cpu-load
sudo yum install cmake
cmake .
make
sudo make install clean
sudo cp ~/.dotfiles/tmux/vendor/basic-cpu-and-memory.tmux /usr/local/bin/tmux-mem-cpu-load
sudo chmod +x /usr/local/bin/tmux-mem-cpu-load

#install screenrc
ln -fs ~/.dotfiles/screenrc ~/.screenrc

#install bashrc
ln -fs ~/.dotfiles/bashrc ~/.bashrc

#install gitconfig
ln -fs ~/.dotfiles/gitconfig ~/.gitconfig

#install vimrc
ln -fs ~/.dotfiles/vim ~/.vim
ln -fs ~/.vim/vimrc ~/.vimrc

#install .config/fish
ln -fs ~/.dotfiles/fish ~/.config/fish/functions
