#!/bin/bash

cd kubernetes-engine-samples/hello-app
export PROJECT_ID="$(gcloud config get-value project -q)"

docker build -t gcr.io/${PROJECT_ID}/hello-app:v2 .
docker push gcr.io/${PROJECT_ID}/hello-app:v2

# apply a rolling update to the existing deployment with an image update:

kubectl set image deployment/hello-web hello-web=gcr.io/${PROJECT_ID}/hello-app:v2
