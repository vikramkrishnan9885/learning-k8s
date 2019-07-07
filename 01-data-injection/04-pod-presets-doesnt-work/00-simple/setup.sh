#!/bin/bash

minikube start --extra-config=apiserver.runtime-config=settings.k8s.io/v1alpha1=true