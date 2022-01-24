#!/bin/bash
#TODO: Finish this.

#This is run inside an interactive command for now.
#Someday it will be a nice script that sets up build locations and everything.

#The other installed version of singularity doesn't have `mksquashfs` and can't build images

module load singularity/3.2.0

srun -p cs --time=02:30:00  \
    --nodes=1 --ntasks-per-node=1 --cpus-per-task=20 \
    --export=SINGULARITY_TEMPDIR=${PWD}/stmp,SINGULARITY_CACHEDIR=${PWD}/stmp \
    singularity build ./foo.simg docker://uiuccs484parallelprog/cs484_student:latest
