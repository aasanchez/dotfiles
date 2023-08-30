#!/usr/bin/env bash

echo $HOME

# ignore_files="/Users/aasanchez/Library/CloudStorage/Dropbox"

cd $HOME/.dotfiles

stow --verbose --restow ssh
stow --verbose --restow git
stow --verbose --restow shell
