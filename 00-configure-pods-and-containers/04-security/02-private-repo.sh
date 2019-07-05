#!/bin/bash

kubectl create secret generic my-secret-0 \
    --from-file=.dockerconfigjson=/home/vikram/.docker/config.json \
    --type=kubernetes.io/dockerconfigjson
kubectl get secret my-secret-0 --output=yaml

kubectl create secret docker-registry my-secret-1 --docker-server=https://index.docker.io/v1/ --docker-username=vikramkrishnan9885 --docker-password=SH@221bBS --docker-email=kvikram9885@gmail.com
kubectl get secret my-secret-1 --output=yaml