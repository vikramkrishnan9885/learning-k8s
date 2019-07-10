# Assigning Pods to Nodes
## Most Basic: nodeSelector
### Step One: Attach Labels to Nodes like so:
```
kubectl label nodes kubernetes-foo-node-1.c.a-robinson.internal disktype=ssd
```
The command is of the form:
```
kubectl label nodes <node-name> <label-key>=<label-value>
```
You can extract node names using
```
kubectl get nodes
```
**Note:** Labels are AND-ed

### Step Two: Add a nodeSelector field to your pod configuration
```
apiVersion: v1
kind: Pod
metadata:
  name: nginx
  labels:
    env: test
spec:
  containers:
  - name: nginx
    image: nginx
    imagePullPolicy: IfNotPresent
```
***
```
  nodeSelector:
    disktype: ssd
```

## More advanced: Affinity and anti-affinity

The affinity feature consists of two types of affinity, “node affinity” and “inter-pod affinity/anti-affinity”. Node affinity is like the existing nodeSelector (but with the first two benefits listed above), while inter-pod affinity/anti-affinity constrains against pod labels rather than node labels

The affinity/anti-affinity feature, currently in beta, greatly expands the types of constraints you can express. The key enhancements are
* the language is more expressive (not just "AND of exact match")
* you can indicate that the rule is soft/preference rather than a hard requirement, so if the scheduler can’t satisfy it, the pod will still be scheduled
* you can constrain against labels on other pods running on the node (or other topological domain), rather than against labels on the node itself, which allows rules about which pods can and cannot be co-located

### Node Affinity


The new node affinity syntax supports the following operators:
* In, 
* NotIn, 
* Exists, 
* DoesNotExist, 
* Gt, 
* Lt. 
    * You can use NotIn and DoesNotExist to achieve node anti-affinity behavior, or use node taints to repel pods from specific nodes.

If you specify both `nodeSelector` and `nodeAffinity`, both must be satisfied for the pod to be scheduled onto a candidate node.

There are currently two types of node affinity, called 
* `requiredDuringSchedulingIgnoredDuringExecution` : Hard Requirement - just like nodeSelector
*  `preferredDuringSchedulingIgnoredDuringExecution`: Soft requirement - Preferences that the scheduler will try to enforce but will not guarantee

If you specify multiple **nodeSelectorTerms** associated with **nodeAffinity** types, then the pod can be scheduled onto a node **if one of** the nodeSelectorTerms is satisfied.

If you specify multiple **matchExpressions** associated with **nodeSelectorTerms**, then the pod can be scheduled onto a node **only if all** matchExpressions can be satisfied.

nodeAffinity -> nodeSelectorTerms (if one of) -> matchExpressions (all of)

The **weight** field in `preferredDuringSchedulingIgnoredDuringExecution` is in the range 1-100. It is used as follows

* For each node that **meets all of the scheduling requirements** (resource request, RequiredDuringScheduling affinity expressions, etc.), 
* the scheduler will compute a sum by **iterating through the elements** of this field and 
* **adding "weight"** to the sum if the node matches the corresponding MatchExpressions. 
* This score is then **combined** with the scores of other priority functions for the node. 
* The node(s) with the **highest total score** are the most preferred.

```
apiVersion: v1
kind: Pod
metadata:
  name: with-node-affinity
spec:
  affinity:
    nodeAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
        nodeSelectorTerms:
        - matchExpressions:
          - key: kubernetes.io/e2e-az-name
            operator: In
            values:
            - e2e-az1
            - e2e-az2
      preferredDuringSchedulingIgnoredDuringExecution:
      - weight: 1
        preference:
          matchExpressions:
          - key: another-node-label-key
            operator: In
            values:
            - another-node-label-value
  containers:
  - name: with-node-affinity
    image: k8s.gcr.io/pause:2.0
```


### Inter-pod Affinity
* Inter-pod affinity and anti-affinity allow you to constrain which nodes your pod is eligible to be **scheduled based on labels on pods that are already running on the node** rather than based on labels on nodes. 
* The rules are of the form **"this pod should (or, in the case of anti-affinity, should not) run in an X if that X is already running one or more pods that meet rule Y"**. 
* Y is expressed as a `LabelSelector` with an **associated list of namespaces**
    * Unlike nodes, because pods are namespaced (and therefore the labels on pods are implicitly namespaced), a label selector over pod labels must specify which namespaces the selector should apply to.
* Conceptually X is a **topology domain like node, rack, cloud provider zone, cloud provider region**, etc. 
    * You express it using a `topologyKey` which is the key for the node label that the system uses to denote such a topology domain

The legal operators for pod affinity and anti-affinity are:
* In, 
* NotIn, 
* Exists, 
* DoesNotExist.

```
apiVersion: v1
kind: Pod
metadata:
  name: with-pod-affinity
spec:
  affinity:
    podAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
      - labelSelector:
          matchExpressions:
          - key: security
            operator: In
            values:
            - S1
        topologyKey: failure-domain.beta.kubernetes.io/zone
    podAntiAffinity:
      preferredDuringSchedulingIgnoredDuringExecution:
      - weight: 100
        podAffinityTerm:
          labelSelector:
            matchExpressions:
            - key: security
              operator: In
              values:
              - S2
          topologyKey: failure-domain.beta.kubernetes.io/zone
  containers:
  - name: with-pod-affinity
    image: k8s.gcr.io/pause:2.0
```
