# networks role

**Table of Contents**
- [networks role](#networks-role)
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
 This role checks for all the networks in the cluster that have not been admitted. 


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

* `routes_not_admitted`:  The shell command scans through all the `Routes` in every namespaces and looks for `Ingress` that have not been admitted. 


# Example Playbook
```yaml
#cluster-info.yml
- hosts: localhost
  roles:
     - networks
```

## Author Information
Abdullah Sikder asikder@redhat.com and Elise Elkerton elise@redhat.com
