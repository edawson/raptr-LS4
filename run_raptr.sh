#!/bin/bash
#--------------------------------
# A script for running the graphlab Netflix simulation
# using multithreading (not OpenMPI)
#----------------------------------
#SBATCH -J raptr_prepocess
#SBATCH -o raptrPre_run.o%j
#SBATCH -e raptrPre_run.o%j
#SBATCH -p normal
#SBATCH -N 1
#SBATCH -n 16
#SBATCH -t 15:00:00
#SBATCH -A iPlant-Collabs

PATH=$PATH:"`pwd`/mrsfast"

module load jdk64


ref="`pwd`/umd_3_1_Y_Mito.fa"
data="$WORK/iPlant/apps/test_data/AN.156.BP.02/AN.156.BP.02.aln.bam"

date
time java -jar RAPTR-SV.jar preprocess -i ${data} -o `pwd`/AN156.raptr -r ${ref} -d -t 15 -p `pwd`/temp/
date
#java -jar -Xmx20g RAPTR-SV.jar cluster 
