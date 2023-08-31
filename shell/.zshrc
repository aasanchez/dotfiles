# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"
plugins=(
  1password
  aws
  catimg
  docker
  gatsby
  gcloud
  git
  git-extras
  github
  golang
  jira
  node
  terraform
  vscode
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
source $HOME/.shell/aliases.sh
source $HOME/.shell/credentials.sh
source $HOME/.shell/path.sh

export PATH="/usr/local/sbin:$PATH"

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
