#!/bin/bash

kubectl create -f redis-slave-deployment.yaml
sleep 5m
kubectl get pods
kubectl create -f redis-slave-service.yaml
sleep 5m
kubectl get service