#!/bin/bash

kubectl create -f wordpress.yaml

# This manifest describes a Deployment with a single instance 
# WordPress Pod. This container reads the WORDPRESS_DB_PASSWORD 
# environment variable from the database password Secret you 
# created earlier.

# This manifest also configures the WordPress container to 
# communicate MySQL with the host address mysql:3306. This value 
# is set on the WORDPRESS_DB_HOST environment variable. We can refer
# to the database as mysql, because of Kubernetes DNS allows Pods 
# to communicate a Service by its name.

sleep 5m
kubectl get pod -l app=wordpress

kubectl create -f wordpress-service.yaml
# In the previous step, you have deployed a WordPress container 
# which is not currently accessible from outside your cluster as 
# it does not have an external IP address.
#
# To expose your WordPress application to traffic from the internet
# using a load balancer (subject to billing), you need a Service 
# with type:LoadBalancer.
sleep 5m
kubectl get svc -l app=wordpress
