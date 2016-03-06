#!/bin/bash

# install tmux.conf
ln -fs ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf
#ln -fs ~/.dotfiles/tmux ~/.tmux
cd ~/.dotfiles/tmux
git submodule init
git submodule update
cd ~/.dotfiles/tmux/vendor/tmux-mem-cpu-load
sudo yum install cmake
cmake .
make
sudo make install clean
tmux source-file ~/.tmux.conf
cd ~/.dotfiles

# install screenrc
ln -fs ~/.dotfiles/screenrc ~/.screenrc

# install bashrc
ln -fs ~/.dotfiles/bashrc ~/.bashrc

# install gitconfig
ln -fs ~/.dotfiles/gitconfig ~/.gitconfig

# install vimrc
ln -fs ~/.dotfiles/vim ~/.vim
ln -fs ~/.vim/vimrc ~/.vimrc
git submodule init
git submodule update
rm ~/.vim/vim

# install .config/fish
fish
ln -s ~/.dotfiles/fish ~/.config/fish/functions
rm ~/.dotfiles/fish/fish
