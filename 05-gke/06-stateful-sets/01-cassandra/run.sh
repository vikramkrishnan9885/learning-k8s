#!/bin/bash

# Setup
#curl https://raw.githubusercontent.com/kubernetes/website/master/content/en/examples/application/cassandra/cassandra-service.yaml > cassandra-service.yaml
#curl https://raw.githubusercontent.com/kubernetes/website/master/content/en/examples/application/cassandra/cassandra-statefulset.yaml > cassandra-statefulset.yaml 
gcloud container clusters create cassandra --num-nodes=3

# Service
kubectl apply -f cassandra-service.yaml
kubectl get svc cassandra

# Load Balancer
kubectl apply -f cassandra-lb.yaml
sleep 5m
kubectl get svc cassandra-lb

# StatefulSet
kubectl apply -f cassandra-statefulset.yaml 
sleep 10m
kubectl get statefulset cassandra
kubectl get pods -l="app=cassandra"
#sleep 15m
#kubectl get statefulset cassandra
#kubectl get pods -l="app=cassandra"
#sleep 15m
#kubectl get statefulset cassandra
#kubectl get pods -l="app=cassandra"
kubectl exec -it cassandra-0 -- nodetool status