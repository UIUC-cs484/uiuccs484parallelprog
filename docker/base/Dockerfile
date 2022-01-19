FROM centos:7.9.2009
MAINTAINER <bjlunt2@illinois.edu>
LABEL maintainer="Bryan J. Lunt <bjlunt2@illinois.edu>"


#this important line disables ASLR, which while good for security, causes a problem for debugging.
#Unfortunately, it has no effect in docker.
#https://askubuntu.com/a/318476
RUN echo "kernel.randomize_va_space = 0" > /etc/sysctl.d/01-disable-aslr.conf


#
#Need Ansible (We use the ansible scripts to make sure the docer/Singularity
#               will alwasy track the VMFarm. Prevents duplicate configuration.)
# https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-ansible-on-centos-7
#
#
RUN yum update -y \
	&& yum install -y ansible \
&& yum clean all && rm -rf /var/cache/yum

WORKDIR /root/
ADD ./ansiblehosts /etc/ansible/hosts
ADD ./vmfarm/ /root/vmfarm/

##### Disable ASLR #####
# This has no effect on Docker, but is kept for completeness, to match the VMFarm setup.
# We _want_ this, if it were possible to have
#RUN ansible-playbook ./vmfarm/0a_disable_aslr.yml

#### Base System Packages
RUN ansible-playbook ./vmfarm/0_basepkgs.yml && yum clean all && rm -rf /var/cache/yum
RUN ansible-playbook ./vmfarm/0b_mpi.yml && yum clean all && rm -rf /var/cache/yum

### Dev Tools, Debug Tools, Useful Packages ####
RUN ansible-playbook ./vmfarm/1_devtools.yml
#splitting the add apart like this prevents rebuilding the earlier steps.
ENV PATH="/opt/rh/devtoolset-7/root/bin:/usr/lib64/mpich-3.2/bin:${PATH}"
RUN ansible-playbook ./vmfarm/cmake_installer.yml
RUN ansible-playbook ./vmfarm/gtest.yml && rm -rf /tmp/gtest
RUN ansible-playbook ./vmfarm/gbench.yml && rm -rf /tmp/gbench
RUN ansible-playbook ./vmfarm/charm.yml && rm -rf /tmp/charm*
#RUN ansible-playbook ./vmfarm/hpctoolkitall.yml && rm -rf /tmp/hpctoolkit*
RUN ansible-playbook ./vmfarm/boost.yml && yum clean all && rm -rf /var/cache/yum/

VOLUME ["/mnt/hostshared"]

USER root

ADD ./charm/charm-6.9.0 /etc/modulefiles/charm/6.9.0
ADD ./charm/z_charm.sh /etc/profile.d/z_charm.sh
