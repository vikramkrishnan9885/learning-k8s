#!/bin/bash

kubectl apply -f 00-commands.yaml
sleep 10m
kubectl get pods
kubectl logs command-demo