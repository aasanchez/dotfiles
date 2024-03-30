#!/usr/bin/env bash

GPG_KEY=$(op item get kkvv6f6zxraigpap5dus3gehti --format json | jq --raw-output '.fields | .[] | select(.label == "fingerprint") | .value')
#Git Config
git config --global user.name "Alexis Sánchez"
git config --global user.email alexis@watechnology.com
git config --global user.username aasanchez
git config --global user.signingkey "$GPG_KEY"

git config --global init.defaultbranch main

git config --global core.excludesfile ~/.gitignore-global
git config --global core.editor "code --wait"

git config --global pull.rebase false

git config --global commit.gpgsign true
