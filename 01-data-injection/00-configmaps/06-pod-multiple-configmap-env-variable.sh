#!/bin/bash

kubectl create configmap special-config --from-literal=special.how=very
kubectl create -f 06-pod-multiple-configmap-env-variable.yaml