#!/bin/bash

kubectl apply -f 00-cmd-liveness.yaml
sleep 30s
kubectl describe pod liveness-exec
sleep 35s
kubectl describe pod liveness-exec
sleep 30s
kubectl describe pod liveness-exec