#!/bin/bash

kubectl delete service wordpress
sleep 5m
kubectl delete pvc wordpress-volumeclaim
kubectl delete pvc mysql-volumeclaim
gcloud container clusters delete persistent-disk-tutorial