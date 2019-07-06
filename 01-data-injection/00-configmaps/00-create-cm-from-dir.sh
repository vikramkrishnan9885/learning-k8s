#!/bin/bash

# Create the local directory
mkdir -p configure-pod-container/configmap/

# Download the sample files into `configure-pod-container/configmap/` directory
wget https://kubernetes.io/examples/configmap/game.properties -O configure-pod-container/configmap/game.properties
wget https://kubernetes.io/examples/configmap/ui.properties -O configure-pod-container/configmap/ui.properties

# Create the configmap
# Note that from-file option is now a directory
kubectl create configmap game-config --from-file=configure-pod-container/configmap/

kubectl describe configmaps game-config

kubectl get configmaps game-config -o yaml