#!/bin/bash

kubectl apply -f 01-patching-deployments.yaml
sleep 10m
kubectl get pods
sleep 5m
kubectl patch deployment patch-demo --path "$(cat 01-patch-file-containers.yaml)"
# https://kubernetes.io/docs/tasks/run-application/scale-stateful-set/
kubectl get deployment patch-demo --output yaml
sleep 10m
kubectl get pods