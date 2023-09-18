# Storage role

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

 * Any Linux variant that support Ansible
 * Requires API access (port 6443) to the OpenShift cluster
 * User running the role must be logged into the cluster as a user bound to at least the **cluster-reader** role

## Local system access

To successfully complete the role requires [kubernetes](https://pypi.org/project/kubernetes/) to translate calls to the kubernetes API. The library is a dependency of the `kubernetes.core` collection and must be available on your local machine (via `pip`).

```sh
pip install kubernetes
# OR cd to the base of the repo and run
pip install -r requirements.txt
```

To install the collection:
```sh
ansible-galaxy collection install kubernetes.core
```

# Dependencies

There are no dependencies on other roles.

# Role Variables

## Main variables

Currently there are no configuration defaults for this role. Required variables are set dynamically at runtime.

## Output variables

The role generates the following variables:

- sc_list: a list of the storage classes defined in the cluster
- bound_pvcs: A dict containing details of all bound PVCs across all namespaces
- unbound_pvcs: A dict containing details of all PVCs that are not bound to a PV across all namespaces
- orphaned_pvcs: a list of PVCs that are not owned by a container
- orphaned_pvs: a list of PVs that do not have a corresponding PVC

A sample template is included that shows how to use these variables.  Passing the environment variable test_run (set to anything) to the role will cause it to generate an asciidoc output file __storage.adoc__ that uses the sample template for debugging and/or informational purposes.

# Example Playbook

Example:

```yaml
- name: Info and observations about storage objects in the cluster.
  hosts: localhost
  gather_facts: false
  roles:
    - storage
```
