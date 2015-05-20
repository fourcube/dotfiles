#!/usr/bin/env bash
export TMP_PATH="./tmp"
[ -d "$TMP_PATH" ] || mkdir "$TMP_PATH";

sudo apt-get install build-essential git-core vim-nox \
		 texlive xsel
ln -s ~/dotfiles/vim ~/.vim
ln -s ~/dotfiles/vim/vimrc ~/.vimrc

grep "source ~/dotfiles/include" ~/.bashrc

if [ ! $? -eq 0 ]; then
cat << ! >> ~/.bashrc
source ~/dotfiles/include
!
fi

source ~/dotfiles/subtasks/install_go.sh
source ~/dotfiles/subtasks/install_drive.sh

