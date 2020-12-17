#!/usr/bin/env bash
stow -D --verbose .

# Restore homebrew packages
(
cd packages 
brew bundle
rm Brewfile.lock.json
)

while read extension; do
  $extension
done <packages/vscode-packages

# Update internal gitignore
tree -af  credentials > credentials-files
tree -afd credentials > credentials-directories
sed -i '$ d' credentials-files
sed -i '$ d' credentials-directories
sed -i '/^$/d' credentials-files
sed -i '/^$/d' credentials-directories
sed -i "s/[^A-Za-z0-9._\/]//g" credentials-files
sed -i "s/[^A-Za-z0-9._\/]//g" credentials-directories
while read directory; do
  sed -i "s|^$directory$||g" credentials-files
done <credentials-directories
sed -i "s/credentials\///g" credentials-files
sed -i "s/.git//g" credentials-files
sed -i "s/README.md//g" credentials-files
sed -i '/^$/d' credentials-files
cat credentials-files > .gitignore
rm credentials-files credentials-directories

while read secret; do
  cp -rf credentials/$secret $secret
done <.gitignore

if [ -f "~/Library/Application\ Support/Code/User/settings.json" ]; then
  rm "/Users/aasanchez/Library/Application\ Support/Code/User/settings.json"
fi 

stow .

sudo chmod 0400 ~/.ssh/id_rsa
eval $(ssh-agent -s); ssh-add -k ~/.ssh/id_rsa

gpg --import .gpg/gpg.asc

echo ".vscode" >> .gitignore
echo ".ssh/known_hosts" >> .gitignore
