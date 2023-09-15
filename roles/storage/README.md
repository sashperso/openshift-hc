# etcd role

**Table of Contents**
- [Requirements](#requirements)
  * [Operating systems](#operating-systems)
  * [Local system access](#local-system-access)
- [Dependencies](#dependencies)
- [Role Variables](#role-variables)
  * [Main variables](#main-variables)
  * [Output variables](#output-variables)
- [Example Playbook](#example-playbook)

# Requirements
## Operating systems
This role will work on the following operating systems:

 * Red Hat

## Local system access

To successfully complete the role requires [kubernetes](https://pypi.org/project/kubernetes/) to translate calls to the kubernetes API. The library is a dependency of the `kubernetes.core` collection and must be available on your local machine (via `pip`).

```sh
pip install kubernetes
# OR cd to the base of the repo and run
pip install -r requirements.txt
```

# Dependencies

There are no dependencies on other roles.

# Role Variables

## Main variables

Currently there are no configuration defaults for this role. Required variables are set dynamically at runtime.

## Output variables

The role generates the following variables:

- sc_list: a list of the storage classes defined in the 
- sc_default: the default storage class(es) (There may be more than one)
- pvc_list: JSON dump of all PVCs across all namespaces
- orphaned_pvcs: a list of PVCs that are not bound to a container
- orphaned_pvs: a list of PVs that do not have a corresponding PVC

# Example Playbook

Example:

```yaml
- name: Info on the used and unused pvcs and pvs in the cluster.
  hosts: localhost
  gather_facts: false
  roles:
    - storage
```
