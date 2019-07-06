#!/bin/bash

kubectl apply -f 00-deployment.yaml # This is used for both create and update
kubectl describe deployment nginx-deployment -o yaml
sleep 5m
kubectl get pods -l app=nginx