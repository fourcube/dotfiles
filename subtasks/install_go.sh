source ~/dotfiles/functions.lib.sh

GO_VERSION="1.4.2"
GO_ARCHIVE="go$GO_VERSION.linux-amd64.tar.gz"
GO_PKG_URL="https://storage.googleapis.com/golang/$GO_ARCHIVE"

echo "Installing go $GO_VERSION..."

download $GO_PKG_URL $GO_ARCHIVE
mkdir -p "$HOME/tools/go-$GO_VERSION" ~/gopath
tar -xzf "$TMP_PATH/$GO_ARCHIVE" -C "$HOME/tools/go-$GO_VERSION"
rm -f "$HOME/tools/go"
ln -s "$HOME/tools/go-$GO_VERSION/go" "$HOME/tools/go"

echo "DONE installing go $GO_VERSION..."
