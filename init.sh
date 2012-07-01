#!/bin/sh
ln -s ~/.vim/vimrc ~/.vimrc
cd ~/.vim
git submodule init
git submodule update
cd bundle/command-t
rake make
cd ../../ctags
./configure
make
sudo make install
