#!/bin/bash

curl https://raw.githubusercontent.com/kubernetes/kubernetes/release-1.10/examples/guestbook/frontend-deployment.yaml > frontend-deployment.yaml
curl https://raw.githubusercontent.com/kubernetes/kubernetes/release-1.10/examples/guestbook/frontend-service.yaml > frontend-service.yaml
curl https://raw.githubusercontent.com/kubernetes/kubernetes/release-1.10/examples/guestbook/redis-master-deployment.yaml > redis-master-deployment.yaml
curl https://raw.githubusercontent.com/kubernetes/kubernetes/release-1.10/examples/guestbook/redis-master-service.yaml > redis-master-service.yaml
curl https://raw.githubusercontent.com/kubernetes/kubernetes/release-1.10/examples/guestbook/redis-slave-deployment.yaml > redis-slave-deployment.yaml
curl https://raw.githubusercontent.com/kubernetes/kubernetes/release-1.10/examples/guestbook/redis-slave-service.yaml > redis-slave-service.yaml

gcloud container clusters create guestbook --num-nodes=2
gcloud container clusters list
gcloud container clusters describe guestbook
