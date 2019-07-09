# PersistentVolumes

* PersistentVolume resources are used to **manage durable storage** in a cluster. 
    * On GKE, PersistentVolumes are typically backed by **Compute Engine persistent disks**. 
* Unlike Volumes, the PersistentVolumes **lifecycle is managed by Kubernetes**. 
* PersistentVolumes **can be dynamically provisioned**; the user does not have to manually create and delete the backing storage.
* PersistentVolumes are cluster resources that exist **independently of Pods**.

# gcePersistentDisk

* A gcePersistentDisk volume mounts a Google Compute Engine (GCE) Persistent Disk into your Pod. 
* Unlike emptyDir, which is erased when a Pod is removed, the **contents of a PD are preserved** and the volume is merely **unmounted**.
* This means that a PD can be **pre-populated** with data, 
* And that data can be **"handed off" between Pods**.
* **Note:** You must create a PD using gcloud or the GCE API or UI before you can use it.
* There are some restrictions when using a gcePersistentDisk:
    * the nodes on which Pods are running must be GCE VMs
    * those VMs need to be in the same GCE project and zone as the PD
* A feature of PD is that they can be **mounted as read-only by multiple consumers simultaneously**. 
    * This means that you can **pre-populate** a PD with your dataset and then **serve it in parallel from as many Pods** as you need. 
    * Unfortunately, PDs can only be mounted by a **single consumer in read-write mode** - no simultaneous writers allowed.

# PersistentVolumeClaims
* A PersistentVolumeClaim is a **request for and claim to a PersistentVolume resource**. 
* PersistentVolumeClaim objects request:
    * a **specific size**, 
    * **access mode**, 
    * and **StorageClass** for the PersistentVolume. 
* If a PersistentVolume that satisfies the request exists or can be provisioned, the PersistentVolumeClaim is bound to that PersistentVolume.
* **Pods use claims as Volumes**.
* **Portability** is another advantage of using PersistentVolumes and PersistentVolumeClaims. 
    * You can easily **use the same Pod specification** across different clusters and environments because **PersistentVolume is an interface** to the actual backing storage.
* When you **delete this claim**, the **corresponding PersistentVolume object** as well as the **provisioned Compute Engine persistent disk** are also deleted.
    * Should you want to prevent deletion of dynamically provisioned persistent disks, set the **reclaim** policy of the PersistentVolume resource, or its StorageClass resource, to **Retain**. In this case, you are charged for the persistent disk for as long as it exists even if there is no PersistentVolumeClaim consuming it.

# StorageClasses
* A StorageClass provides a way for administrators to describe the "classes" of storage they offer. 
* Different classes might map to:
    * quality-of-service levels, 
    * or to backup policies, 
    * or to arbitrary policies determined by the cluster administrators. 
* Kubernetes itself is **unopinionated about what classes represent**. 
* Each StorageClass contains:
    * the fields provisioner, 
    * parameters, and 
    * reclaimPolicy, which are used when a PersistentVolume belonging to the class needs to be dynamically provisioned


# Dynamic Provisioning

* In order to create the storage required for MySQL and other StatefulSets the **first step** is to create **PersistentVolumeClaims**.
* When a PersistentVolumeClaim is created:
    * If there is **no existing PersistentVolume** for it to bind to:
        * A **new PersistentVolume** is **dynamically provisioned** based on the **StorageClass configuration**.
            * GKE has a **default StorageClass** installed that will allow you to **dynamically provision PersistentVolumes backed by persistent disks**. 
            * When a **StorageClass is not specified** in the PersistentVolumeClaim, the cluster's **default StorageClass** is used instead.

# Access Modes
* PersistentVolumes support the following access modes:
    * **ReadWriteOnce:** The Volume can be mounted as read-write by a single node.
    * **ReadOnlyMany:** The Volume can be mounted read-only by many nodes.
    * **ReadWriteMany:** The Volume can be mounted as read-write by many nodes. 
        * PersistentVolumes that are backed by Compute Engine persistent disks **don't support** this access mode.
* ReadWriteOnce is the **most common use case** for Persistent Disks and works as the default access mode for most applications. 
* Compute Engine Persistent Disks also support ReadOnlyMany mode so that many applications or many replicas of the same application can consume the same disk at the same time. 
    * An example use case is **serving static content** across multiple replicas.