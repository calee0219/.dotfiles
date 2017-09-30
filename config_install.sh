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
# theme
cd ~/.oh-my-zsh/themes/custom/
git clone https://github.com/eendroroy/alien.git
ln -fs alien/alien.zsh-theme
source ~/.zshrc
# zsh-plugin
cd ~/.oh-my-zsh/custom/plugins
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
cd ~/.dotfiles

## git
ln -fs ~/.dotfiles/gitconfig ~/.gitconfig
ln -fs ~/.dotfiles/gitmessage ~/.gitmessage

## vim
ln -fs ~/.dotfiles/vimrc ~/.vimrc

## emacs

cd ~/.dotfiles
