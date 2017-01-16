#!/bin/bash

# Set the tag with current date
TAG=$(date +"%Y.%m.%d-%H.%M.%S")

# Build the image
docker build --label=opsweekly -t aabbate/opsweekly:${TAG} -t aabbate/opsweekly:latest . 

# Check if the container is already running
if docker ps -a | grep -q opsweekly ; then
  # stop the running container
  docker stop $(docker ps -a -q -f name=opsweekly)
  # remove the container
  docker rm $(docker ps -a -q -f name=opsweekly)
fi

# Commit the build and push it to DockerHub using the custom and latest tags
docker commit opsweekly aabbate/opsweekly
docker push aabbate/opsweekly:${TAG}
docker push aabbate/opsweekly:latest
