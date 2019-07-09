#!/bin/bash

# Setup
gcloud container clusters create loadbalancedcluster

curl https://cloud.google.com/kubernetes-engine/docs/tutorials/http-balancer/web-deployment.yaml > web-deployment.yaml
curl https://cloud.google.com/kubernetes-engine/docs/tutorials/http-balancer/web-service.yaml > web-service.yaml
curl https://cloud.google.com/kubernetes-engine/docs/tutorials/http-balancer/basic-ingress.yaml > basic-ingress.yaml

# Create a Deployment using the sample web application container 
# image that listens on a HTTP server on port 8080:

kubectl apply -f web-deployment.yaml

# Create a Service resource to make the web deployment reachable 
# within your container cluster.
#
# When you create a Service of type NodePort with this command, 
# GKE makes your Service available on a randomly- selected high 
# port number (e.g. 32640) on all the nodes in your cluster.
kubectl apply -f web-service.yaml
kubectl get service web

# Create an Ingress resource
# Ingress is a Kubernetes resource that encapsulates a collection 
# of rules and configuration for routing external HTTP(S) traffic 
# to internal services.
#
# On GKE, Ingress is implemented using Cloud Load Balancing. When 
# you create an Ingress in your cluster, GKE creates an HTTP(S) 
# load balancer and configures it to route traffic to your application.
#
# While the Kubernetes Ingress is a beta resource, meaning how you 
# describe the Ingress object is subject to change, the Cloud Load 
# Balancers that GKE provisions to implement the Ingress are 
# production-ready.


kubectl apply -f basic-ingress.yaml
sleep 5m
kubectl get ingress basic-ingress