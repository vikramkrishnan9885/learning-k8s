# Static external IP addresses

Compute Engine supports two types of external IP addresses:

## Static external IP addresses
* Static external IP addresses are assigned to a project **long term** until they are **explicitly released**, and **remain attached** to a resource until they are **explicitly detached**.
    * For VM instances, static external IP addresses **remain attached to stopped instances** until they are removed.
* You can **reserve a static external IP address**
* This is useful **if you are dependent on a specific IP address for your service and need to prevent others from being able to use the address**. 
* You can reserve a **new** static external IP address or **promote an existing ephemeral** external IP address to a static external IP address.
* Static external IP addresses can be either a **regional** or **global** resources. 
    * **A regional static IP address**:  allows **resources of that region or resources of zones within that region to use the IP address**. In this case, VM instances and regional forwarding rules can use a regional static IP address.
    * **Global static external IP addresses**: are available only to **global forwarding rules**, used for **global load balancing**. You cannot assign a global IP address to a regional or zonal resource.

## Ephemeral external IP addresses
* Ephemeral external IP addresses are available to VM instances and forwarding rules. 
* Ephemeral external IP addresses **remain attached to a VM instance only until the VM is stopped and restarted or the instance is terminated**. 
* If an instance is stopped, any ephemeral external IP addresses assigned to the instance are **released back** into the general Compute Engine pool and become available for use by other projects. 
* When a stopped instance is started again, a **new ephemeral external IP address** is assigned to the instance.


# Configuring a static IP address
When you **expose a web server on a domain name**, you need the external IP address of an application to be a **static IP** that does not change.

Note that once you configure a static IP for the Ingress resource, **deleting the Ingress will not delete the static IP address associated to it**. Make sure to **clean up** the static IP addresses you configured once you no longer plan to use them again.

## Reserve a new static IP address

Reserve a static external IP address named **web-static-ip** by running:
```
gcloud compute addresses create web-static-ip --global
````
Now you need to configure the existing Ingress resource to use the reserved IP address. 

Replace the `basic-ingress.yaml` manifest contents with the following manifest:

```
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: basic-ingress
```
***
```
  annotations:
    kubernetes.io/ingress.global-static-ip-name: "web-static-ip"
```
***
```
spec:
  backend:
    serviceName: web
    servicePort: 8080
```

This change adds an annotation on Ingress to use the static IP resource named web-static-ip . 

To apply this modification to the existing Ingress, run the following command:
```
kubectl apply -f basic-ingress.yaml
```

Run `kubectl get ingress basic-ingress` and wait until the IP address of your application changes to use the reserved IP address of the `web-static-ip` resource.

It may take a couple of minutes to update the existing Ingress resource, re- configure the load balancer and propagate the load balancing rules across the globe. Once this operation completes, the GKE releases the ephemeral IP address previously allocated to your application.

