# resourcequotas role

This role checks for resource quotas on the cluster, providing the hard and used limits.

**Table of Contents**
- [resourcequotas role](#resourcequotas-role)
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

* `resource_quota_name`: get resource quotas from throughout the cluster
* `resource_quota_hard_limit`: get resource quotas limits hard limits throughout the cluster
* `resource_quota_used_limit`: get resource quotas used limits throughout the cluster

# Example Playbook
```yaml
- name: Info for certificates inside OCP cluster.
  hosts: localhost
  gather_facts: false
  roles:
    - resourcequotas
```