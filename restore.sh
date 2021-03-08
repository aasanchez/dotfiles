#!/usr/bin/env bash

(
cd packages || exit
brew bundle cleanup --force
rm Brewfile.lock.json
)

PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
PATH="/usr/local/opt/make/libexec/gnubin:$PATH"

# rm -rf ~/.zshrc
stow -D --verbose .

mkdir ~/Development
touch ~/Development/Readme.md
mkdir ~/Development/Pulzu
mkdir ~/Development/Zartis

while read extension; do
    $extension --force
done <packages/vscode-packages

tree -af  credentials > credentials-files
tree -afd credentials > credentials-directories
gsed -i '$ d' credentials-files
gsed -i '$ d' credentials-directories
gsed -i '/^$/d' credentials-files
gsed -i '/^$/d' credentials-directories
gsed -i "s/[^A-Za-z0-9._\/]//g" credentials-files
gsed -i "s/[^A-Za-z0-9._\/]//g" credentials-directories
while read directory; do
    gsed -i "s|^$directory$||g" credentials-files
done <credentials-directories
gsed -i "s/credentials\///g" credentials-files
gsed -i "s/.git//g" credentials-files
gsed -i "s/README.md//g" credentials-files
gsed -i '/^$/d' credentials-files
cat credentials-files > .gitignore
rm credentials-files credentials-directories

while read secret; do
    cp -rf credentials/"$secret" "$secret"
done <.gitignore

stow .

# sudo chmod 0400 ~/.ssh/id_rsa
# eval $(ssh-agent -s); ssh-add -k ~/.ssh/id_rsa

# gpg --import .gpg/gpg.asc

echo ".vscode" >> .gitignore
sort -o  .gitignore .gitignore