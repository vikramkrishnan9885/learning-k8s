#!/bin/bash
kubectl apply -f 00-secret.yaml
kubectl get secret test-secret
kubectl describe secret test-secret

kubectl apply -f 00-secret-pod.yaml
sleep 10m
kubectl get pod secret-test-pod
kubectl exec secret-test-pod -- bash -c "ls /etc/secret-volume"