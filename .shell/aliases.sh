alias ssh-k='eval $(ssh-agent -s); ssh-add -k ~/.ssh/id_rsa'
alias docker-cleanup='docker stop $(docker ps -a -q); docker rm $(docker ps -a -q); docker volume prune -f'
alias docker-cleanup-full='docker stop $(docker ps -a -q); docker rm $(docker ps -a -q); docker rmi $(docker images -q) -f ; docker volume prune -f'