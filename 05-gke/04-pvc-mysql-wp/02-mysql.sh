#!/bin/bash

# First step to deploy MySQL is to create a Kubernetes Secret to 
# store the password for the database.
kubectl create secret generic mysql --from-literal=password=1q2w3e!


# This manifest describes a Deployment with a single instance MySQL 
# Pod which will have the  MYSQL_ROOT_PASSWORD environment variable
#  whose value is set from the secret created. The mysql container 
# will use the PersistentVolumeClaim and mount the persistent disk 
# at /var/lib/mysql inside the container.
kubectl create -f mysql.yaml
sleep 5m
kubectl get pod -l app=mysql

# The next step is to create a Service to expose the MySQL container 
# and make it accessible from the wordpress container you are 
# going to create.
#
# This manifest describes a Service that creates a Cluster IP on 
# port 3306 for the Pods matching the label app: mysql. 
# The mysql container deployed in the previous step has this label. 
# In this case, you use type:ClusterIP for the Service, 
# as this value makes the Service reachable only from within the cluster.
#
# The Cluster IP created routes traffic to the MySQL container 
# from all compute nodes in the cluster and is not accessible to 
# clients outside the cluster. Once the Service is created, the 
# wordpress container can use the DNS name of the mysql container 
# to communicate, even though they are not in the same compute node.
kubectl create -f mysql-service.yaml
sleep 2m
kubectl get service mysql
