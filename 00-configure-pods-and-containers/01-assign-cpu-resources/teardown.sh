#!/bin/bash
kubectl delete pod cpu-demo --namespace=cpu-example
kubectl delete pod cpu-demo-2 --namespace=cpu-example
kubectl delete pod cpu-demo-3 --namespace=cpu-example
kubectl delete namespace cpu-example
minikube stop
minikube delete
