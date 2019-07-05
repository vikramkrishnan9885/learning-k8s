#!/bin/bash

kubectl get nodes
kubectl label nodes minikube labelType=myLabel
kubectl get nodes --show-labels
kubectl apply -f 00-assign.yaml
sleep 1m
kubectl get pods --output=wide