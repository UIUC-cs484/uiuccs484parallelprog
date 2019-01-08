FROM centos:7.5.1804
MAINTAINER <bjlunt2@illinois.edu>
LABEL maintainer="Bryan J. Lunt <bjlunt2@illinois.edu>"

USER root


RUN yum update -y \
	&& yum install -y docker gcc libarchive-devel squashfs-tools make \
	&& yum clean all && rm -rf /var/cache/yum

ADD ./singinstall.sh /root/
RUN bash /root/singinstall.sh

RUN yum install -y docker

#CMD ["echo","Hello world"]
