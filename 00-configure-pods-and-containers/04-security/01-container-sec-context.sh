#!/bin/bash
kubectl apply -f 01-container-sec-context.yaml
sleep 5m
kubectl get pod security-context-demo-2
