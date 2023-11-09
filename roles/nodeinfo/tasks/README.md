# Cluster Info Role

**Table of Contents**
- [Cluster Info Role](#cluster-info-role)
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

- This `role` gathers information of the the nodes, and can accomodate for any number of nodes that are available to the cluster. It reports the numbers and their type of nodes as well as lists any nodes that are not in the ready state. 

## Operating systems
This role will work on the following operating systems:

 * Red Hat
 * Fedora
 * MacOs (Sonoma 14.0) [Tested]
## Local system access

N/A

# Dependencies

N/A

# Role Variables
N/A
## Main variables

Currently there are no configuration defaults for this role. Required variables are set dynamically at runtime.

## Output variables

Variables that output information to be placed in the report are captured here.

* `oc_nodes`: Lists of all nodes
* `oc_master`: Iterate through master nodes and store names as list 
* `oc_number`: Prints out the number of nodes. 
* `nodes_not_ready`: Lists of nodes that are `NotReady`

# Example Playbook
```yaml
#cluster-info.yml
- hosts: localhost
  roles:
     - nodeinfo
```

## Author Information
Abdullah Sikder asikder@redhat.com and Elise Elkerton elise@redhat.com

