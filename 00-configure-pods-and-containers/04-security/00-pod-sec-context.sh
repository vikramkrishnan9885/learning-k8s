#!/bin/bash
kubectl apply -f 00-pod-sec-context.yaml
sleep 5m
kubectl get pod security-context-demo
