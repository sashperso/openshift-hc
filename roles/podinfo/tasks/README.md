# pod-info role

**Table of Contents**
- [pod-info role](#pod-info-role)
  - [Description](#description)
  - [Operating systems](#operating-systems)
  - [Local system access](#local-system-access)
- [Dependencies](#dependencies)
- [Role Variables](#role-variables)
  - [Main variables](#main-variables)
  - [Output variables](#output-variables)
- [Example Playbook](#example-playbook)
  - [Author Information](#author-information)

## Description
 This role focuses on the pod status. It uses logical implementation to figure out a certain number of pods that have restarted amd pods that are not running. 
 
 The way the non running pods are measured is by implementing a logical condition that iterates through all the pods in the cluster and only brings out the ones that are in a 'not succeeded' state. The logical implementation also sorts out the right comment/message that goes with the result of the logic. 

 The pods restarted also uses similar logical implementation in bash to sort out which pods have been restarted. The `RESTART_THRESHOLD` can be adjusted to dictate how many pod restart the health check will look for. This can be varied depending on the size and state of the cluster. 
 *NOTE*: This role only looks into the pods restarted and not the container restarts. If a pod multiple containers, then the pods restarted is the 'SUM' of all the containers restarted in that pod. For example, if a pod has 3 containers, and the first container restarted 3 times, second 2 and the third restarted 2 times, this role `pods_restarted` will result 7 by adding them. 

## Operating systems
This role will work on the following operating systems:

 * Red Hat
 * Fedora
 * MacOs (Sonoma 14.0) [Tested]
  
## Local system access

N/A

# Dependencies

There are no dependencies on other roles.

# Role Variables
N/A
## Main variables

Currently there are no configuration defaults for this role. Required variables are set dynamically at runtime.

## Output variables

Variables that output information to be placed in the report are captured here.

* `pods_not_running`: Grabs all the pods in every namespaces and uses JSON queries to filter out only the ones not in 'Succeeded' state. 
* `pods_restarted`: Grabs all the pods in every namespaces and uses JSON queries to filter out only the pones that have restarted more than the specied `REDTART_THRESHOLD`. If `RESTART_THRESHOLD` is set to '7', then this role will only give results for pods that have restarted more than '7' times. 


# Example Playbook
```yaml
#cluster-info.yml
- hosts: localhost
  roles:
     - clusterinfo
```

## Author Information
Abdullah Sikder asikder@redhat.com and Elise Elkerton elise@redhat.com
