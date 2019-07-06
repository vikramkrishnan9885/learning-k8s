#!/bin/bash

kubectl apply -f 01-env-var-for-args.yaml
sleep 10m
kubectl get pods
kubectl logs command-demo