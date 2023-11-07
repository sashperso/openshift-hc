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

## Description

- This `role` gathers information of the cluster. It gathers informations of the cluster to display the details of the cluster on the report. This is important as it details key information such as the version of the cluster, id and api to make sure the report is for the desired cluster, and other informative items such as network type and installation type that can give more insights to teh actual state of the cluster. This role also lists many numerical items such as the number of nuilds, secrets, configmaps etc. that intents to show the size and usage of the cluster.
 
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

* `cluster_cli_version`: OpenShift Version 4.x
* `cluster_id`: OpenShift Cluster ID
* `cluster_api`: Cluster API
* `cluster_version`: OpenShift Cluster Version 
* `cluster_dns_name`: Cluster DNS Name
* `cluster_network_type`: Cluster Network Type.
* `cluster_nodes`: Number of nodes. 
* `cluster_namespaces`: Gather the number of namespaces running in the cluster. 
* `cluster_builds`: Gather the number of builds running in the cluster. 
* `cluster_update_channel`: Gathers the type of update channel avaiable for the cluster. 
* `cluster_installation_check`: Check which type of installation was used to install the cluster. 
* `cluster_bc`: Number of build configs in the cluster
* `cluster_services`: Number of services running in the cluster
* `cluster_crds`: Total number of Custom REsource Definition (CRDs) in the cluster
* `cluster_secrets`: Total secrets in the entire cluster
* `cluster_configmaps`: Total configmaps in the entire cluster


# Example Playbook
```yaml
- name: Cluster Version
  shell: oc get clusterversion/version -o jsonpath='{.status.desired.version}'
  ignore_errors: true
  register: cluster_version
  changed_when: false
```