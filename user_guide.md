# User Guide

### 1. Install Prerequisites

To run the automated Health Check locally, ensure the following prerequisites are met: 

 - Access to the OpenShift Container Platform, with cluster-admin access (or a custom User with Cluster ReadOnly permissions).

 - CLI binaries available: oc, ansible, podman and asciidoctor. 

NOTE: Use `yum` to install `ansible` and `podman`. To get `oc` binary, visit the RedHat website (https://console.redhat.com/openshift/create). 

````
sudo yum install ansible

sudo yum install podman
````

### 2. Edit Variable Files
The playbook uses two configuration files to initiate how the health-check playbook will run.

- The variable files are loaded initially as `vars_file` in the playbook which holds key variables. 
````yaml
- name: Info for internal OCP components.
  hosts: localhost
  gather_facts: false
  vars_files:
    - ["./settings/configs.yml"]
    - ["./settings/comments.yml"]
````

- `configs.yml`: This file holds key variables that determines the way the health-check playbook will run. 
````yaml
RESTART_THRESHOLD: 6
DEGRADED_MACHINE_COUNT: 1 # default value: 1
DATEFORMAT: "+%m-%d-%Y-%T"
````
- `comments.yml`: This file holds the comments thats needed for describing the end state of each health checks. Depending on the size of the pdf these messages can be descriptive or truncated to short messages. 
````yaml
GLOBAL_OK_COMMENT: "This is an OK comment."
GLOBAL_ERROR_COMMENT: "This check has produced the following errors."
````
### 3. Run the Playbook

Run the playbook with Ansible.

This playbook completes the health check and generates the report.

````
ansible-playbook ocp_hc_init.yml
````

### 4. Review PDF 
Review the generated PDF and edit as required.

### 5. Additional edits
Repeat steps 3-5 as needed.