alias dc="docker compose"
alias dcw="docker compose up --watch"

docker-cleanup() {
    docker ps -q -a | xargs docker rm
    docker rmi $(docker images | grep "^<none>" | awk '{print $3}')
    docker volume rm $(docker volume ls -qf dangling=true)
}
