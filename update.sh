#!/usr/bin/env bash
npm update -g
npm list -g --depth 0 > packages/npm
sed -i "s/[├─└── ]//g" packages/npm
sed -i "/nvm/g" packages/npm
sed -i "/npm/g" packages/npm
sed -i '/^$/d' packages/npm

( 
cd packages 
rm Brewfile*
brew upgrade
brew bundle dump
)

code --list-extensions | xargs -L 1 echo code --install-extension > packages/vscode-packages
vagrant plugin list > packages/vagrant
cp .ssh/known_hosts credentials/.ssh/known_hosts 
cp .ssh/authorized_keys credentials/.ssh/authorized_keys 

while read secret; do
    cp -rf $secret credentials/$secret 
done <.gitignore

stow -D --verbose .
stow .