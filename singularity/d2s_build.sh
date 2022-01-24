#!/bin/sh

##
#Snippet from
#
#http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in
#
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#
#end snippet
##

OUTPUT_DIRECTORY=${PWD}
OUTPUT_IMAGE_NAME="cs484_student.simg"

BUILD_IMAGE="uiuccs484parallelprog/cs484_student"
#BUILD_IMAGE="alpine:latest"

#TODO: Get a proper temp directory or let the user specify
TMP_FOR_BUILD=/tmp/sbuild
mkdir -p ${TMP_FOR_BUILD}/tmpother
mkdir -p ${TMP_FOR_BUILD}/buildtmp
mkdir -p ${TMP_FOR_BUILD}/singcache


#docker run -v /var/run/docker.sock:/var/run/docker.sock \
#-v ${OUTPUT_DIRECTORY}:/output \
#-v ${TMP_FOR_BUILD}/buildtmp:/tmp/buildtmp -e SINGULARITY_TMPDIR=/tmp/buildtmp \
#-v ${TMP_FOR_BUILD}/singcache:/tmp/singcache -e SINGULARITY_CACHEDIR=/tmp/singcache \
#--privileged -t --rm \
#quay.io/singularity/docker2singularity \
#${BUILD_IMAGE}

#docker run -v /var/run/docker.sock:/var/run/docker.sock \
#-v ${OUTPUT_DIRECTORY}:/output \
#-v ${TMP_FOR_BUILD}:/tmp -e SINGULARITY_TMPDIR=/tmp/buildtmp \
#-v ${TMP_FOR_BUILD}/singcache:/tmp/singcache -e SINGULARITY_CACHEDIR=/tmp/singcache \
#-v ${TMP_FOR_BUILD}/tmpother:/tmp/tmpother -e TMP=/tmp/tmpother -e TEMP=/tmp/tmpother -e TEMPDIR=/tmp/tmpother \
#--privileged -t --rm \
#quay.io/singularity/docker2singularity \
#${BUILD_IMAGE}

docker run -v /var/run/docker.sock:/var/run/docker.sock \
-v ${OUTPUT_DIRECTORY}:/output \
-v ${TMP_FOR_BUILD}:/tmp -e SINGULARITY_TMPDIR=/tmp/buildtmp \
-v ${TMP_FOR_BUILD}/singcache:/tmp/singcache -e SINGULARITY_CACHEDIR=/tmp/singcache \
-v ${TMP_FOR_BUILD}/tmpother:/tmp/tmpother -e TMP=/tmp/tmpother -e TEMP=/tmp/tmpother -e TEMPDIR=/tmp/tmpother \
--privileged -t --rm \
--entrypoint /bin/bash -it \
quay.io/singularity/docker2singularity
#${BUILD_IMAGE}
