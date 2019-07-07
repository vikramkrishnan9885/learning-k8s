#!/bin/bash

kubectl apply -f 00-hello-application.yaml

sleep 10m
kubectl get deployments hello-world
kubectl describe deployments hello-world

kubectl get replicasets
kubectl describe replicasets

# Create a Service object that exposes the deployment:
kubectl expose deployment hello-world --type=NodePort --name=example-service
kubectl describe services example-service -o yaml

kubectl get pods --selector="run=load-balancer-example" --output=wide
kubectl cluster-info