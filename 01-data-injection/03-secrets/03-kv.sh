#!/bin/bash

kubectl create secret generic test-secret --from-literal=username='my-app' --from-literal=password='39528$vdg7Jb'
kubectl create -f 03-kv.yaml