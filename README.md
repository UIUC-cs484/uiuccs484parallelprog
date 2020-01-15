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

## Docker container building

*You probably don't have to do this. Be absolutely certain beforehand.*

To begin with, you shouldn't need to do this unless you have altered the Ansible scripts that build something in the container.

If future generations of TAs decide to use a newer version of Charm or to radically change the environment for the MPs, it may be necessary to build new docker containers. Otherwise, please find working Docker containers at <https://hub.docker.com/u/uiuccs484parallelprog> assignments should be done using the `uiuccs484parallelprog/cs484_student` container.

### Building docker containers

You can build the docker containers by cloning this repo, then running

```bash
bash ./docker/build.sh
```
*STOP*
If you have altered the Ansible or Docker scripts, you should increment the version number for the docker image. The version number is in the script `./docker/build.sh` .

If you are logged in to docker hub and a member of the group `uiuccs484parallelprog`, you can push these images to make them available to the world.


## Singularity container building

*Hopefully you don't have to do this. If you update the docker container, then you may need to.*

TODO: Write this.
