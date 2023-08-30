#!/usr/bin/env bash

cd $HOME/.dotfiles/brew
rm Brewfile
brew bundle dump
