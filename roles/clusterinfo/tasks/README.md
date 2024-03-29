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

- This `role` gathers information of the cluster. It gathers informations of the cluster to display the details of the targeted cluster in the report. This is important as it details key information such as the version of the cluster, ID and API to ensure the desired cluster is targeted. It also includes other informative items such as network type and installation type that can give more insights to the actual state of the cluster. This role also intends to show the size and usage of the cluster by checking items such as the number of builds, secrets, configmaps, etc.
 
## Operating systems
This role should work on the following operating systems:

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

Variables that output information for the report:

* `cluster_cli_version`: OpenShift Version 4.x
* `cluster_id`: OpenShift Cluster ID
* `cluster_api`: Cluster API
* `cluster_version`: OpenShift Cluster Version 
* `cluster_dns_name`: Cluster DNS Name
* `cluster_network_type`: Cluster Network Type
* `cluster_nodes`: Number of nodes
* `cluster_namespaces`: Gather the number of namespaces running in the cluster
* `cluster_builds`: Gather the number of builds running in the cluster
* `cluster_update_channel`: Gather the type of update channel avaiable for the cluster
* `cluster_installation_check`: Type of installation was used to install the cluster
* `cluster_bc`: Number of build configurations in the cluster
* `cluster_services`: Number of services running in the cluster
* `cluster_crds`: Total number of Custom Resource Definitions (CRDs) in the cluster
* `cluster_secrets`: Total secrets in the entire cluster
* `cluster_configmaps`: Total configmaps in the entire cluster


# Example Playbook
```yaml
#cluster-info.yml
- hosts: localhost
  roles:
     - clusterinfo
```

## Author Information
Abdullah Sikder asikder@redhat.com and Elise Elkerton elise@redhat.com

