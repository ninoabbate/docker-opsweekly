#!/bin/bash

# Set the TAG
TAG=$(date +"%Y.%m.%d-%H.%M.%S")

if docker ps -a | grep -q opsweekly_opsweeklydb_1 ; then
    docker commit -p dockermorgue_morguedb_1 aabbate/opsweeklydb:${TAG}
    docker push aabbate/opsweeklydb:${TAG}
fi
