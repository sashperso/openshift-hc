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

## Ansible 2.10 and higher

With the release of Ansible 2.10, modules have been moved into collections.  With the exception of ansible.builtin modules, this means additonal collections must be installed in order to use modules such as seboolean (now ansible.posix.seboolean).  The following collections are required for this role: `kubernetes.core`.  

Installing the collections:  

```sh
ansible-galaxy collection install kubernetes.core
# OR cd to the base of the repo and run
ansible-galaxy collection install -r collections/requirements.yml
```

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

Variables that output information to be placed in the report are captured here.

* `etcd_test`: Reports whether the healthcheck completed successfully 

&ensp;&ensp;&ensp;&ensp;&ensp;`omth` if successful; `notdone` if failed.

* `etcd_status`: Output from `etcdctl status` in table format

```yaml
"+--------------------------+--------+------------+-------+",
"|         ENDPOINT         | HEALTH |    TOOK    | ERROR |",
"+--------------------------+--------+------------+-------+",
"| https://10.0.133.10:2379 |   true | 6.504891ms |       |",
"+--------------------------+--------+------------+-------+"
```

* `etcd_health`: Output from `etcdctl endpoint health` in table format

```yaml
"+--------------------------+------------------+---------+---------+-----------+------------+-----------+------------+--------------------+--------+",
"|         ENDPOINT         |        ID        | VERSION | DB SIZE | IS LEADER | IS LEARNER | RAFT TERM | RAFT INDEX | RAFT APPLIED INDEX | ERRORS |",
"+--------------------------+------------------+---------+---------+-----------+------------+-----------+------------+--------------------+--------+",
"| https://10.0.133.10:2379 | df5aca21b1b83b3b |   3.5.3 |   84 MB |      true |      false |         6 |      34240 |              34240 |        |",
"+--------------------------+------------------+---------+---------+-----------+------------+-----------+------------+--------------------+--------+"
```

# Example Playbook

Example:

```yaml
- name: Info for etcd inside OCP cluster.
  hosts: localhost
  gather_facts: false
  roles:
    - etcd
```
