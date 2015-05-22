#!/usr/bin/env bash
export TMP_PATH="./tmp"
[ -d "$TMP_PATH" ] || mkdir "$TMP_PATH";

sudo apt-get install build-essential git-core vim-nox \
		 texlive xsel xzdec biber mercurial

# Setup TLPDB
tlmgr init-usertree
tlmgr update --self
tlmgr install graphics newtx ebgaramond fontaxes import placeins paralist

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
source ~/dotfiles/subtasks/install_java.sh
source ~/dotfiles/subtasks/install_leiningen.sh
source ~/dotfiles/subtasks/install_rbenv.sh

