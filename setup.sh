#!/bin/bash
if [ -e ~/.bash_profile ] || [ -L ~/.bash_profile ]; then
    mv ~/.bash_profile ~/.bash_profile.bak
fi

if [ -d ~/.vim ] || [ -L ~/.vim ]; then
    mv ~/.vim ~/.vim.bak
fi

if [ -e ~/.nvim ] || [ -L ~/.nvim ]; then
    mv ~/.nvim ~/.nvim.bak
fi

if [ -e ~/.nvimrc ] || [ -L ~/.nvimrc ]; then
    mv ~/.nvimrc ~/.nvimrc.bak
fi

if [ -e ~/.vimrc ] || [ -L ~/.vimrc ]; then
    mv ~/.vimrc ~/.vimrc.bak
fi

if [ -e ~/.zshrc ] || [ -L ~/.zshrc ]; then
    mv ~/.zshrc ~/.zshrc.bak
fi

ln -s `pwd`/bash_profile ~/.bash_profile
ln -s `pwd`/vim/vimrc ~/.vimrc
ln -s `pwd`/vim/vimrc ~/.nvimrc
ln -s `pwd`/vim ~/.vim
ln -s `pwd`/vim ~/.nvim

cd vim
./init.sh
