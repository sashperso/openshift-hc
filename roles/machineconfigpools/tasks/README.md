# machineconfigpools role

**Table of Contents**
- [machineconfigpools role](#machineconfigpools-role)
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

* `machine_config_pools_name`: Get machine config pools name
* `machine_config_pools_number`: Get number of machine config pool
* `nodes_mcp`: Gets nodes
* `degraded_mcps`: Checks if there are degraded machine config pools
* `unavailable_nodes_count`: Checks if there are unavailable nodes that may become degraded


# Example Playbook
```yaml
- name: Get machine config pools name
  ansible.builtin.shell: oc get mcp
  register: machine_config_pools_name
```