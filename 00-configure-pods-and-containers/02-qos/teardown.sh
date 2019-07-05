#!/bin/bash

kubectl delete pod guaranteed-qos-demo --namespace=qos-example
kubectl delete pod burstable-qos-demo --namespace=qos-example
kubectl delete pod best-effort-qos-demo --namespace=qos-example
kubectl delete ns qos-example
minikube stop
minikube delete