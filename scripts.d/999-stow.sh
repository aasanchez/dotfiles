#!/usr/bin/env bash

echo $HOME

ignore_files='/Users/aasanchez/Library/CloudStorage/OneDrive-EVASolutionsGroupOy'

cd $HOME/.dotfiles

stow --verbose --ignore="$ignore_files" --restow ssh
stow --verbose --ignore="$ignore_files" --restow git
stow --verbose --ignore="$ignore_files" --restow shell
