#!/usr/bin/env bash

npm list -g --depth 0 > packages/npm
sed -i '/^$/d' packages/npm
( 
cd packages 
rm Brewfile*
brew bundle dump
)

code --list-extensions | xargs -L 1 echo code --install-extension > packages/vscode-packages

vagrant plugin list > packages/vagrant
