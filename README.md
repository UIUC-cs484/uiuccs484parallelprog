# containers

Container declarations and other tools for building the containers for CS 484.

## VMFarm setup via ansible

These Ansible scripts assume CentOS_7.

Install Ansible on your fresh VM.

```bash
sudo yum install ansible
```

Depending on your setup, you may have a single VM, or you may have an administrative VM and several student VMs.

In either case, you will need to create a file named `/etc/ansible/hosts/ansiblehosts` on the admin machine (or single machine).

### Single VM

The host file should look like this:
```
[admin]
localhost ansible_connection=local
[all]
localhost ansible_connection=local
```

### Multiple VMs (admin + individual student VMs)

```
[admin]
localhost ansible_connection=local
[students]
studenthost1.anydomain.edu
studenthost2.anydomain.edu
studenthost3.anydomain.edu
```

If you have difficulty connecting to the student machines, please see https://docs.ansible.com/ansible/latest/user_guide/connection_details.html . You may need to setup an SSH key.

### Running Ansible scripts

SSH to the admin machine, clone this repo and run the following commands. (These take a long time, you should probably use a `screen` session for them.)

*Start a bash terminal as root:* `sudo bash` .

```bash

ansible-playbook ./ansible/vmfarm/basepkgs.yml
ansible-playbook ./ansible/vmfarm/cmake_installer.yml
ansible-playbook ./ansible/vmfarm/gtest.yml
ansible-playbook ./ansible/vmfarm/gbench.yml
ansible-playbook ./ansible/vmfarm/charm.yml
ansible-playbook ./ansible/vmfarm/hpctoolkitall.yml

rm -rf /tmp/gtest /tmp/gbench  /tmp/charm* /tmp/hpctoolkit*

yum clean all && rm -rf /var/cache/yum

```
