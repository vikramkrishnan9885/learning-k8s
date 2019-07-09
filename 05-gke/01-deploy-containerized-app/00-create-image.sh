#!/bin/bash

#  you will deploy a sample web application called hello-app, 
# a web server written in Go that responds to all requests with 
# the message “Hello, World!” on port 80.
git clone https://github.com/GoogleCloudPlatform/kubernetes-engine-samples
cd kubernetes-engine-samples/hello-app

# Set the PROJECT_ID environment variable in your shell by 
# retrieving the pre- configured project ID on gcloud
# The value of PROJECT_ID will be used to tag the container image 
# for pushing it to your private Container Registry.
export PROJECT_ID="$(gcloud config get-value project -q)"

# Build the image
docker build -t gcr.io/${PROJECT_ID}/hello-app:v1 .

# Check that it is listed
docker images

# Run locally for testing
docker run --rm -p 8080:8080 gcr.io/${PROJECT_ID}/hello-app:v1

# Try this: curl http://localhost:8080
