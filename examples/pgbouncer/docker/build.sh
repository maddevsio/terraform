#!/bin/bash

eval "$(aws ecr get-login --no-include-email --region $2)"
docker build -t $1 -f docker/Dockerfile docker/.
docker push $1:latest
