#!/bin/sh

ln -fhs `pwd`/files/gemrc ~/.gemrc
ln -fhs `pwd`/files/gitconfig ~/.gitconfig
ln -fhs `pwd`/files/irbrc ~/.irbrc
ln -fhs `pwd`/files/pryrc ~/.pryrc
ln -fhs `pwd`/files/rvmrc ~/.rvmrc
ln -fhs `pwd`/files/vimrc ~/.vimrc
ln -fhs `pwd`/files/zshrc ~/.zshrc

mkdir -p ~/.oh-my-zsh/themes/
mv ~/.oh-my-zsh/themes/mateusg.zsh-theme ~/.oh-my-zsh/themes/mateusg.zsh-theme.bkp
ln -fhs `pwd`/files/.oh-my-zsh/themes/mateusg.zsh-theme ~/.oh-my-zsh/themes/mateusg.zsh-theme
