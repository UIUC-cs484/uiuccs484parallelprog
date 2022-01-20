FROM cs484_base
MAINTAINER <bjlunt2@illinois.edu>
LABEL maintainer="Bryan J. Lunt <bjlunt2@illinois.edu>"

USER root

#ADD ./s_mpirun /usr/local/bin/
#RUN chmod 555 /usr/local/bin/s_mpirun

#
#We need these directories for when this image gets converted to Singularity
#Running on Campus Cluster, these will be mounted from the host system.
#
RUN mkdir /scratch && chmod 776 /scratch \
	&& mkdir -p /var/spool/torque && chmod 766 /var/spool/torque \
	&& mkdir -p /projects && chmod 766 /projects


RUN useradd -m -s /bin/bash -U student
USER student
WORKDIR /home/student

#CMD ["echo","Hello world"]
