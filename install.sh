#!/bin/bash

# git submodule
cd ~/.dotfiles
git submodule init
git submodule update

# install tmux.conf
ln -fs ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf
#ln -fs ~/.dotfiles/tmux ~/.tmux
cd ~/.dotfiles/tmux
git submodule init
git submodule update
cd ~/.dotfiles/tmux/vendor/tmux-mem-cpu-load
yes y | sudo yum install cmake
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
git submodule init
git submodule update
vim +PluginInstall +qall
rm ~/.vim/vim
yes y | sudo dnf install automake gcc gcc-c++ kernel-devel cmake
yes y | sudo dnf install python-devel python3-devel
cd ~/.dotfiles/vim/bundle/YouCompleteMe
./install.py --clang-completer --gocode-completer --tern-completer
ln -fs ~/.dotfiles/vim/ycm_extra_conf.py ~/.ycm_extra_conf.py

# install .config/fish
#fish
#ln -s ~/.dotfiles/fish ~/.config/fish/functions
#rm ~/.dotfiles/fish/fish

cd ~/.dotfiles
