#! /bin/bash
kubectl apply -f 00-redis-storage.yaml
sleep 5m
kubectl get pod redis #--watch
kubectl exec  redis -- bash -c  "echo 'Hello' > /data/redis/test-file"
kubectl exec  redis ls /data/redis/
