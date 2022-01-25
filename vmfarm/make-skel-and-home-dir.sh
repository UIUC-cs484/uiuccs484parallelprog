#!/bin/bash

ROSTER_FILE=$1
#ADD BASHRC AND BASH PROFILE INTO VARS
DEST_DIRECTORY="/srv/home"
STUDENT_GROUP="csvm484-cls"


read -r -d '' BASH_PROF << EOFBP

# .bash_profile
# EWS .bash_profile Template
#
# Get the aliases and functions from users .bashrc file (do NOT remove)
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# This file is executed each time you start up a new BASH shell (/bin/bash),
# that is, whenever you create a new terminal session.
#
# If you want to modify an environment variable, for example, the search
# path, take into account the value that the variable already has.  For example
# if you wish to add the directory /local/apps1/cl to your search path,
# you would use
#
# export PATH=$PATH:/local/apps1/cl
#
# This merely appends the directory /local/apps1/cl to the already-existing
# search path.
#
# You can also create aliases for often-used commands.  For example, if you
# would prefer to type 'dir' instead of 'ls -FC', you could use
#
# alias dir="ls -FC"
#
# so that each time you typed 'dir', it would be as though you had typed
# 'ls -FC'
#


# User specific environment and startup programs go below
EOFBP



read -r -d '' BASH_RC << EOFBRC

# .bashrc
# EWS .bashrc Template
#
# Process the systems global .bashrc (DO NOT REMOVE)
# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# If you want to modify an environment variable, for example, the search
# path, take into account the value that the variable already has.  For example
# if you wish to add the directory /local/apps1/cl to your search path,
# you would use
#
# export PATH=$PATH:/local/apps1/cl
#
# This merely appends the directory /local/apps1/cl to the already-existing
# search path.
#
# You can also create aliases for often-used commands.  For example, if you
# would prefer to type 'dir' instead of 'ls -FC', you could use
#
# alias dir="ls -FC"
#
# so that each time you typed 'dir', it would be as though you had typed
# 'ls -FC'
#

# User specific aliases and functions go below

EOFBRC

#END LOAD BASHRC AND BASH PROFILE INTO VARS

for i in $(cat ${ROSTER_FILE})
do
  one_user_home="${DEST_DIRECTORY}/$i"
  if [ ! -d ${one_user_home} ]
  then
      echo "Making home directory for ${i}"
      #ensure this code isn't run accidentally.
      /usr/bin/mkdir ${one_user_home}
      /usr/bin/chmod 700 ${one_user_home}
      /bin/echo "$BASH_PROF" >> ${one_user_home}/.bash_profile
      /bin/echo "$BASH_RC" >> ${one_user_home}/.bashrc
      chown -Rv ${i}:${STUDENT_GROUP} ${one_user_home}
  fi
done
