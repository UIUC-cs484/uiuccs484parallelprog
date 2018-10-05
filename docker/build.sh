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

BASE_VERSION="v0.3"
TEST_VERSION="v0.3"
STUD_VERSION="v0.3"

docker build -t cs484_base -t uiuccs484parallelprog/cs484_base:latest -t uiuccs484prallelprog/cs484_base:${BASE_VERSION}  ${SCRIPT_DIR}/base
docker build -t cs484_test -t uiuccs484parallelprog/cs484_test:latest -t uiuccs484prallelprog/cs484_base:${TEST_VERSION} ${SCRIPT_DIR}/wgtest
docker build -t cs484_student -t uiuccs484parallelprog/cs484_student:latest -t uiuccs484prallelprog/cs484_student:${STUD_VERSION} ${SCRIPT_DIR}/student

docker push uiuccs484parallelprog/cs484_base:${BASE_VERISON}
docker push uiuccs484parallelprog/cs484_test:${TEST_VERSION}
docker push uiuccs484parallelprog/cs484_student:${STUD_VERSION}

docker push uiuccs484parallelprog/cs484_base:latest
docker push uiuccs484parallelprog/cs484_test:latest
docker push uiuccs484parallelprog/cs484_student:latest

