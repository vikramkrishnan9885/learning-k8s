#!/bin/bash
gcloud container clusters create demo-cluster --num-nodes 3 --zone us-central1-f

# NEED THIS TO GET TILLER WORKING
# Create a service account with the cluster admin role for Tiller, 
# the Helm server:
kubectl create serviceaccount --namespace kube-system tiller
kubectl create clusterrolebinding tiller --clusterrole=cluster-admin --serviceaccount=kube-system:tiller

# Initialize Tiller in your cluster and update information of 
# available charts:
helm init --service-account tiller
helm repo update

# Install a new Memcached Helm chart release with three replicas, 
# one for each node:
helm install stable/memcached --name mycache --set replicaCount=3

sleep 5m
kubectl get pods

# Discovering Memcached service endpoints
# The Memcached Helm chart uses a headless service. 
# A headless service exposes IP addresses for all of its pods so 
# that they can be individually discovered.
# Verify that the deployed service is headless:
kubectl get service mycache-memcached -o jsonpath="{.spec.clusterIP}"

# Retrieve the endpoints' IP addresses:
kubectl get endpoints mycache-memcached

# The application queries kube-dns for the DNS record of 
# mycache-memcached.default.svc.cluster.local
# You can use it like so
# import socket
# from pymemcache.client.hash import HashClient
# _, _, ips = socket.gethostbyname_ex('mycache-memcached.default.svc.cluster.local')
# servers = [(ip, 11211) for ip in ips]
# client = HashClient(servers, use_pooling=True)
# client.set('mykey', 'hello')
# client.get('mykey')
