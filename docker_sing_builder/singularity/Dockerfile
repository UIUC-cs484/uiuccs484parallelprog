FROM centos:7.5.1804
MAINTAINER <bjlunt2@illinois.edu>
LABEL maintainer="Bryan J. Lunt <bjlunt2@illinois.edu>"

USER root




ADD ./singinstall.sh /root/

RUN yum update -y \
	&& yum install -y which squashfs-tools e2fsprogs rsync \
	&& yum install -y docker gcc libarchive-devel make  \
	&& yum clean all && rm -rf /var/cache/yum

RUN bash /root/singinstall.sh

RUN yum install -y bsdtar && yum clean all && rm -rf /var/cache/yum

ADD ./tarwrapper.sh /usr/bin/tar
RUN chmod 555 /usr/bin/tar

ADD ./docker2singularity.sh /root/
RUN chmod 555 /root/docker2singularity.sh

#CMD ["echo","Hello world"]
