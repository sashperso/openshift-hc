# certificates role

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

To successfully complete the role requires `openssl` to manipulate certificates & `jq` for processing the JSON output. Both must be available on your local machine.

```sh
dnf install openssl jq
```

Likewise, the python package `csvlook` is required to format the output into markdown tables.

```sh
pip install csvlook
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

* `all_certs`: Output of cluster certicates in markdown table format

* `ok_certs`: Output of OK cluster certicates in markdown table format

* `expired_certs`: Output of EXPIRED cluster certicates in markdown table format

```yaml
"| State |  Days | Name                                               | Expiry                   | Namespace                                        |",
"| ----- | ----- | -------------------------------------------------- | ------------------------ | ------------------------------------------------ |",
"| OK    |   537 | argocd-server-tls                                  | Mar 8 05:13:46 2025 GMT  | multicloud-gitops-group-one                      |",
"| OK    |   172 | group-one-gitops-ca                                | Mar 8 05:13:45 2024 GMT  | multicloud-gitops-group-one                      |",
"| OK    |   172 | group-one-gitops-tls                               | Mar 8 05:13:45 2024 GMT  | multicloud-gitops-group-one                      |",
"| OK    |   534 | config-policy-controller-metrics                   | Mar 5 12:25:05 2025 GMT  | open-cluster-management-agent-addon              |",
"| OK    |   534 | governance-policy-framework-metrics                | Mar 5 12:25:05 2025 GMT  | open-cluster-management-agent-addon              |",
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