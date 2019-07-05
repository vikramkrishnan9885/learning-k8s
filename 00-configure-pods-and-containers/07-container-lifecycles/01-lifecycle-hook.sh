#!/bin/bash

kubectl apply -f 01-lifecycle-hook.yaml
sleep 1m
kubectl get pod lifecycle-demo