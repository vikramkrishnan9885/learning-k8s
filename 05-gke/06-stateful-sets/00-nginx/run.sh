#!/bin/bash

gcloud container clusters create nginxss
kubectl apply -f nginx.yaml