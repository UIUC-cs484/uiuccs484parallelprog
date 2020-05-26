#!/bin/bash
#
# from stackoverflow.com : http://stackoverflow.com/a/14203146
#
# Use -gt 1 to consume two arguments per pass in the loop (e.g. each
# argument has a corresponding value to go with it).
# Use -gt 0 to consume one or more arguments per pass in the loop (e.g.
# some arguments don't have a corresponding value to go with it such
# as in the --default example).
# note: if this is set to -gt 0 the /etc/hosts part is not recognized ( may be a bug )
SAVEALL=""

while [[ $# -gt 0ls ]]
do
key="$1"

case $key in
    --ignore-failed-read)
    shift # past argument
    ;;
    *)
            # unknown option
    ;;
esac

SAVEALL="${SAVEALL} $1"
shift
done

set -- ${SAVEALL}

bsdtar ${*}

#TODO: Parse the output of bsdtar and make the exit 0 only conditional on failed reads.

exit 0
