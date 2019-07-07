#!/bin/bash

kubectl apply -f 01-hello-backend-deployment.yaml
kubectl describe deployment hello

kubectl apply -f 01-hello-backend-svc.yaml

kubectl apply -f 01-hello-frontend-deployment.yaml
kubectl describe deployment frontend

kubectl apply -f 01-hello-frontend-svc.yaml