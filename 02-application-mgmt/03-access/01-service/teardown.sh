#!/bin/bash

# To delete the Service, enter this command:
kubectl delete services example-service

# To delete the Deployment, the ReplicaSet, and the Pods that are 
# running the Hello World application, enter this command:
kubectl delete deployment hello-world

minikube stop
minikube delete