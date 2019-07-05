#!/bin/bash

# Create a namespace so that resources you create are isolated from rest
# of cluster
kubectl create namespace mem-example

# Apply the yaml
kubectl apply -f 00-mem-req-limit.yaml --namespace=mem-example

kubectl get pods --all-namespaces

#sleep 5m

# Verify the Pod is running
# Pod name and namespace from the yaml
kubectl get pod memory-demo --namespace=mem-example --output=yaml

# Use kubectl top to fetch metrics for the pod
# kubectl top pod memory-demo --namespace=mem-example
kubectl top pods --all-namespaces