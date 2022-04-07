# ELK Stack Deployment - Project 1

The files in this repository were used to configure the network depicted below.
### Cloud Network Diagram

![Diagram](Diagrams/Network-Diagram-V3.png)

These files have been tested and used to generate a live ELK deployment on Azure. These can be used to either recreate the entire deployment as pictured above. Alternatively, select portions of the playbook files may be used to install only certain pieces of it, such as Ansible Container, Filebeat and Metricbeat.

- [install-elk.yml](Ansible/filebeat-playbook.yml.txt)
- [filebeat-playbook.yml](Ansible/filebeat-playbook.yml.txt)
- [metricbeat-playbook.yml](Ansible/metricbeat-playbook.yml.txt)

## Description
The purpose of this network is to expose a loadbalance and monitored instance of DVWA a Volunerable web application. Load balancer ensure that the application is available by checking its health probes. If Web1 server is down it automatically switch to Web2
ELK server monitor the vulnerable VMs for changes to the log data and system metrics.

The configuration details of each virtual machine is as below.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| JumpBox  | JumpBox      | 10.0.0.4 | Linux            |
| Web1     | Web Server 1 | 10.0.0.5 | Linux            |
| Web2     | Web Server 2 | 10.0.0.6 | Linux            |
| ELK Stack| ELK Stack    | 10.2.0.4 | Linux            |

## Access Policies
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

## Elk Configuration

Ansible is used to automate configuration of the ELK machine. No configuration is performed manually, which make it a fast deployment on multiple server. 

The playbook implements/performs the following tasks:
1. Configures virtual machine with Docker
2. Installs Docker.io and pip3
3. Downloads and configures ELK docker container
4. Activates ports 5601, 9200, and 5044
5. Increases virtual memory to a value of "262144"
6. Allows the docker sercice to be enabled upon boot

## Target Machines & Beats
This ELK server is configured to monitor the following virtual machines:
1. Web1 10.0.0.5
2. Web2 10.0.0.6

Following Beats are installed on these virtual machines:
1. Filebeat on port 9200
2. Metricbeat on port 5044

These Beats collect following information from each machine:
1. Filebeat monitors log files on specified machines such as log events, visitor traffic and send data to Kibana.
2. Metricbeat records metrics and statistical data which includes CPU and memory usage from the operating system and services that are running on the server.

## Using the Playbook
In order to use the playbook, need to have an Ansible container: 

SSH into the control node and follow the steps below:
- Copy the install_elk_yml file to your /etc/ansible directory.
- Update the host file to include the IP Addresses of your Web1, Web2, and ELK server as well as assign python3 as the interpreter.
- Run the playbook, and navigate to your ELK server to check that the installation worked as expected.


### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the Filebeat-configuration.yml file to the ELK VM.
- Update the hosts file to include webservers 10.0.1.7, 10.0.1.8, 10.0.1.9, 10.0.1.10
- Run the playbook, and navigate to Kibana to check that the installation worked as expected.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- First, copy install-elk.yml into /etc/ansible
- Update the hosts file located in /etc/ansible to include IPs 10.0.0.5 and 10.0.0.6 under [webservers] and 10.1.0.5 under [elk]. Be sure to include ansible_python_interpreter=/usr/bin/python3 after each IP entry
- Run the playbook with "ansible-playbook install-elk.yml"
- SSH into the ELK-VM and run "sudo docker ps" to ensure the elk container was properly installed and is running
- After ensuring the elk container is up and running, navigate to http://20.83.202.36:5601/app/kibana on your local PC to access Kibana

- The playbook is install-elk.yml and needs to be in /etc/ansible
- /etc/ansible/hosts within the Ansible control node needs to be updated with the correct IPs of the VMs as stated above. Within the playbook files, you specify the machines you want the playbook to run on after "hosts:". For Web-1 and Web-2, it would be "hosts: webservers" and for the ELK-VM, it would be "hosts: elk"
- Navigate to http://20.83.202.36:5601/app/kibana to confirm that the ELK server is running.

To run the playbooks, within your Ansible control node, run:
- ansible-playbook install-elk.yml
- ansible-playbook filebeat-playbook.yml
- ansible-playbook metricbeat-playbook.yml


SSH into the control node and follow the steps below:

Copy the filebeat-playbook.yml and metricbeat-playbook.ym file to the ~/etc/ansible directory.
Update the hosts file to include your machine's IP address. You will also update the playbook files in accordance with the hosts file to specify which machine to install each playbook on
Run the playbook, and navigate to the VM which ELK is deployed on to check that the installation worked as expected. You will also navigate to the following URL using the IP of which ELK is deployed, under port 5601: http://[your.ELK-VM.External.IP]:5601/app/kibana (set an inbound security rule on your network security group to allow access to port 5601 from your personal IP)
Step-by-Step Configuration
First, you will need to update the following configuration files to your specifications:

nano ansible.cfg
nano metricbeat-config.yml
nano filebeat-config.yml
You will then update the hosts file to include your private IP address for your specific machine

nano hosts
Then, run the pentest playbook to run your docker containers for Web-1 and Web-2 VMs

ansible-playbook pentest.yml
Run the filebeat and metricbeat playbooks so that both services are running on your ELK-VM

ansible-playbook filebeat-playbook.yml
ansible-playbook metricbeat-playbook.yml
Once the above commands are configured, SSH into your ELK-VM and run the following command to confirm the ELK container is running

sudo docker ps
After confirming that the ELK container is up and running, and setting your inbound security rule for port 5601 as mentioned above, navigate to the following url: http://[your.ELK-VM.External.IP]:5601/app/kibana

If configured correctly, the url should produce this screen:






Navigate to http://ELK-PublicIP:5601 to check that the Kibana installation. 