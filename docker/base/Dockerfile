FROM centos:7.5.1804
MAINTAINER <bjlunt2@illinois.edu>
LABEL maintainer="Bryan J. Lunt <bjlunt2@illinois.edu>"

RUN yum update -y \
	&& yum install -y bzip2 bzip2-libs bzip2-devel \
	&& yum install -y which less more vim emacs git \
	&& yum install -y wget curl rsync \
	&& yum install -y gcc gcc-g++ gcc-gfortran \
	&& yum install -y binutils binutils-devel \
	&& yum install -y elfutils-libelf elfutils-libelf-devel \
	&& yum install -y libdwarf libdwarf-tools libdwarf-devel \
	&& yum install -y libunwind libunwind-devel \
	&& yum install -y gdb lldb \
	&& yum install -y m4 automake autoconf libtool libtool-ltdl libtool-ltdl-devel pkgconfig \
	&& yum install -y cmake \
	&& yum install -y papi papi-devel papi-static \
	&& yum install -y perf python-perf libpfm libpfm-devel libpfm-python libpfm-static \
	&& yum install -y mpich-3.2 mpich-3.2-devel mpich-3.2-autoload \
&& yum clean all && rm -rf /var/cache/yum

RUN git clone https://github.com/HPCToolkit/hpctoolkit-externals.git \
	&& pushd hpctoolkit-externals \
	&& ./configure --prefix=/opt/hpctoolkit/ \
	&& make && make check && make install && make clean
#CMD ["echo","Hello world"]
