#!/bin/bash

kubectl apply -f 00-guaranteed.yaml --namespace=qos-example
kubectl get pod guaranteed-qos-demo --namespace=qos-example --output=yaml