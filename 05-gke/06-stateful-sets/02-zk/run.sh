#!/bin/bash

curl https://raw.githubusercontent.com/kubernetes/website/master/content/en/examples/application/zookeeper/zookeeper.yaml > zookeeper.yaml
gcloud container clusters create zookeeper --num-nodes=3


kubectl apply -f zookeeper.yaml
sleep 15m
kubectl get pods -l app=zk

# get the hostnames of the Pods in the zk StatefulSet.
# The StatefulSet controller provides each Pod with a unique 
# hostname based on its ordinal index. The hostnames take the form
# of <statefulset name>-<ordinal index>. Because the replicas 
# field of the zk StatefulSet is set to 3, the Set's controller 
# creates three Pods with their hostnames set to zk-0, zk-1, and zk-2.
for i in 0 1 2; do kubectl exec zk-$i -- hostname; done

# To examine the contents of the myid file for each server use the following command
for i in 0 1 2; do echo "myid zk-$i";kubectl exec zk-$i -- cat /var/lib/zookeeper/data/myid; done

# To get the Fully Qualified Domain Name (FQDN) of each Pod in the zk StatefulSet use the following command.
# The zk-hs Service creates a domain for all of the Pods, zk-hs.default.svc.cluster.local.
#    zk-0.zk-hs.default.svc.cluster.local
#    zk-1.zk-hs.default.svc.cluster.local
#    zk-2.zk-hs.default.svc.cluster.local
for i in 0 1 2; do kubectl exec zk-$i -- hostname -f; done

# ZooKeeper stores its application configuration in a file 
# named zoo.cfg. Use kubectl exec to view the contents of the 
# zoo.cfg file in the zk-0 Pod.
kubectl exec zk-0 -- cat /opt/zookeeper/conf/zoo.cfg


# Testing the ensemble
# The command below executes the zkCli.sh script to write world 
# to the path /hello on the zk-0 Pod in the ensemble.
kubectl exec zk-0 zkCli.sh create /hello world
# The data that you created on zk-0 is available on all the servers in the ensemble.
kubectl exec zk-1 zkCli.sh get /hello

# Logging
kubectl exec zk-0 cat /usr/etc/zookeeper/log4j.properties
sleep 1m
kubectl logs zk-0 --tail 20
