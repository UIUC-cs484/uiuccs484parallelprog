FROM cs484_test
MAINTAINER <bjlunt2@illinois.edu>
LABEL maintainer="Bryan J. Lunt <bjlunt2@illinois.edu>"

USER root


ADD ./charm-6.9.0 /etc/modulefiles/charm/6.9.0
ADD ./charm.sh /etc/profile.d/
WORKDIR /root
RUN wget http://charm.cs.illinois.edu/distrib/charm-6.9.0.tar.gz \
	&& pushd /opt && tar -zxvof /root/charm-6.9.0.tar.gz \
	&& rm /root/charm-6.9.0.tar.gz \
	&& pushd /opt/charm-6.9.0 \
	&& PATH=/usr/lib64/mpich-3.2/bin:${PATH} LD_LIBRARY_PATH=/usr/lib64/mpich-3.2/lib:${LD_LIBRARY_PATH} MPI_HOME=/usr/lib64/mpich-3.2 ./build AMPI mpi-linux-x86_64 mpicxx smp --with-production --enable-tracing --build-shared \
	&& echo "DONE"


#CMD ["echo","Hello world"]
