#!/usr/bin/env bash
GO_VERSION="1.4.2"
GO_ARCHIVE="go$GO_VERSION.linux-amd64.tar.gz"
GO_PKG_URL="https://storage.googleapis.com/golang/$GO_ARCHIVE"

function download() {
	URL=$1
	ARCHIVE=$2

	if [ -f "./tmp/$ARCHIVE" ]; then
		echo "$ARCHIVE exists."
		return
	fi

	wget --show-progress -q -O "./tmp/$ARCHIVE.tmp" $URL
	if [ ! $? -eq 0 ]; then
		echo "Failed download."
	  exit -1
	fi

	mv "./tmp/$ARCHIVE.tmp" "./tmp/$ARCHIVE"
}

[ -d tmp/ ] || mkdir tmp/;

download $GO_PKG_URL $GO_ARCHIVE
mkdir -p "$HOME/tools/go-$GO_VERSION" ~/gopath
tar -xzf "tmp/$GO_ARCHIVE" -C "$HOME/tools/go-$GO_VERSION"
rm -f "$HOME/tools/go"
ln -s "$HOME/tools/go-$GO_VERSION/go" "$HOME/tools/go"

sudo apt-get install build-essential git-core vim-nox
ln -s ~/dotfiles/vim ~/.vim
ln -s ~/dotfiles/vim/vimrc ~/.vimrc

grep "source ~/dotfiles/include" ~/.bashrc

if [ ! $? -eq 0 ]; then
cat << ! >> ~/.bashrc
source ~/dotfiles/include
!
fi

