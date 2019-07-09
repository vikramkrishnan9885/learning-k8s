#!/bin/bash

kubectl create -f redis-master-deployment.yaml
sleep 5m
kubectl get pods
kubectl create -f redis-master-service.yaml
sleep 5m
kubectl get service