#!/usr/bin/env bash

alias ssh-k='eval $(ssh-agent -s); ssh-add -k ~/.ssh/id_ed25519'
alias docker-cleanup='docker stop $(docker ps -a -q); docker rm $(docker ps -a -q); docker volume prune -f'
alias docker-cleanup-full='docker stop $(docker ps -a -q); docker rm $(docker ps -a -q); docker rmi $(docker images -q) -f ; docker volume prune -f; docker system prune --all --force --volumes'
alias 1password='eval $(op signin my)'
alias update='git add .; LC_ALL=C GIT_COMMITTER_DATE="$(date)" git commit --amend --no-edit --date "$(date)"'
