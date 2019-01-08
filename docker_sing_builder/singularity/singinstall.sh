#!/bin/sh

VER=2.5.2
curl -L -O https://github.com/singularityware/singularity/releases/download/$VER/singularity-$VER.tar.gz
tar xvf singularity-$VER.tar.gz
pushd singularity-$VER
./configure --prefix=/usr/local --sysconfdir=/etc
make
make install
popd
rm -rf singularity-$VER singularity-$VER.tar.gz
