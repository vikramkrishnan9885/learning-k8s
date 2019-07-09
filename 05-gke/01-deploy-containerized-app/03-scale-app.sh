#!/bin/bash

kubectl scale deployment hello-web --replicas=3
sleep 3m
kubectl get deployment hello-web
kubectl get pods