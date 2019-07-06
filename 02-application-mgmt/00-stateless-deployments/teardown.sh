#!/bin/bash
kubectl delete deployment nginx-deployment
minikube stop
minikube delete