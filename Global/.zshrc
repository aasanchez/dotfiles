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

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

alias nv='nvim .'
alias lg='lazygit'
alias docker-obliterate='docker-compose down -v --rmi all && docker-compose rm -f -v'
alias xbar-dir='cd /Users/aasanchez/Library/Application\ Support/xbar/plugins'