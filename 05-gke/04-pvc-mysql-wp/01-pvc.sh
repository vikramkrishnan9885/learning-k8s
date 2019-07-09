#!/bin/bash

kubectl apply -f mysql-volumeclaim.yaml
kubectl apply -f wordpress-volumeclaim.yaml
sleep 10m
kubectl get pvc