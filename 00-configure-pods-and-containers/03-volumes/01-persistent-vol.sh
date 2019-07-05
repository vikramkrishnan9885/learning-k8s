#!/bin/bash

# we are ssh-ing into the Virtualbox VM
minikube ssh -- bash -c "sudo mkdir /mnt/data" 
minikube ssh -- bash -c "sudo echo Hello >> /mnt/data/index.html"

# PV
kubectl apply -f 01-pv.yaml
kubectl get pv task-pv-volume

# PVC
kubectl apply -f 01-pvc.yaml
# Look again at the PersistentVolume
kubectl get pv task-pv-volume
kubectl get pvc task-pv-claim

# Pod
kubectl apply -f 01-pod.yaml
sleep 5m
kubectl get pod task-pv-pod

# Check
kubectl exec task-pv-pod -- bash -c "sudo apt-get install curl"
kubectl exec task-pv-pod -- bash -c "sudo curl localhost"