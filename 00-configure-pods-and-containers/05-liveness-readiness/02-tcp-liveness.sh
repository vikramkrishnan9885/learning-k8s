#!/bin/bash

kubectl apply -f 02-tcp-liveness.yaml
sleep 30s
kubectl describe pod goproxy