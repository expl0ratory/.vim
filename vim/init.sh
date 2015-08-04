#!/bin/sh
mkdir ~/.vim/tmp
mkdir ~/.vim/backup
pip install flake8
cd ~/.vim
cd bundle/vimproc
make -f make_mac.mak
cd ../../ctags
./configure
make
sudo make install
