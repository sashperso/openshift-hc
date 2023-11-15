# automated_openshift_health_check
## Name
Automated OpenShift Container Platform (OCP) Health Check

## Description
This project aims to automate an OpenShift Container Platform (OCP) health check, using Ansible.
The playbook calls the roles that perform checks on a cluster, in a read only capacity. The health check provides some recommendations based on the state of the system. A consultant can then provide further input where required. All of this information is captured in a nicely formatted PDF that is easy to read and clear to understand.
If all goes smoothly, this project can be used as a tool by consultants to reduce the time needed to conduct a health check, improve accuracy and quality of information, maintain consistency, and create a leave behind artifact to hand over to the customer. 

## Visuals
TO DO [Depending on what you are making, it can be a good idea to include screenshots or even a video (you'll frequently see GIFs rather than actual videos). Tools like ttygif can help, but check out Asciinema for a more sophisticated method.] 

TODO - Example - a screenshot of the formatted output/link to an example pdf within the repository. 

## Usage
The playbook makes usage of `oc` cli **and** ansible module: `k8sinfo` to generate checks on the OpenShift cluster, and presents statuses of the target component within the cluster. 

### Prerequisites

To run the automated Health Check locally, ensure the following prerequisites are met: 

 - Access to the OpenShift Container Platform, with cluster-admin access (or a custom User with Cluster ReadOnly permissions).

 - CLI binaries available: oc, ansible, podman and asciidoctor. 

NOTE: Use `yum` to install `ansible` and `podman`. To get `oc` binary, visit the RedHat website (https://console.redhat.com/openshift/create). 

`sudo yum install ansible`

`sudo yum install podman`

### Examples

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

### Variable Files
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

### Generating a PDF
Click on the below links for PDF generation instructions:
* Generate the PDF locally [on linux](README-linux.md#generate-your-cer),
* Generate the PDF locally [on MacOS](README-MacOS.md#generate-your-cer).

## Contributing
Open to contributions, please contact Anojni (askantha@redhat.com) or Elise (elise@redhat.com) before contributing.

Feedback is much appreciated. Scroll down to the "Support" section for details on how to provide this.

### Project Management
This project will be managed through GitLab long term.
- Issues are prioritised in issue boards. To locate issues, go the left hand side bar, click "Plan" and then "Issues" or "Issue Boards".

### Wiki
The Wiki (locate by going to the left hand side bar, then click "Plan" and then "wiki") contains important files and information about the project.

## Cloning this repository
To start contributing, clone this repository by typing the following into your terminal:
```
cd <desired_location>

$ git clone https://gitlab.consulting.redhat.com/anz-consulting/openshift/automated_openshift_health_check.git

git branch -M <existing_desired_branch_name>
```
to switch to a new branch:
```
git branch -b <new_branch_name>
```

## Roadmap
- version 1 started: 28/08/2023
- version 1 MVP complete: 14/11/2023
- perform comprehensive testing:
- version 2 started:

## Project status
In progress - ready for use from 14/11/2023.

## Support
For support or feedback, please reach out to the below authors, join the Google Chat Space, or create an issue in GitLab.

Join the Google Chat Space: https://chat.google.com/room/AAAAXGJPqBM?cls=7

### Authors and acknowledgments
Authors:
- Abdullah Sikder asikder@redhat.com
- Anojni Skanthan askantha@redhat.com
- Bryce Chambers bchamber@redhat.com
- Craig Scott crscott@redhat.com
- Elise Elkerton elise@redhat.com
- Jonathon Bishop bchamber@redhat.com
- Patricio Alzamora palzamor@redhat.com

Similar projects that were referenced:
- RHEL health check, authored by Rodger Li: https://gitlab.consulting.redhat.com/automated_health_check_crew/rhel/-/tree/main/
- Satellite health check, authored by Sasha Personeni: https://gitlab.consulting.redhat.com/anz-consulting/satellite/automated_satellite_health_check
- OCP health check script, authored by Vincent Lours: https://github.com/vlours/mg_cluster_status
- A set of scripts to run basic checks on an OpenShift cluster: https://github.com/RHsyseng/openshift-checks
- A script that collects the latest Insights data from the Insights Operator and parses the data in an easily readable format. This is the same data that connected OpenShift Clusters send to Red Hat. https://github.com/cptmorgan-rh/ocp_insights

Acknowledgements: 
- Steven Sihaphone ssihapho@redhat.com
- Phuong Nguyen pnguyen@redhat.com
- Danielle Mathews dmathews@redhat.com
- Brenden Benesh bbenesh@redhat.com

## License
TO DO [For open source projects, say how it is licensed.]