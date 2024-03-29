# machineconfigpools role

This role checks on machine config pools, also getting degraded and unavailable machine config pools. 

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
  - [Author Information](#author-information)

# Requirements

This role checks into the existing status of the MachineConfigPools. These dictate the state of the master, worker, and infra nodes, it is important to check their statuses and figure out any issues with these. For the purpose of the health-check report the role prints out informations such as the mcp names and their types. 

It also checks for degraded mcps by observing the status of the machine config pool CRDs.

The last task checks for any updating mcp and matches that against ready nodes to see if the update has been completed. 

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
- name: Info for certificates inside OCP cluster.
  hosts: localhost
  gather_facts: false
  roles:
    - machineconfigpools
```


## Author Information
Anojni, Abdullah Sikder asikder@redhat.com and Elise Elkerton elise@redhat.com
