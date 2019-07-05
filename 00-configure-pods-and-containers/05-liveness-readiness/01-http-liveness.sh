#!/bin/bash

kubectl apply -f 01-http-liveness.yaml
sleep 30s
kubectl describe pod liveness-http