#!/bin/bash

kubectl apply -f 01-burstable.yaml --namespace=qos-example
kubectl get pod burstable-qos-demo --namespace=qos-example --output=yaml