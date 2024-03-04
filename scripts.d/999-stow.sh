#!/usr/bin/env bash

cd $HOME/.dotfiles
find . -name .DS_Store -type f -delete

stow --restow configs
