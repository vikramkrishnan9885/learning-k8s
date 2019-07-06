#!/bin/bash

cat <<EOF > ./kustomization.yaml
configMapGenerator:
- name: game-config-4
  files:
  - configure-pod-container/configmap/kubectl/game.properties
EOF

kubectl apply -k .

kubectl get configmap -o yaml

# Define the key to use when generating a ConfigMap from a file
# You can define a key other than the file name to use in the 
# ConfigMap generator. For example, to generate a ConfigMap from 
# files configure-pod-container/configmap/kubectl/game.properties 
# with the key game-special-key
# Create a kustomization.yaml file with ConfigMapGenerator

cat <<EOF >./kustomization.yaml
configMapGenerator:
- name: game-config-5
  files:
  - game-special-key=configure-pod-container/configmap/kubectl/game.properties
EOF

# Apply the kustomization directory to create the ConfigMap object.
kubectl apply -k .

# Generate ConfigMaps from Literals
# To generate a ConfigMap from literals special.type=charm and 
# special.how=very, you can specify the ConfigMap generator in 
# kusotmization.yaml as
# Create a kustomization.yaml file with ConfigMapGenerator
cat <<EOF >./kustomization.yaml
configMapGenerator:
- name: special-config-2
  literals:
  - special.how=very
  - special.type=charm
EOF

kubectl apply -k .