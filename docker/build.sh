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

BASE_VERSION="v1.5"
TEST_VERSION="v0.5"
CHARM_VERSION="v0.5"
STUD_VERSION="v0.5"

#Base machine, now with everything.
cp ${SCRIPT_DIR}/../ansible/vmfarm/* ${SCRIPT_DIR}/base/vmfarm/
docker build -t cs484_base ${SCRIPT_DIR}/base
rm ${SCRIPT_DIR}/base/vmfarm/*.yml

docker build -t cs484_student ${SCRIPT_DIR}/student

#docker build -t cs484_student -t uiuccs484parallelprog/cs484_student:latest -t uiuccs484parallelprog/cs484_student:${STUD_VERSION} ${SCRIPT_DIR}/student
