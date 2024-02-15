# noderesources role

This role checks the resource usage of nodes on the cluster, and provides a warning if any resources are close to over-committed.

**Table of Contents**
- [noderesources role](#noderesources-role)
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

The role uses shell module to run oc commands.

# Dependencies

There are no dependencies on other roles.

# Role Variables
N/A
## Main variables

Currently there are no configuration defaults for this role. Required variables are set dynamically at runtime.

## Output variables

Variables that output information to be placed in the report are captured here.

* `noderesources_selected_data`: list of node resource information

# Example Playbook
```yaml
- name: Info for node resources inside OCP cluster.
  hosts: localhost
  gather_facts: false
  roles:
    - noderesources
```