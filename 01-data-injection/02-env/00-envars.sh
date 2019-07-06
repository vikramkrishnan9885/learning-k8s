#!/bin/bash

kubectl apply -f 00-envars.yaml
sleep 5m
kubectl get pods -l purpose=demonstrate-envars
kubectl exec envar-demp -- bash -c "printenv"