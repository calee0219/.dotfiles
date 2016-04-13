#!/bin/bash

# checking Linux OS
if which apt-get >/dev/null 2>&1; then
    app='apt-get'
elif which dnf >/dev/null 2>&1; then
    app='dnf'
elif which pacman >/dev/null 2>&1; then
    app='pacman'
fi

# git submodule
cd ~/.dotfiles
git submodule update --init --recursive
#git submodule init
#git submodule update

# install tmux.conf
ln -fs ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf
#ln -fs ~/.dotfiles/tmux ~/.tmux
cd ~/.dotfiles/tmux
git submodule init
git submodule update
cd ~/.dotfiles/tmux/vendor/tmux-mem-cpu-load
yes y | sudo $app install cmake
cmake .
make
sudo make install clean
tmux source-file ~/.tmux.conf
cd ~/.dotfiles

# install screenrc
#ln -fs ~/.dotfiles/screenrc ~/.screenrc

# install bashrc
ln -fs ~/.dotfiles/bashrc ~/.bashrc

# install zshrc
ln -fs ~/.dotfiles/zshrc ~/.zshrc

# install gitconfig
ln -fs ~/.dotfiles/gitconfig ~/.gitconfig

# install vimrc
cd ~/.dotfiles/vim
git submodule init
git submodule update
ln -fs ~/.dotfiles/vim ~/.vim
rm ~/.vim/vim
cd ~/.dotfiles/vim
./install_vimrc.sh
# install airline font
cd ~/.dotfiles/fonts
./install.sh

# install emacs.d

cd ~/.dotfiles

echo "You have complete installing Gavin Lee's dotfiles :)"
