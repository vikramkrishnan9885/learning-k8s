# Set up the guestbook web frontend

kubectl create -f frontend-deployment.yaml
sleep 5m
kubectl get pods -l app=guestbook -l tier=frontend

# Expose frontend on an external IP address
kubectl create -f frontend-service.yaml
sleep 5m
kubectl get service frontend

kubectl scale deployment frontend --replicas=5
sleep 5m
kubectl get pods