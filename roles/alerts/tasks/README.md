# alerts role

**Table of Contents**
- [alerts role](#alerts-role)
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

- This `role` looks into getting statuses of the monitoring stack that comes with the OpenShift cluster. There are a few alerts that comes pre-configured with the cluster. This `role` checks to see which alert has fired and how long is has been active. 
 
## Operating systems
This role will work on the following operating systems:

 * Red Hat
 * Fedora
 * MacOs (Sonoma 14.0) [Tested]
## Local system access

The role uses shell module to use `curl` commands for the health checks of the alerts. 

# Dependencies

There are no dependencies on other roles. However, this role relies on `curl` commands to fetch the alerts. 

# Role Variables
N/A
## Main variables

Currently there are no configuration defaults for this role. Required variables are set dynamically at runtime.

## Output variables

Variables that output information to be placed in the report are captured here.

* `alerts_firing`: Takes the Alerts that have fired, their namepsace, severity and active since and adds them dynamically to a table. 


# Example Playbook
```yaml
#cluster-info.yml
- hosts: localhost
  roles:
     - alerts
```


## Author Information
Abdullah Sikder asikder@redhat.com and Elise Elkerton elise@redhat.com
