#!/bin/bash

# Create a namespace so that resources you create are isolated from rest
# of cluster
kubectl create namespace cpu-example

# Apply the yaml
kubectl apply -f 00-cpu-req-limit.yaml --namespace=cpu-example

kubectl get pods --all-namespaces

#sleep 5m

# Verify the Pod is running
# Pod name and namespace from the yaml
kubectl get pod cpu-demo --namespace=cpu-example --output=yaml

# Use kubectl top to fetch metrics for the pod
# kubectl top pod cpu-demo --namespace=cpu-example
kubectl top pods --all-namespaces