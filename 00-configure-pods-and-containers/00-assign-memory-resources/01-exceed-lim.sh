#!/bin/bash

kubectl apply -f 01-exceed-limits.yaml --namespace=mem-example
kubectl get pod mem-demo-2 --namespace=mem-example --output=yaml
kubectl describe pod mem-demo-2 --namespace=mem-example
