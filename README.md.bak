# ELK Stack Deployment

The files in this repository were used to configure the network depicted below.
Cloud Network Diagram

![Diagram](Diagrams/Network-Diagram.png)

These files have been tested and used to generate a live ELK deployment on Azure. These can be used to either recreate the entire deployment as pictured above. Alternatively, select portions of the playbook files may be used to install only certain pieces of it, such as Ansible Container, Filebeat and Metricbeat.

- [install-elk.yml](Ansible/filebeat-playbook.yml.txt)
- [filebeat-playbook.yml](Ansible/filebeat-playbook.yml.txt)
- [metricbeat-playbook.yml](Ansible/metricbeat-playbook.yml.txt)

# Description
The purpose of this network is to expose a loadbalance and monitored instance of DVWA a Volunerable web application. Load balancer ensure that the application is available by checking its health probes. If Web1 server is down it automatically switch to Web2
ELK server monitor the vulnerable VMs for changes to the log data and system metrics.

The configuration details of each virtual machine is as below.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| JumpBox  | JumpBox      | 10.0.0.4 | Linux            |
| Web1     | Web Server 1 | 10.0.0.5 | Linux            |
| Web2     | Web Server 2 | 10.0.0.6 | Linux            |
| ELK Stack| ELK Stack    | 10.2.0.4 | Linux            |

# Access Policies
The virtual machine (VMs) on internal network VNET are not exposed to the public, Web1 and Web2 are behind firewall.
JumpBox VM machine only can accept connections from the Internet on port 22, is only allowed from dedicated client IP addresses.
All other VMs e.g. Web1, Web2 and ELK server can only be accessed by Ansible Docker Container at JumpBox.

A summary of the access policies in Network Security Group (NSG) at Azure

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| JumpBox   | Yes                 | Public Home IP      |
| ELK Stack | No                  | JumpBox 			|
| Web1      | No                  | JumpBox 			|
| Web2      | No                  | JumpBox 			|



ELK Stack Project HW 13
Date: April 06-04-2022
By Asad
