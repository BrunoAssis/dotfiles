alias dc="docker-compose"

docker-cleanup() {
    docker ps -q -a | xargs docker rm
    docker rmi $(docker images | grep "^<none>" | awk '{print $3}')
    docker volume rm $(docker volume ls -qf dangling=true)
}

alias dspec="docker-compose run web bundle exec rspec"
