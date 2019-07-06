#!/bin/bash

kubectl apply -f 02-container-fields-as-val-for-env-var.yaml
sleep 5m
kubectl get pods
kubectl logs dapi-envars-fieldref