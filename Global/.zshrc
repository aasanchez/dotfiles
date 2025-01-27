# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
    git
    1password
    catimg
    docker
    git-extras
    github
    golang
    gpg-agent
    node
    nvm
    terraform
    vscode
)

source $ZSH/oh-my-zsh.sh
source "$HOME/.sdkman/bin/sdkman-init.sh"

source $HOME/.shell/aliases.sh
# source $HOME/.shell/credentials.sh
source $HOME/.shell/path.sh
