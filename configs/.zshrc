# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

# If you come from bash you might have to change your $PATH.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
  1password
  aws
  catimg
  docker
  git
  git-extras
  github
  golang
  terraform
  vscode
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
source $HOME/.shell/aliases.sh
source $HOME/.shell/credentials.sh
source $HOME/.shell/path.sh
