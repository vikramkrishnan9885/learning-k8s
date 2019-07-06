#!/bin/bash

kubectl apply -f 04-container-info-thru-files.yaml
sleep 5m
kubectl get pods
kubectl logs dapi-envars-fieldref