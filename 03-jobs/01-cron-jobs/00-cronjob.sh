#!/bin/bash

kubectl create -f 00-cronjob.yaml

kubectl get cronjob hello

sleep 2m

kubectl get jobs

kubectl get cronjob hello
