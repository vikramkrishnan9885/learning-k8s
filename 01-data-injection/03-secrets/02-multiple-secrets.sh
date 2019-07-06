#/bin/bash

kubectl create secret generic backend-user --from-literal=backend-username='backend-admin' 
kubectl create secret generic db-user --from-literal=db-username='db-admin'

kubectl create -f 02-multiple-secrets.yaml