#!/bin/sh
kubectl delete ingress basic-ingress
gcloud compute addresses delete web-static-ip --global
gcloud container clusters delete loadbalancedcluster