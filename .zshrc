export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="/Users/aasanchez/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git aws catimg docker dotenv gatsby gcloud git-extras terraform jira)
source $ZSH/oh-my-zsh.sh

source $HOME/.shell/aliases.sh
source $HOME/.shell/exports.sh
source $HOME/.shell/functions.sh
source $HOME/.shell/path.sh
source $HOME/.shell/utils.sh