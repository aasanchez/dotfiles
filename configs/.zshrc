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

source "$HOME/.cargo/env"
export TS_VERSION_CHECK=0
# pnpm
export PNPM_HOME="/Users/aasanchez/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

source <(fzf --zsh)


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/aasanchez/.google-cloud-sdk/path.zsh.inc' ]; then . '/Users/aasanchez/.google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/aasanchez/.google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/aasanchez/.google-cloud-sdk/completion.zsh.inc'; fi

export GOOGLE_APPLICATION_CREDENTIALS="$HOME/.gcp/credentials.json"
export GOOGLE_PROJECT=$(jq -r '.project_id' $HOME/.gcp/credentials.json)
export GOOGLE_REGION=europe-west3
export GOOGLE_ZONE=europe-west3-a