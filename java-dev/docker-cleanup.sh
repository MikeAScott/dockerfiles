#!/bin/bash
echo "Cleaning up docker containers and images"
docker rm $(docker ps -a -q)
docker rmi $(docker images | grep "^<none>" | awk "{print $3}") 
