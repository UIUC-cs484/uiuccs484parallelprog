FROM centos:7.5.1804
MAINTAINER <bjlunt2@illinois.edu>
LABEL maintainer="Bryan J. Lunt <bjlunt2@illinois.edu>"

USER root

ADD ./s_mpirun /usr/local/bin/
RUN chmod 555 /usr/local/bin/s_mpirun

RUN mkdir /scratch && chmod 776 /scratch \
	&& mkdir -p /var/spool/torque && chmod 766 /var/spool/torque \
	&& mkdir -p /projects && chmod 766 /projects
RUN useradd -m -s /bin/bash -U student


USER student
WORKDIR /home/student

#CMD ["echo","Hello world"]
