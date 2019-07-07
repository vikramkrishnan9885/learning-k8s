#!/bin/bash
grace=$(kubectl get po cassandra-0 -o=jsonpath='{.spec.terminationGracePeriodSeconds}') \
  && kubectl delete statefulset -l app=cassandra \
  && echo "Sleeping $grace" \
  && sleep $grace \
  && kubectl delete pvc -l app=cassandra
# https://kubernetes.io/docs/tasks/run-application/delete-stateful-set/
# Deleting or scaling a StatefulSet down does not delete 
# the volumes associated with the StatefulSet. This setting is 
# for your safety because your data is more valuable than 
# automatically purging all related StatefulSet resources.
# YOU SHOULD IDEALLY NEVER HAVING TO DO THIS
# https://kubernetes.io/docs/tasks/run-application/force-delete-stateful-set-pod/
kubectl delete service -l app=cassandra
minikube stop
minikube delete