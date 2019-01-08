FROM centos:7.5.1804
MAINTAINER <bjlunt2@illinois.edu>
LABEL maintainer="Bryan J. Lunt <bjlunt2@illinois.edu>"

USER root




ADD ./singinstall.sh /root/

RUN yum update -y \
	&& yum install -y which squashfs-tools e2fsprogs \
	&& yum install -y docker gcc libarchive-devel make  \
	&& yum clean all && rm -rf /var/cache/yum

RUN bash /root/singinstall.sh

RUN yum install -y docker

#CMD ["echo","Hello world"]
