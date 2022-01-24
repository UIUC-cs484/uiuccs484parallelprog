#!/bin/sh

qsub -q cs -l walltime=1:00:00,nodes=1:ppn=16 -N cs484_singularity_interactive -I -x /projects/cs/cs484/run_singularity.sh ${*}
