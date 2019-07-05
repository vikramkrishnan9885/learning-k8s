#!/bin/bash
kubectl delete pod memory-demo --namespace=mem-example
kubectl delete pod mem-demo-2 --namespace=mem-example
kubectl delete pod mem-demo-3 --namespace=mem-example
kubectl delete namespace mem-example
minikube stop
minikube delete
