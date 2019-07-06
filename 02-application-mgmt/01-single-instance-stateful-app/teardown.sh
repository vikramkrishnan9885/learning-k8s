#!/bin/bash
kubectl delete deployment,svc mysql
kubectl delete pvc mysql-pvc
kubectl delete pv mysql-pv
minikube stop
minikube delete