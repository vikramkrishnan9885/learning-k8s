# Disruptions:

## Classification
Two types:
* **Voluntary** Initiated by Cluster Admin
* **Involuntary** Accidental disruption like hardware failures, human error, kernel panics etc

## Dealing with Disruptions:
### Involuntary
* Ensure pod **requests resources**
* Replicate your application for HA
* Spread across:
    * Racks (anti-affinity)
    * Regions (multi-zone clusters)
### Voluntary:
**Disruption Budgets**: Used for HA plus frequent voluntary disruptions

# How Disruption Budgets Work
An Application Owner can create a `PodDisruptionBudget` object (PDB) for each application. 

**Limits the number of pods of a replicated application that are down simultaneously from voluntary disruptions**. 

For example, a quorum-based application would like to ensure that the number of replicas running is never brought below the number needed for a quorum. A web front end might want to ensure that the number of replicas serving load never falls below a certain percentage of the total.

PDBs **cannot prevent involuntary disruptions** from occurring, but they **do count** against the budget.

Pods which are **deleted or unavailable due to a rolling upgrade** to an application **do count** against the disruption budget, but controllers (like deployment and stateful-set) are not limited by PDBs when doing rolling upgrades – the handling of failures during application updates is configured in the controller spec.

Cluster managers and hosting providers should use tools which respect Pod Disruption Budgets by calling the **Eviction API** instead of directly deleting pods or deployments. 