#!/bin/bash


# NOTE THE PATTERN:
#   * PVC
#   * DEPLOYMENT OR STATEFULSET
#   * SERVICE: CLUSTERIP FOR INTERNAL, LOADBALANCER FOR EXTERNAL
curl https://raw.githubusercontent.com/GoogleCloudPlatform/kubernetes-engine-samples/master/wordpress-persistent-disks/mysql-volumeclaim.yaml > mysql-volumeclaim.yaml
curl https://raw.githubusercontent.com/GoogleCloudPlatform/kubernetes-engine-samples/master/wordpress-persistent-disks/mysql.yaml > mysql.yaml
curl https://raw.githubusercontent.com/GoogleCloudPlatform/kubernetes-engine-samples/master/wordpress-persistent-disks/mysql-service.yaml > mysql-service.yaml

curl https://raw.githubusercontent.com/GoogleCloudPlatform/kubernetes-engine-samples/master/wordpress-persistent-disks/wordpress-volumeclaim.yaml > wordpress-volumeclaim.yaml
curl https://raw.githubusercontent.com/GoogleCloudPlatform/kubernetes-engine-samples/master/wordpress-persistent-disks/wordpress.yaml > wordpress.yaml
curl https://raw.githubusercontent.com/GoogleCloudPlatform/kubernetes-engine-samples/master/wordpress-persistent-disks/wordpress-service.yaml > wordpress-service.yaml


# Create the cluster
gcloud container clusters create persistent-disk-tutorial --num-nodes=2
