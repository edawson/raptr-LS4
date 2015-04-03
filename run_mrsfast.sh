#!/bin/bash
#--------------------------------
# A script for running the graphlab Netflix simulation
# using multithreading (not OpenMPI)
#----------------------------------
#SBATCH -J mrsfast_index
#SBATCH -o mrsfast_run.o%j
#SBATCH -e mrsfast_run.o%j
#SBATCH -p normal
#SBATCH -N 1
#SBATCH -n 16
#SBATCH -t 8:00:00
#SBATCH -A iPlant-Collabs

PATH=$PATH:"$WORK/raptr/mrsfast"
ref="$WORK/iPlant/apps/test_data/umd_3_1_Y_Mito.fa"

mrsfast --index ${ref}
