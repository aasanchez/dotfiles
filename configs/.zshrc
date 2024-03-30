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
  command-not-found
  docker
  git
  git-extras
  github
  golang
  gpg-agent
  node
  npm
  nvm
  terraform
  vscode
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

alias Bash='newBash'
newBash() {
  echo -e "#!/usr/bin/env bash\n" > "$1"
  chmod u+x "$1"
}

source $HOME/.shell/aliases.sh
source $HOME/.shell/credentials.sh
source $HOME/.shell/path.sh


export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

export PATH="$HOME/.symfony5/bin:$PATH"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
