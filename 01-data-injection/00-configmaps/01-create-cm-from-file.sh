#!/bin/bash

kubectl create configmap game-config-2 --from-file=configure-pod-container/configmap/game.properties

kubectl describe configmaps game-config-2

# You can pass in the --from-file argument multiple times to create a ConfigMap from multiple data sources.
kubectl create configmap game-config-2 --from-file=configure-pod-container/configmap/game.properties --from-file=configure-pod-container/configmap/ui.properties

kubectl describe configmaps game-config-2

# Define the key to use when creating a ConfigMap from a file
kubectl create configmap game-config-3 --from-file=game-special-key=configure-pod-container/configmap/game.properties

kubectl get configmaps game-config-3 -o yaml
