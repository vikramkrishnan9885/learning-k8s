#!/bin/bash

# Create ConfigMaps from literal values
# You can use kubectl create configmap with the --from-literal 
# argument to define a literal value from the command line:

kubectl create configmap special-config --from-literal=special.how=very --from-literal=special.type=charm
# You can pass in multiple key-value pairs. Each pair provided 
# on the command line is represented as a separate entry in the 
# data section of the ConfigMap.

kubectl get configmaps special-config -o yaml