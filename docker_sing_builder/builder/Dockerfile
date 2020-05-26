FROM centos:7.5.1804
MAINTAINER <bjlunt2@illinois.edu>
LABEL maintainer="Bryan J. Lunt <bjlunt2@illinois.edu>"

USER root
WORKDIR /root

RUN yum update -y \
	&& yum install -y wget which squashfs-tools e2fsprogs rsync \
	&& yum install -y gcc gcc-c++ libarchive-devel make openssl-devel libuuid-devel cryptsetup-devel \
	&& yum clean all && rm -rf /var/cache/yum

ADD ./goinstall.sh /root/
RUN bash /root/goinstall.sh
ENV PATH="/usr/local/go/bin:${PATH}"

ADD ./singinstall.sh /root/
RUN bash /root/singinstall.sh

#RUN yum install -y bsdtar && yum clean all && rm -rf /var/cache/yum

#ADD ./tarwrapper.sh /usr/bin/tar
#RUN chmod 555 /usr/bin/tar

#ADD ./docker2singularity.sh /root/
#RUN chmod 555 /root/docker2singularity.sh

#CMD ["echo","Hello world"]
