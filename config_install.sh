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
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

## zshrc
# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
ln -fs ~/.dotfiles/zshrc ~/.zshrc
# zsh-plugin
ZSH_CUSTOM=$HOME/.oh-my-zsh/custom
git clone https://github.com/zsh-users/zsh-completions.git $ZSH_CUSTOM/plugins/zsh-completions
git clone git://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/sobolevn/wakatime-zsh-plugin.git $ZSH_CUSTOM/plugins/wakatime
cd ~/.dotfiles

## wakatime
ln -fs ~/.dotfiles/wakatime.cfg ~/.wakatime.cfg

## git
ln -fs ~/.dotfiles/gitconfig ~/.gitconfig

## vim
ln -fs ~/.dotfiles/vimrc ~/.vimrc
ln -fs ~/.dotfiles/ycm_extra_conf.py ~/.ycm_extra_conf.py

## editor config
ln -fs ~/.dotfiles/editorconfig ~/.editorconfig

cd ~/.dotfiles
