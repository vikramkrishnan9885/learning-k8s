#!/bin/bash

kubectl apply -f 00-init-containers.yaml
kubectl get pod init-demo
sleep 10m
kubectl exec init-demo -- bash -c "sudo apt-get install curl"
kubectl exec init-demo -- bash -c "sudo curl localhost"