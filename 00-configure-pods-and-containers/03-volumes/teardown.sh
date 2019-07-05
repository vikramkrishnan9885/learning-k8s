#!/bin/bash

kubectl delete pod redis
kubectl delete pod task-pv-pod
kubectl delete pod test-projected-volume
kubectl delete secret user pass
minikube stop
minikube delete