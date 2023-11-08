# operators role

**Table of Contents**
- [operators role](#operators-role)
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
 This role is an informative role for the Operators, Subscription and Install Plans. It checks for unsuccesfull Cluster Service Versions (CSV) in the cluster, checks for unapproved Install Plans, gets a list of installed Operators. 

 CSVs are YAML manifest created from installing an Operator. It represents a particular version of running operator on a cluster. 

 An InstallPlan defines a set of resources to be created in order to install or upgrade to a specific version of a ClusterService defined by a CSV.

 A Subscription represents an intention to install an operator. Subscriptions describe which channel of an operator package to subscribe to, and whether to perform updates automatically or manually. 

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

* `csv`:  The shell command scans through all the csv(ClusterServiceVersion) in the cluster and uses JSON queries to filter out those which had not 'Succeeded'.
* `install_plan`:  The shell command scans through all the ip (InstallPlan) in the cluster and uses JSON queries to filter out which InstallPlans 'Approved' are true.
* `operators`: The shell command just returns all the installed Operators in the cluster. 


# Example Playbook
```yaml
#cluster-info.yml
- hosts: localhost
  roles:
     - operators
```

## Author Information
Abdullah Sikder asikder@redhat.com and Elise Elkerton elise@redhat.com
