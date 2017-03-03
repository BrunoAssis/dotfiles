alias dc="docker-compose"

docker-cleanup() {
    docker ps -q -a | xargs docker rm
    docker rmi $(docker images | grep "^<none>" | awk '{print $3}')
}
