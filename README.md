# ELK Stack Deployment

Cloud Network Diagram
The files in this repository were used to configure the network depicted below.

![Diagram](Diagrams/Network-Diagram.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the playbook files may be used to install only certain pieces of it, such as Filebeat.

- [install-elk.yml](Ansible/filebeat-playbook.yml.txt)
- [filebeat-playbook.yml](Ansible/filebeat-playbook.yml.txt)
- [metricbeat-playbook.yml](Ansible/metricbeat-playbook.yml.txt)


The configuration details of each virtual machine is as below.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Jump Box   | 10.0.0.4 | Linux            |
| Web-1    | Web Server | 10.0.0.5 | Linux            |
| Web-2    | Web Server | 10.0.0.6 | Linux            |
| ELK Stack| ELK Stack  | 10.2.0.4 | Linux            |



ELK Stack Project HW 13
Date: April 06-04-2022
By Asad
