#!/bin/bash
export PROJECT_ID="$(gcloud config get-value project -q)"

gcloud auth configure-docker -y

###########################################################
# vikram@vikram-Inspiron-7370:~/Dropbox/New-Inspiron-Ubuntu/Other/learning-k8s/05-gke/01-deploy-containerized-app$ ./01-upload-img.sh |ts '[%Y-%m-%d %H:%M:%S]' &>>out
# The following settings will be added to your Docker config file 
# located at [/home/vikram/.docker/config.json]:
#  {
#   "credHelpers": {
#     "gcr.io": "gcloud", 
#     "us.gcr.io": "gcloud", 
#     "eu.gcr.io": "gcloud", 
#     "asia.gcr.io": "gcloud", 
#     "staging-k8s.gcr.io": "gcloud", 
#     "marketplace.gcr.io": "gcloud"
#   }
# }
# 
# Do you want to continue (Y/n)?  Y
# 
# Docker configuration file updated.
# 
############################################################

docker push gcr.io/${PROJECT_ID}/hello-app:v1
