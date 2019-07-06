#!/bin/bash

# ConfigMap & Secrets <Optional>

# Headless services for stable DNS entries of StatefulSet members
kubectl apply -f 00-cassandra-service.yaml
sleep 5m
kubectl get svc cassandra

# Client service for reads, if needed <Optional>

# StatefulSet 
kubectl apply -f 00-cassandra-statefulset.yaml
sleep 15m
kubectl get statefulset cassandra
kubectl get pods -l="app=cassandra"
kubectl exec -it cassandra-0 -- nodetool status