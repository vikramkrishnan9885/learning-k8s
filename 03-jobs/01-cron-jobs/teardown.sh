#!/bin/bash

kubectl delete cronjob hello

minikube stop
minikube delete