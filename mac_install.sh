#!/bin/bash

# install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# tool
brew install git
## objdump
brew install binutils

brew install vim
brew install curl ctags
brew install htop
brew install cmake
brew install golang
brew install nodejs npm
brew install the_silver_searcher
brew install gpg
brew install rust-analyzer # for Rust lsp
npm -g install n
sudo n latest
npm -g install npm
