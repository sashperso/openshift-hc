# User Guide
This user guide is for consultants who want to run the health check.

The playbook makes usage of the `oc` CLI and the Ansible module `k8sinfo` to run checks on the OpenShift cluster, and presents the status of various key components within the cluster. 

### 1. Access

To run the heath check, you need access to the OpenShift Container Platform, with cluster-admin access (or a custom User with Cluster ReadOnly permissions).

### 2. Install Prerequisites

Need to install  oc, ansible, podman, asciidoctor and the python libraries in requirements.txt. 

- Install packages:

````
sudo yum install ansible

sudo yum install podman

sudo yum install rubygem-asciidoctor
````

- Install the required Python libraries:
````
pip install -r requirements.txt
````

- Install `oc` binary, by visiting the RedHat website (https://console.redhat.com/openshift/create). [ TODO: needs more instructions]

### 3. Clone Repository
To start contributing and using, clone this repository by typing the following into your terminal:
```
cd <desired_location>

$ git clone https://gitlab.consulting.redhat.com/anz-consulting/openshift/automated_openshift_health_check.git

git branch -M <existing_desired_branch_name>
```
to switch to a new branch:
```
git branch -b <new_branch_name>
```

### 4. Edit Variable Files
**Need** to edit: `settings/configs.yml`
- `settings/configs.yml`: This file determines how the health-check playbook will run and adds project information.
````yaml
OC: <default_ocp_cli_location> # run `whereis oc` to get value
RESTART_THRESHOLD: 6
DEGRADED_MACHINE_COUNT: 1 # default value: 1
CUSTOMERNAME: <customer_name>
DATEFORMAT: "+%m-%d-%Y-%T"
AUTHORNAME: <consultant_name>
````

**Optionally** edit: `settings/comments.yml`
- `settings/comments.yml`: This file determines the comments that describe the state of each health check, which can be customised here.
````yaml
GLOBAL_OK_COMMENT: <comment> # example: "This is an OK comment."
GLOBAL_ERROR_COMMENT: <comment> # example: "This check has produced the following errors."
````
### 5. Run the Playbook

This playbook completes the health check and generates the report.

````
ansible-playbook ocp_hc_init.yml
````

### 6. Review PDF 
Review the generated PDF and edit as required.

### 7. Additional edits
Repeat steps 5-7 as needed.

### Examples
- Demonstrate a section of playbook using `oc` CLI as a means to get a healthcheck. 
```yaml
# get machine_config_pools from cluster
- name: Get machine config pools name
  ansible.builtin.shell: oc get mcp
  register: machine_config_pools_name
```

- Demonstrate a section of playbook using `ansible module - k8info`.
```yaml
- name: Get all storage classes
  kubernetes.core.k8s_info:
    api_version: v1
    kind: StorageClass
  register: sc_list
```

- Demonstrate the section in the playbook for generating PDF, and show that it is a seperate playbook and can be detached in case the customer does not have `acsiidoc`. 

The asciidoctor PDF generation is called in generate-report.yml (the asciidoctor conainer gets created in the bash script generate-pdf)
```yaml
- name: Generate the PDF file
  ansible.builtin.shell: |
    export CUSTOMERNAME={{ CUSTOMERNAME }}
    export DATEFORMAT={{ DATEFORMAT }}
    sh generate-pdf -f openshift_hc_report_demo.adoc --adoc
```
