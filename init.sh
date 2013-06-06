#!/bin/sh
ln -s ~/.vim/vimrc ~/.vimrc
cd ~/.vim
git submodule update --init
cd bundle/vimproc
make -f make_mac.mak
cd ../../ctags
./configure
make
sudo make install
