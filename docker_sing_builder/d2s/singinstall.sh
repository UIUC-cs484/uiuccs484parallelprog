#!/bin/sh

#needs libarchive-devel
#needs squashfs-tools

#https://github.com/hpcng/singularity/releases/download/v3.5.3/singularity-3.5.3.tar.gz


VER=3.5.3
curl -L -O https://github.com/hpcng/singularity/releases/download/v$VER/singularity-$VER.tar.gz
tar xvf singularity-$VER.tar.gz
pushd singularity-$VER
./configure --prefix=/usr/local --sysconfdir=/etc
make
make install
popd
rm -rf singularity-$VER singularity-$VER.tar.gz
