# alerts role

**Table of Contents**
- [alerts role](#alerts-role)
  - [Description](#description)
  - [Operating systems](#operating-systems)
  - [Local system access](#local-system-access)
- [Dependencies](#dependencies)
- [Role Variables](#role-variables)
  - [Main variables](#main-variables)
  - [Output variables](#output-variables)
- [Example Playbook](#example-playbook)

## Description

- This `role` looks into getting statuses of the monitoring stack that comes with the OpenShift cluster. There are a few alerts that comes pre-configured with the cluster. This `role` checks to see which alert has fired and how long is has been active. 
 
## Operating systems
This role will work on the following operating systems:

 * Red Hat
 * Fedora
 * MacOs (Sonoma 14.0) [Tested]
## Local system access

The role uses shell module to use `curl` commands for the health checks of the alerts. 

# Dependencies

There are no dependencies on other roles. However, this role relies on `curl` commands to fetch the alerts. 

# Role Variables
N/A
## Main variables

Currently there are no configuration defaults for this role. Required variables are set dynamically at runtime.

## Output variables

Variables that output information to be placed in the report are captured here.

* `alerts_firing`: Takes the Alerts that have fired, their namepsace, severity and active since and adds them dynamically to a table. 


# Example Playbook
```yaml
- name: Alerts that are firing. - Severity  TASK
  shell: |
      #!/bin/bash
      TOKEN=$(oc whoami -t)
      PROMETHEUS_URL=$(oc get route -n openshift-monitoring prometheus-k8s -o jsonpath="{.status.ingress[0].host}" )
      RULES=$(curl -sNk -H "Authorization: Bearer $TOKEN" https://$PROMETHEUS_URL/api/v1/rules  | jq -r --sort-keys '{ "data": [ .data.groups[].rules[] ] }')

      #echo "Recent Firing Alerts - Alert severity"
      echo ${RULES} | jq ".data[] | select(.state == \"firing\") | .alerts | sort_by(.activeAt)| .[] | (.labels.severity)" | column -s'|' -t | tr -d '"'
  args:
    executable: /bin/bash
  changed_when: false
  ignore_errors: true
  register: alerts_firing_severity 
```