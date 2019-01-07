FROM cs484_base
MAINTAINER <bjlunt2@illinois.edu>
LABEL maintainer="Bryan J. Lunt <bjlunt2@illinois.edu>"

ENV TESTING_INSTALL_PREFIX /usr

USER root

RUN cd ${HOME} && curl -L -O https://github.com/google/googletest/archive/release-1.8.1.tar.gz && tar -zxvof release-1.8.1.tar.gz && \
	mkdir gtbuild && ( cd gtbuild ; cmake -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX:PATH=${TESTING_INSTALL_PREFIX} ../googletest-release-1.8.1 && make all install ) && cd ${HOME} && rm -rf release-1.8.1.tar.gz googletest-release-1.8.1 gtbuild

RUN cd ${HOME} && curl -L -O https://github.com/google/benchmark/archive/v1.4.1.tar.gz && tar -zxvof v1.4.1.tar.gz && \
	mkdir gbbuild && ( cd gbbuild ; cmake -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX:PATH=${TESTING_INSTALL_PREFIX} ../benchmark-1.4.1 && make all install ) && cd ${HOME} && rm -rf v1.4.1.tar.gz benchmark-1.4.1 gbbuild
#CMD ["echo","Hello world"]
