#!/bin/bash

# checking Linux OS
if which apt-get >/dev/null 2>&1; then
    app='sudo apt install'
elif which dnf >/dev/null 2>&1; then
    app='sudo dnf install --best --allowerasing'
elif which pacman >/dev/null 2>&1; then
    app='sudo pacman -S'
fi

# install tmux.conf

# install bashrc
#ln -fs ~/.dotfiles/bashrc ~/.bashrc

# install zshrc/oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install gitconfig
ln -fs ~/.dotfiles/gitconfig ~/.gitconfig
ln -fs ~/.dotfiles/gitmessage ~/.gitmessage

# install vimrc
ln -fs ~/.dotfiles/vimrc ~/.vimrc

# install emacs.d

cd ~/.dotfiles

echo "You have complete installing Gavin Lee's dotfiles :)"
