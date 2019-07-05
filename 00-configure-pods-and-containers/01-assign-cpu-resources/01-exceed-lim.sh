#!/bin/bash

kubectl apply -f 01-exceed-limits.yaml --namespace=cpu-example
kubectl get pod cpu-demo-2 --namespace=cpu-example --output=yaml
kubectl describe pod cpu-demo-2 --namespace=cpu-example
