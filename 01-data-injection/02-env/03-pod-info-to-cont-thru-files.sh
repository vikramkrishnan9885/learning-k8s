#!/bin/bash

kubectl apply -f 03-pod-info-to-cont-thru-files.yaml
sleep 5m
kubectl get pods
kubectl logs dapi-envars-fieldref