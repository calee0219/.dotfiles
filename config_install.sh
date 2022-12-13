#!/bin/bash

if [ $SHELL != '/bin/zsh' ];
then
    chsh -s `which zsh`;
fi

## tmux
git clone https://github.com/gpakosz/.tmux.git ~/.tmux
ln -sf ~/.tmux/.tmux.conf ~/.tmux.conf
ln -sf ~/.tmux/.tmux.conf.local ~/.tmux.conf.local

## powerline
# powerline font
#git clone https://github.com/powerline/fonts.git --depth=1
#cd fonts
#./install.sh
#cd ..
#rm -rf fonts

# zimfw
curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh

awk 'NR==21 {print "\n\
#\n\
# Useful tools\n\
#\n\
\n\
zmodule sobolevn/wakatime-zsh-plugin"}1' ~/.zimrc > ~/.zimrc.bkg && rm ~/.zimrc && mv ~/.zimrc.bkg ~/.zimrc
source ~/.zshrc
zimfw install

## wakatime
pip3 install -U wakatime
ln -s ~/.dotfiles/wakatime.cfg ~/.wakatime.cfg

## git
ln -s ~/.dotfiles/gitconfig ~/.gitconfig

## vim
#ln -s ~/.dotfiles/vimrc ~/.vimrc
#ln -fs ~/.dotfiles/ycm_extra_conf.py ~/.ycm_extra_conf.py
# Just using SpaceVim
curl -sLf https://spacevim.org/install.sh | bash

## emacs
#ln -fs ~/.dotfiles/emacsrc ~/.emacs

## editor config
ln -s ~/.dotfiles/editorconfig ~/.editorconfig

cd ~/.dotfiles
