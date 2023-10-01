#!/usr/bin/env bash

ignore_files='/Users/aasanchez/Library/CloudStorage/OneDrive-EVASolutionsGroupOy'

cd $HOME/.dotfiles

stow --verbose --ignore="$ignore_files" --restow configs
