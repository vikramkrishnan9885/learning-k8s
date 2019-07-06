#!/bin/bash
kubectl create secret generic backend-user --from-literal=backend-username='backend-admin'
kubectl create -f 01-env-var-secret.yaml