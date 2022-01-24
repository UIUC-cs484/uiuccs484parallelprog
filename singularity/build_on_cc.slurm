#!/bin/bash
#SBATCH --time=02:30:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=20
#SBATCH --exclusive
#SBATCH --job-name cs484-image-build
#SBATCH -p secondary

cd ${SLURM_SUBMIT_DIR-:${PWD}}
####### PARAMETERS #########

BUILD_FROM="docker://uiuccs484parallelprog/cs484_student:latest"

IMAGE_FILENAME="cs484_student.simg"

SCRATCH_DIR=${PWD}/stmp
mkdir -p ${SCRATCH_DIR}

##########



######### BUILD IT ########
#The other installed version of singularity doesn't have `mksquashfs` and can't build images
module load singularity/3.2.0

srun --nodes=1 --ntasks-per-node=1 --cpus-per-task=20 \
    --export=ALL,SINGULARITY_TEMPDIR=${SCRATCH_DIR},SINGULARITY_CACHEDIR=${SCRATCH_DIR} \
    singularity build ${IMAGE_FILENAME} ${BUILD_FROM} && \
echo "done" > ${IMAGE_FILENAME}.done
