#!/bin/bash

minikube start
linkerd check --pre
linkerd install | kubectl apply -f -
linkerd check
sleep 10m
kubectl -n linkerd get deploy
minikube stop
minikube delete
