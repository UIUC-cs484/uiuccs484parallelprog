FROM cs484_charm
MAINTAINER <bjlunt2@illinois.edu>
LABEL maintainer="Bryan J. Lunt <bjlunt2@illinois.edu>"

USER root
RUN mkdir /scratch && chmod 776 /scratch
RUN mkdir -p /var/spool/torque && chmod 766 /var/spool/torque
RUN useradd -m -s /bin/bash -U student


USER student
WORKDIR /home/student

#CMD ["echo","Hello world"]
