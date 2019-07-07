#!/bin/bash

# https://www.linkedin.com/pulse/kubernetes-deep-dive-part-2-pod-preset-atharva-chauthaiwale/

kubectl apply -f preset.yaml
kubectl get podpreset

kubectl apply -f pod.yaml
sleep 10m
# kubectl get pods
kubectl get pod website -o yaml

# PodPresets can’t be used to override a Pod’s own configuration, only to fill in settings which the Pod itself doesn’t specify. 