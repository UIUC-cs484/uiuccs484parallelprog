FROM centos:7.5.1804
MAINTAINER <bjlunt2@illinois.edu>
LABEL maintainer="Bryan J. Lunt <bjlunt2@illinois.edu>"


RUN yum update -y \
	&& yum install -y coreutils file patch \
	&& yum install -y bzip2 bzip2-libs bzip2-devel \
	&& yum install -y zip unzip \
	&& yum install -y which less more most vim emacs git \
	&& yum install -y wget curl libcurl libcurl-devel rsync \
	&& yum install -y gcc gcc-c++ gcc-gfortran \
	&& yum install -y make m4 automake autoconf libtool libtool-ltdl libtool-ltdl-devel pkgconfig \
	&& yum install -y gdb lldb \
	&& yum install -y valgrind \
	&& yum install -y binutils binutils-devel \
	&& yum install -y elfutils-libelf elfutils-libelf-devel \
	&& yum install -y libdwarf libdwarf-tools libdwarf-devel \
	&& yum install -y libunwind libunwind-devel \
	&& yum install -y papi papi-devel papi-static \
	&& yum install -y perf python-perf libpfm libpfm-devel libpfm-python libpfm-static \
	&& yum install -y mpich-3.2 mpich-3.2-devel mpich-3.2-autoload \
&& yum clean all && rm -rf /var/cache/yum

#A newer version of git is required
RUN yum update -y \
	&& yum install -y curl-devel expat-devel gettext-devel openssl-devel zlib-devel perl-ExtUtils-MakeMaker \
&& yum clean all && rm -rf /var/cache/yum \
&& cd ${HOME} && wget https://www.kernel.org/pub/software/scm/git/git-2.19.1.tar.gz && tar -zxvof git-2.19.1.tar.gz \
&& cd git-2.19.1 && ./configure --prefix=/usr && make install && cd .. && rm -rf git-2.19.1 git-2.19.1.tar.gz

#this important line disables ASLR, which while good for security, causes a problem for debugging.
#https://askubuntu.com/a/318476
RUN echo "kernel.randomize_va_space = 0" > /etc/sysctl.d/01-disable-aslr.conf


#### CMAKE ####
RUN cd ${HOME} && wget https://cmake.org/files/v3.12/cmake-3.12.1-Linux-x86_64.sh && bash cmake-3.12.1-Linux-x86_64.sh --prefix=/usr/local/ --skip-license && rm cmake-3.12.1-Linux-x86_64.sh


RUN git clone https://github.com/HPCToolkit/hpctoolkit-externals.git \
	&& pushd hpctoolkit-externals \
	&& bash ./configure --prefix=/opt/hpctoolkit/externals \
	&& make && make install && make clean && popd && rm -rf hpctoolkit-externals

RUN git clone https://github.com/HPCToolkit/libmonitor.git \
	&& pushd libmonitor \
	&& ./configure --prefix=/opt/hpctoolkit/ \
	&& make && make install && popd && rm -rf libmonitor

RUN git clone https://github.com/HPCToolkit/hpctoolkit \
	&& pushd hpctoolkit \
	&& MPICC=mpicc MPIF77=mpif77 ./configure --prefix=/opt/hpctoolkit --with-libmonitor=/opt/hpctoolkit --with-externals=/opt/hpctoolkit/externals --with-bzip=/usr --with-papi=/usr \
	&& make && make install && popd && rm -rf hpctoolkit


VOLUME ["/mnt/hostshared"]

