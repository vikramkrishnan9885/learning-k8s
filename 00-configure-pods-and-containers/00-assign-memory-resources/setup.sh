#!/bin/bash
minikube start
minikube addons enable metrics-server
kubectl get apiservices