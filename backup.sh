#!/usr/bin/env bash
. packages/npm.sh
ROOT=$(pwd)
backup-npm

( 
cd packages/homebrew 
rm Brewfile*
brew bundle dump
)

code --list-extensions | xargs -L 1 echo code --install-extension > packages/vscode-packages