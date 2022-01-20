# syntax=docker/dockerfile:1
FROM centos:7.9.2009 AS cs484_build
MAINTAINER <bjlunt2@illinois.edu>
LABEL maintainer="Bryan J. Lunt <bjlunt2@illinois.edu>"

#this important line disables ASLR, which while good for security, causes a problem for debugging.
#Unfortunately, it has no effect in docker.
#https://askubuntu.com/a/318476
RUN echo "kernel.randomize_va_space = 0" > /etc/sysctl.d/01-disable-aslr.conf


#
#Need Ansible (We use the ansible scripts to make sure the docker/Singularity
#               will alwasy track the VMFarm. Prevents duplicate configuration.)
# https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-ansible-on-centos-7
#
# We have to run the two separate yum install commands because the first
#	sets up the repo to install ansible from
#
RUN yum update -y \
	&& yum install -y centos-release-ansible-29 \
	&& yum install -y ansible \
&& yum clean all && rm -rf /var/cache/yum

WORKDIR /root/
ADD ./ansiblehosts /etc/ansible/hosts
#ADD ./vmfarm/ /root/vmfarm/

##### Disable ASLR #####
# This has no effect on Docker, but is kept for completeness, to match the VMFarm setup.
# Note that we also tried this separately earlier in the Dockerfile.
# We _want_ this, if it were possible to have
#RUN ansible-playbook ./vmfarm/0a_disable_aslr.yml

#### Base System Packages
ADD ./vmfarm/0*.yml /root/vmfarm/
RUN ansible-playbook ./vmfarm/0_basepkgs.yml && yum clean all && rm -rf /var/cache/yum
RUN ansible-playbook ./vmfarm/0b_mpi.yml && yum clean all && rm -rf /var/cache/yum

### Dev Tools, Debug Tools, Useful Packages ###
ADD ./vmfarm/1*.yml /root/vmfarm/
RUN ansible-playbook ./vmfarm/1_devtools.yml

ADD ./vmfarm/ /root/vmfarm/
#splitting the add apart like this prevents rebuilding the earlier steps.
ENV PATH="/opt/rh/devtoolset-7/root/bin:/usr/lib64/mpich-3.2/bin:${PATH}"
RUN ansible-playbook ./vmfarm/cmake_installer.yml

RUN ansible-playbook ./vmfarm/boost.yml && yum clean all && rm -rf /var/cache/yum/
RUN ansible-playbook ./vmfarm/gtest.yml && rm -rf /tmp/gtest
RUN ansible-playbook ./vmfarm/gbench.yml && rm -rf /tmp/gbench

#RUN ansible-playbook ./vmfarm/hpctoolkitall.yml && rm -rf /tmp/hpctoolkit*

FROM cs484_base AS cs484_base

ARG CHARM_VERSION_ARG="6.9.0"
ENV CHARM_VERSION=${CHARM_VERSION_ARG}

RUN ansible-playbook ./vmfarm/charm.yml --extra-vars "charm_version=${CHARM_VERSION}" && rm -rf /tmp/charm*

VOLUME ["/mnt/hostshared"]

USER root

ADD ./charm/charm-6.9.0 /etc/modulefiles/charm/6.9.0
#ADD ./charm/charm-7.0.0 /etc/modulefiles/charm/7.0.0
ADD ./charm/z_charm.sh /etc/profile.d/z_charm.sh
