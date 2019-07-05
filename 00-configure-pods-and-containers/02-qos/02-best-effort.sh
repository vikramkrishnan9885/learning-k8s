#!/bin/bash

kubectl apply -f 02-best-effort.yaml --namespace=qos-example
kubectl get pod best-effort-qos-demo --namespace=qos-example --output=yaml