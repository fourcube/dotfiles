#!/usr/bin/env bash
RBENV_DIR="$HOME/.rbenv"

if [ ! -d "$RBENV_DIR" ]; then
	git clone https://github.com/sstephenson/rbenv.git "$RBENV_DIR"
	mkdir -p "$RBENV_DIR/plugins"
	git clone https://github.com/sstephenson/ruby-build.git "$RBENV_DIR/plugins/ruby-build"
else
	git -C "$RBENV_DIR" pull
	git -C "$RBENV_DIR/plugins/ruby-build" pull
fi

source "$HOME/dotfiles/path_extensions"

# Add rbenv init to your shell to enable shims and autocompletion.
SHIM_INIT='eval "$(rbenv init -)"'
grep -q "$SHIM_INIT" ~/.bashrc

if [ ! $? -eq 0 ]; then
	echo 'eval "$(rbenv init -)"' >> ~/.bashrc
fi

