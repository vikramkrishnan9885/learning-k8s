#!/bin/bash

kubectl apply -f 02-large-req.yaml --namespace=mem-example
kubectl get pod mem-demo-3 --namespace=mem-example --output=yaml
kubectl describe pod mem-demo-3 --namespace=mem-example
