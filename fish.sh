#!/bin/bash

# checking Linux OS
if which apt-get > /dev/null 2>&1; then
    app='sudo apt-get install -f'
elif which dnf > /dev/null 2>&1; then
    app='sudo dnf install --best --allowerasing'
elif which pacman > /dev/null 2>&1; then
    app='sudo pacman -S'
fi

yes | $app fish
chsh -s /usr/bin/fish

ln -fs ~/.dotfiles/config.fish  ~/.config/fish/config.fish
