#!/bin/bash

kubectl create -f 09-add-cm-data-to-vol.yaml
kubectl create -f 09-populate-vol-with-cm-data.yaml
sleep 10m
kubectl exec dapi-test-pod ls /etc/config/