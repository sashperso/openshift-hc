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

To successfully complete the role requires `openssl` to manipulate certificates. It must be available on your local machine.

```sh
dnf install openssl
```

# Dependencies

There are no dependencies on other roles.

# Role Variables

## Main variables

Currently there are no configuration defaults for this role. Required variables are set dynamically at runtime.

## Output variables

Variables that output information to be placed in the report are captured here.

* `cert_test`: Reports whether the healthcheck completed successfully 

&ensp;&ensp;&ensp;&ensp;&ensp;`omth` if successful; `notdone` if failed.

* `cert_expiries`: Output of cluster certicates in table format

```yaml
"STATE   DAYS    NAME                                                        EXPIRY                    NAMESPACE                                                   ",
"-----   ----    ----                                                        ------                    ---------                                                   ",
"OK      729     openshift-apiserver-operator-serving-cert                   Sep 10 02:50:50 2025 GMT  openshift-apiserver-operator                                ",
"OK      3649    etcd-client                                                 Sep  8 02:28:38 2033 GMT  openshift-apiserver                                         ",
"OK      729     serving-cert                                                Sep 10 02:50:55 2025 GMT  openshift-apiserver                                         ",
"OK      729     serving-cert                                                Sep 10 02:50:50 2025 GMT  openshift-authentication-operator                           ",
"OK      729     v4-0-config-system-serving-cert                             Sep 10 02:50:56 2025 GMT  openshift-authentication                                    ",
```

# Example Playbook

Example:

```yaml
- name: Info for certificates inside OCP cluster.
  hosts: localhost
  gather_facts: false
  roles:
    - certificates
```
