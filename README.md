# automated_openshift_health_check
## Name
Automated OpenShift Container Platform (OCP) Health Check

## Description
The project aims to develop a fully scripted and automated health check solution for the OpenShift Container Platform, interpret the health check results, generate a comprehensive automated report, and provide additional materials to enhance the overall consulting process.
The playbook calls the roles that perform checks on a cluster, in a read only capacity. The health check provides some recommendations based on the state of the system. A consultant can then provide further input where required. All of this information is captured in a nicely formatted PDF that is easy to read and clear to understand.
If all goes smoothly, this project can be used as a tool by consultants to reduce the time needed to conduct a health check, improve accuracy and quality of information, maintain consistency, and create a leave behind artifact to hand over to the customer.

This project was started by Canberra consultants in 2023.

## Visuals
TO DO [Depending on what you are making, it can be a good idea to include screenshots or even a video (you'll frequently see GIFs rather than actual videos). Tools like ttygif can help, but check out Asciinema for a more sophisticated method.] 

TODO - Example - a screenshot of the formatted output/link to an example pdf within the repository. 

## Usage
Please visit the [User Guide](user_guide.md) for using the repo and health check.

## Contributing
Please visit the [Contributing Guide](contributing_guide.md).

### Project Management
This project will be managed through GitLab long term.
- Issues are prioritised in issue boards. To locate issues, go the left hand side bar, click "Plan" and then "Issues" or "Issue Boards".
- The Wiki contains key project information.

### Wiki
The Wiki (locate by going to the left hand side bar, then click "Plan" and then "Wiki") contains important files and information about the project.

Wiki pages:
- Definition of Done: details about when to consider your work complete
- Issue Log: log of issues and details about them
- Statement of Work: details about the project
- Post Version 1 Launch Transition: post launch details and processes
- Project Management Practices: details about project management for this project
- Meeting Notes: record of meeting content

## Roadmap
- version 1 started: 28/08/2023
- version 1 MVP complete: 14/11/2023
- version 1.1 complete: 15/12/2023

## Project status
In progress - ready for use from 14/11/2023.

## Support
For support or feedback, please reach out to the below authors, join the Google Chat Space, or create an issue in GitLab.

Join the Google Chat Space: https://chat.google.com/room/AAAAXGJPqBM?cls=7

### Authors and acknowledgments
Authors:
- Abdullah Sikder asikder@redhat.com
- Anojni Skanthan askantha@redhat.com
- Apollo Bradshaw apollo@redhat.com
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