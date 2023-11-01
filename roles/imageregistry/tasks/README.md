# imagregistry role

This role checks for images not supported by RedHat (and OpenShift), and the state of the management registry operator. 

**Table of Contents**
- [imagregistry role](#imageregistry-role)
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

The role uses shell module to use bash commands for looping through nodes and formatting text 

# Dependencies

There are no dependencies on other roles.

# Role Variables
N/A
## Main variables

Currently there are no configuration defaults for this role. Required variables are set dynamically at runtime.

## Output variables

Variables that output information to be placed in the report are captured here.

* `management_state_registry`: Get management state of image registry operator
* `external_images_node`: Editing tmp text file for unique images and formating
* `external_images_registry_namespace`: Gets external images not provided by Red Hat and OpenShift


# Example Playbook
```yaml
- name: Info for certificates inside OCP cluster.
  hosts: localhost
  gather_facts: false
  roles:
    - imageregistry
```