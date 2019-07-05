#!/bin/bash

# Create files containing the username and password:
echo -n "admin" > ./username.txt
echo -n "1f2d1e2e67df" > ./password.txt

# Package these files into secrets:
kubectl create secret generic user --from-file=./username.txt
kubectl create secret generic pass --from-file=./password.txt

kubectl apply -f 02-proj-vol.yaml
sleep 5m

kubectl get pod test-projected-volume

kubectl exec test-projected-volume ls /projected-volume/