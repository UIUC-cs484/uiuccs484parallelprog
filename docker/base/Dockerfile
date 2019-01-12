FROM centos:7.5.1804
MAINTAINER <bjlunt2@illinois.edu>
LABEL maintainer="Bryan J. Lunt <bjlunt2@illinois.edu>"


#this important line disables ASLR, which while good for security, causes a problem for debugging.
#Unfortunately, it has no effect in docker.
#https://askubuntu.com/a/318476
RUN echo "kernel.randomize_va_space = 0" > /etc/sysctl.d/01-disable-aslr.conf

RUN yum update-minimal -y \
	&& yum install -y ansible \
&& yum clean all && rm -rf /var/cache/yum

WORKDIR /root/
ADD ./ansiblehosts /etc/ansible/hosts
ADD ./vmfarm/basepkgs.yml /root/vmfarm/
RUN ansible-playbook ./vmfarm/basepkgs.yml && yum clean all && rm -rf /var/cache/yum
#splitting the add apart like this prevents rebuilding the earlier steps.
ADD ./vmfarm/ /root/vmfarm/
ENV PATH="/opt/rh/devtoolset-7/root/bin:/usr/lib64/mpich-3.2/bin:${PATH}"
RUN ansible-playbook ./vmfarm/cmake_installer.yml
RUN ansible-playbook ./vmfarm/gtest.yml && rm -rf /tmp/gtest
RUN ansible-playbook ./vmfarm/gbench.yml && rm -rf /tmp/gbench
RUN ansible-playbook ./vmfarm/charm.yml && rm -rf /tmp/charm*
RUN ansible-playbook ./vmfarm/hpctoolkitall.yml && rm -rf /tmp/hpctoolkit*

VOLUME ["/mnt/hostshared"]

USER root

ADD ./charm/charm-6.9.0 /etc/modulefiles/charm/6.9.0
ADD ./charm/z_charm.sh /etc/profile.d/z_charm.sh
