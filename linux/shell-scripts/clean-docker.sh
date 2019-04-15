#!/bin/bash

# TODO update script with official docker documentation

# remove exited containers:
docker ps --filter status=dead --filter status=exited -aq | xargs -r docker rm -v

# remove unused images:
docker images --no-trunc | grep '<none>' | awk '{ print $3 }' | xargs -r docker rmi

# remove unused volumes (needs to be ran as root):
find '/var/lib/docker/volumes/' -mindepth 1 -maxdepth 1 -type d | grep -vFf <(
  docker ps -aq | xargs docker inspect | jq -r '.[]|.Mounts|.[]|.Name|select(.)'
) | xargs -r rm -fr

# https://lebkowski.name/docker-volumes/
# https://docs.docker.com/config/pruning/
# https://hackernoon.com/cleaning-up-docker-f14edd6fcf4c
# https://medium.com/the-code-review/clean-out-your-docker-images-containers-and-volumes-with-single-commands-b8e38253c271
# https://www.calazan.com/docker-cleanup-commands/
# https://gist.github.com/bastman/5b57ddb3c11942094f8d0a97d461b430
