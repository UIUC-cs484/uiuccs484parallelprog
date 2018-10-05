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

docker build -t cs484_base ${SCRIPT_DIR}/base
docker build -t cs484_test ${SCRIPT_DIR}/wgtest
docker build -t cs484_student ${SCRIPT_DIR}/student
