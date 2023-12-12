# User Guide
This user guide is for consultants who want to run the health check. The playbook makes usage of the `oc` CLI and the Ansible module `k8sinfo` to run checks on the OpenShift cluster, and presents the status of various key components within the cluster. 

NOTE: 
- The health check can be run using Ansible or by using a container, the two options are shown below, but the containerised option is preferred.
- Examples of how the health check works are at the end of this file.

## Preferred Option: running the containerised check
### 1. Pull image
To start, login to quay.io and pull the latest version of the image:
```
podman pull quay.io/abrad3/automated_openshift_health_check:latest
```

### 2. Setup your environment
You need to make a group-writable directory for the container to output the PDF and configuration files, like so:
```
mkdir output
chmod +020 output
```

### 3. Initial run of container
Do an initial run of the container with:
```
podman run -e OCP_API_URL=EXAMPLE_URL -e OCP_TOKEN=EXAMPLE_TOKEN -e OUTPUT_VARS="true" -v ./OUTPUT_DIR:/home/output:Z -v ./OUTPUT_DIR:/home/settings:Z quay.io/abrad3/automated_openshift_health_check:latest
```
This will output a draft report and default configuration files under `OUTPUT_DIR`.

### 4. Review draft PDF and modify config files
Review the PDF draft report, and modify the configuration files. Note that if you don't provide all config files, the defaults will be used.

You will usually need to edit `configs.yml`, particularly the following variables:
````yaml
CUSTOMERNAME: <customer_name>
AUTHORNAME: <consultant_name>
EXECUTIVESUMMARY: ''
docstatus: draft
````

You can add recommendations to the different report sections using the `recommendations.yml` file, e.g.:
````yaml
ClUSTER_RECOMMENDATION: "An unsupported version of OpenShift is being used..."
````

**Optionally** edit: `comments.yml`. This file determines the comments that describe the state of each health check, which can be customised here.
````yaml
GLOBAL_OK_COMMENT: <comment> # example: "This is an OK comment."
GLOBAL_ERROR_COMMENT: <comment> # example: "This check has produced the following errors."
````

### 5. Re-run the container for final report
Once you have modified the config files, re-run the container. Mount the directory that contains your modified config files to `/home/settings`.
```
podman run -e OCP_API_URL=EXAMPLE_URL -e OCP_TOKEN=EXAMPLE_TOKEN -v ./OUTPUT_DIR:/home/output:Z -v SETTINGS_DIR:/home/settings:Z io/abrad3/automated_openshift_health_check:latest
```
The final report will be put under `OUTPUT_DIR`.

## Second Option: running the check locally with Ansible
### 1. Access

To run the heath check, you need access to the OpenShift Container Platform, with cluster-admin access (or a custom User with Cluster ReadOnly permissions).

### 2. Clone Repository
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

### 3. Install Prerequisites

- Install packages:

````
sudo dnf install ansible

sudo dnf install podman

sudo dnf install rubygem-asciidoctor

sudo dnf install rubygem-asciidoctor-pdf
````

- Install the required Python libraries:
````
pip install -r requirements.txt
````

- Install `oc` binary, by visiting the RedHat website (https://console.redhat.com/openshift/create). [ TODO: needs more instructions]

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
ansible-playbook generate-report.yml
````

### 6. Review PDF 
Review the generated PDF and edit as required.

### 7. Additional edits
Repeat steps 5-7 as needed.

## Examples of how the health check works
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
