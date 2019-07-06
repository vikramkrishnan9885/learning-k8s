#!/bin/bash

kubectl apply -f 01-pods-fields-val-for-env-var.yaml
sleep 5m
kubectl get pods
kubectl logs dapi-envars-fieldref