#!/bin/bash

# Build the image
docker build --label=opsweekly -t aabbate/opsweekly . 

# Check if the container is already running
if docker ps -a | grep -q opsweekly ; then
  # stop the running container
  docker stop $(docker ps -a -q -f name=opsweekly)
  # remove the container
  docker rm $(docker ps -a -q -f name=opsweekly)
fi

# Commit the build and push it to DockerHub
docker commit opsweekly aabbate/opsweekly

docker push aabbate/opsweekly
