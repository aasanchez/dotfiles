#!/usr/bin/env bash
. packages/npm.sh
ROOT=$(pwd)
backup-npm

( 
cd packages/homebrew 
rm Brewfile*
brew bundle dump
)

