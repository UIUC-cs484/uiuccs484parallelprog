FROM centos:7.5.1804
MAINTAINER <bjlunt2@illinois.edu>
LABEL maintainer="Bryan J. Lunt <bjlunt2@illinois.edu>"


#this important line disables ASLR, which while good for security, causes a problem for debugging.
#Unfortunately, it has no effect in docker.
#https://askubuntu.com/a/318476
RUN echo "kernel.randomize_va_space = 0" > /etc/sysctl.d/01-disable-aslr.conf

RUN yum update -y \
	&& yum install -y ansible \
&& yum clean all && rm -rf /var/cache/yum

WORKDIR /root/
ADD ./vmfarm/ /root/vmfarm/
ADD ./ansiblehosts /etc/ansible/hosts
RUN ansible-playbook ./vmfarm/basepkgs.yml
RUN ansible-playbook ./vmfarm/cmake_installer.yml
RUN ansible-playbook ./vmfarm/gtest.yml
RUN ansible-playbook ./vmfarm/gbench.yml
#RUN ansible-playbook ./vmfarm/hpctoolkitall.yml
RUN ansible-playbook ./vmfarm/charm.yml

VOLUME ["/mnt/hostshared"]

USER root

ADD ./charm/charm-6.9.0 /etc/modulefiles/charm/6.9.0
ADD ./charm/z_charm.sh /etc/profile.d/z_charm.sh
