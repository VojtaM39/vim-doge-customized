#!/usr/bin/env bash

# For more info about the 'set' command, see
# https://www.gnu.org/software/bash/manual/bash.html#The-Set-Builtin
set -e
set -u

[[ -e ./bin/vim-doge ]] && exit 0

ROOT_DIR="$(cd "$(dirname "$0")"; pwd -P)/.."
cd $ROOT_DIR
mkdir ./bin

OS="$(uname)"
OUTFILE="$ROOT_DIR/bin/vim-doge"

PKG_VERSION=$(cat "$ROOT_DIR/.version")
RELEASE_URL="https://github.com/kkoomen/vim-doge/releases/download/$PKG_VERSION"

if [[ $OS == 'Darwin' ]]; then
  VIM_DOGE_EXECUTABLE_URL="$RELEASE_URL/vim-doge-macos"
elif [[ $OS == 'Linux' ]]; then
  VIM_DOGE_EXECUTABLE_URL="$RELEASE_URL/vim-doge-linux"
else
  VIM_DOGE_EXECUTABLE_URL="$RELEASE_URL/vim-doge-win.exe"
  OUTFILE="$OUTFILE.exe"
fi

echo "Downloading $VIM_DOGE_EXECUTABLE_URL"
curl -L $VIM_DOGE_EXECUTABLE_URL > $OUTFILE
chmod +x $OUTFILE