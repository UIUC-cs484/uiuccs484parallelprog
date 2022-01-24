#!/bin/sh

qsub -q cs -l walltime=1:00:00,nodes=1:ppn=4 -N cs484_interactive -I ${*}
