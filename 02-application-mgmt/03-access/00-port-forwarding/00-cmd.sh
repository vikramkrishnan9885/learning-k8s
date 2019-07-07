#!/bin/bash

kubectl apply -f https://k8s.io/examples/application/guestbook/redis-master-deployment.yaml

sleep 10m

# View pod status to verify that it is ready
kubectl get pods

# View the deployment status:
kubectl get deployment

# View the replicaset status using:
kubectl get rs

# Create a Redis service:
kubectl apply -f https://k8s.io/examples/application/guestbook/redis-master-service.yaml
kubectl get svc | grep redis
kubectl port-forward svc/redis-master 7000:6379
# Other options:
# kubectl port-forward deployment/redis-master 7000:6379 
# or
# kubectl port-forward rs/redis-master 7000:6379 