#!/bin/bash
export PROJECT_ID="$(gcloud config get-value project -q)"

#  Create a container cluster
gcloud container clusters create hello-cluster --num-nodes=2
sleep 5m
gcloud compute instances list

# Deploy your application
kubectl run hello-web --image=gcr.io/${PROJECT_ID}/hello-app:v1 --port 8080
sleep 3m
kubectl get pods

# Expose your application to the Internet
kubectl expose deployment hello-web --type=LoadBalancer --port 80 --target-port 8080
sleep 5m
kubectl get service
