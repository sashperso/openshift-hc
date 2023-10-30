# kubelets role

This role checks for the kubelet config file on each node for authentication, pods, APIs, rotate certificates, cgroupDriver and clusterDNS

**Table of Contents**
- [kubelets role](#resourcequotas-role)
- [Requirements](#requirements)
  - [Operating systems](#operating-systems)
  - [Local system access](#local-system-access)
- [Dependencies](#dependencies)
- [Role Variables](#role-variables)
  - [Main variables](#main-variables)
  - [Output variables](#output-variables)
- [Example Playbook](#example-playbook)

# Requirements
## Operating systems
This role will work on the following operating systems:

 * Red Hat
 * Fedora[Tested]
## Local system access

The role uses shell module to run oc commands and bash script.

# Dependencies

There are no dependencies on other roles.

# Role Variables
N/A
## Main variables

Currently there are no configuration defaults for this role. Required variables are set dynamically at runtime.

## Output variables

Variables that output information to be placed in the report are captured here.

* `anonymous_authentication`: check anononymous authentication is turned off for each node
* `kubelet_pods`: get max number of pods,podsPerCore and pids for each node
* `kubelet_APIs`: get kubeAPIQPS and kubeAPIBurst for each node
* `kubelet_rotate_certificate`: get rotate certificates value from each node
* `kubelet_cgroupDriver`: get cgroupDriver
* `kubelet_permission`: get kubelet octal values (permission)
* `kubelet_clusterDNS`: get clusterDNS


# Example Playbook
```yaml
- name: Info for certificates inside OCP cluster.
  hosts: localhost
  gather_facts: false
  roles:
    - kubelets
```