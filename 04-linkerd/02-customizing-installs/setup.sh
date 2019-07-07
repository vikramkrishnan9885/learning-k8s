#!/bin/bash

minikube start
linkerd check --pre
linkerd install > linkerd.yaml
kubectl kustomize . | kubectl apply -f -