#!/bin/bash

kubectl create configmap special-config --from-literal=special.how=very
kubectl create -f 05-pod-single-configmap-env-variable.yaml