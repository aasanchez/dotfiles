#!/usr/bin/env bash

brew_check(){
  if ! command -v $1 &>/dev/null; then
    brew install $1
  fi
}

if ! command -v brew &>/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew_check stow
brew_check "1password-cli"
brew_check "jq"