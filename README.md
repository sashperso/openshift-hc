# automated_openshift_health_check
## Name
Automated OpenShift Container Platform (OCP) Health Check

## Description
This project aims to automate an OpenShift Container Platform (OCP) health check, using Ansible.
The playbook calls the roles that perform checks on a cluster, in a read only capacity. The health check provides some recommendations based on the state of the system. A consultant can then provide further input where required. All of this information is captured in a nicely formatted PDF that is easy to read and clear to understand.
If all goes smoothly, this project can be used as a tool by consultants to reduce the time needed to conduct a health check, improve accuracy and quality of information, maintain consistency, and create a leave behind artifact to hand over to the customer.

## Visuals
TO DO [Depending on what you are making, it can be a good idea to include screenshots or even a video (you'll frequently see GIFs rather than actual videos). Tools like ttygif can help, but check out Asciinema for a more sophisticated method.]

## Usage
TO DO [Use examples liberally, and show the expected output if you can. It's helpful to have inline the smallest example of usage that you can demonstrate, while providing links to more sophisticated examples if they are too long to reasonably include in the README.]

## Contributing
Open to contributions, please contact Abdullah (asikder@redhat.com) or Elise (elise@redhat.com) before contributing.

## Cloning this repository
To start contributing, clone this repository by typing the following into your terminal:

cd <desired_location>

$ git clone https://gitlab.consulting.redhat.com/anz-consulting/openshift/automated_openshift_health_check.git

git branch -M main

## Roadmap
- project started 28/08/2023
- version 1 MVP
- perform comprehensive testing
- begin version 2

## Project status
In progress - not ready for use.

## Support
Please reach out to the below authors for support, or create an issue in GitLab.

## Authors and acknowledgment
Authors:
- Abdullah Sikder asikder@redhat.com
- Anojni Skanthan askantha@redhat.com
- Bryce Chambers bchamber@redhat.com
- Craig Scott crscott@redhat.com
- Elise Elkerton elise@redhat.com
- Jonathon Bishop bchamber@redhat.com

Similar projects that were referenced:
- RHEL health check, authored by Rodger Li: https://gitlab.consulting.redhat.com/automated_health_check_crew/rhel/-/tree/main/
- Satellite health check, authored by Sasha Personeni: https://gitlab.consulting.redhat.com/anz-consulting/satellite/automated_satellite_health_check
- OCP health check script, authored by Vincent Lours: https://github.com/vlours/mg_cluster_status

## License
TO DO [For open source projects, say how it is licensed.]