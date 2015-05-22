#!/usr/bin/env bash

source ~/dotfiles/functions.lib.sh

echo "Installing leiningen..."

download "https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein" "lein-0.1.sh"
mkdir -p "$HOME/tools/leiningen"
cp "tmp/lein-0.1.sh" "$HOME/tools/leiningen/lein"
chmod +x "$HOME/tools/leiningen/lein"

$HOME/tools/leiningen/lein

echo "DONE installing leiningen"
