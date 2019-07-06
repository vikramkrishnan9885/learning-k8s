#!/bin/bash

kubectl apply -f 00-mysql-pvc.yaml
kubectl apply -f 00-mysql-pv.yaml
kubectl apply -f 00-mysql-deploy.yaml
kubectl apply -f 00-mysql-service.yaml

kubectl describe deployment mysql
kubectl get pods -l app=mysql
kubectl describe pvc mysql-pvc