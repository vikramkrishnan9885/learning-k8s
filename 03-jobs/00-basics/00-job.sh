#!/bin/bash

kubectl apply -f 00-job.yaml

kubectl describe jobs/pi

sleep 15m

kubectl describe jobs/pi

kubectl get pods

pods=$(kubectl get pods --selector=job-name=pi --output=jsonpath='{.items[*].metadata.name}')
echo $pods

kubectl logs $pods
