# User Guide
This user guide is for consultants who want to run the health check.

The playbook makes usage of `oc` cli **and** ansible module: `k8sinfo` to generate checks on the OpenShift cluster, and presents statuses of the target component within the cluster. 

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

### 3. Edit Variable Files
Need to edit: `settings/configs.yml`
- `settings/configs.yml`: This file determines how the health-check playbook will run and adds project information.
````yaml
OC: <default_ocp_cli_location> # run `whereis oc` to get value
RESTART_THRESHOLD: 6
DEGRADED_MACHINE_COUNT: 1 # default value: 1
CUSTOMERNAME: <customer_name>
DATEFORMAT: "+%m-%d-%Y-%T"
AUTHORNAME: <consultant_name>
````

Optionally edit: `settings/comments.yml`
- `settings/comments.yml`: This file determines the comments that describe the state of each health check, which can be customised here.
````yaml
GLOBAL_OK_COMMENT: <comment> # example: "This is an OK comment."
GLOBAL_ERROR_COMMENT: <comment> # example: "This check has produced the following errors."
````
### 4. Run the Playbook

Run the playbook with Ansible.

This playbook completes the health check and generates the report.

````
ansible-playbook ocp_hc_init.yml
````

### 5. Review PDF 
Review the generated PDF and edit as required.

### 6. Additional edits
Repeat steps 4-6 as needed.

### Examples
#### Generating a PDF
Click on the below links for PDF generation instructions:
* Generate the PDF locally [on linux](README-linux.md#generate-your-cer),
* Generate the PDF locally [on MacOS](README-MacOS.md#generate-your-cer).

- Demonstrate a section of playbook using `oc` cli as a means to get a healthcheck. 
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

- Demonstrate the section in the playbook for generating PDF, and show that it is a seperate playbook and can be detached incase the customer does not have `acsiidoc`. 

The asciidoctor pdf generation is called on the generate-report.yml (the asciidoctor conainer gets created in the bash script generate-pdf)
```yaml
- name: Generate the PDF file
  ansible.builtin.shell: |
    export CUSTOMERNAME={{ CUSTOMERNAME }}
    export DATEFORMAT={{ DATEFORMAT }}
    sh generate-pdf -f openshift_hc_report_demo.adoc --adoc
```