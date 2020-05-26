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

IMAGE_TO_CONVERT="uiuccs484parallelprog/cs484_student"

#Need the one from quay.io : quay.io/singularityware/docker2singularity
#https://quay.io/repository/singularity/docker2singularity
#
CONVERTER_IMAGE="singularityware/docker2singularity"


temp_directory=$( mktemp -d /tmp/tmp_singbuild.XXXXXXX )

docker run --privileged \
-v /var/run/docker.sock:/var/run/docker.sock \
-v ${temp_directory}:/tmp \
-v ${PWD}:/output \
--privileged -t --rm \
${CONVERTER_IMAGE} ${IMAGE_TO_CONVERT}
