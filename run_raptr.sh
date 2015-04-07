#!/bin/bash
#--------------------------------
# A script for running the graphlab Netflix simulation
# using multithreading (not OpenMPI)
#----------------------------------
#SBATCH -J raptr_cluster
#SBATCH -o raptrClus_run.o%j
#SBATCH -e raptrClus_run.o%j
#SBATCH -p normal
#SBATCH -N 1
#SBATCH -n 16
#SBATCH -t 23:00:00
#SBATCH -A iPlant-Collabs

PATH=$PATH:"`pwd`/mrsfast"

module load jdk64


ref="`pwd`/umd_3_1_Y_Mito.fa"
data="$WORK/iPlant/apps/test_data/AN.156.BP.02/AN.156.BP.02.aln.bam"

date
## Output prefix is super important.
## temp file folder is as well.
#time java -jar RAPTR-SV.jar preprocess -i ${data} -o `pwd`/AN156.raptr -r ${ref} -d -t 15 -p `pwd`/temp/
java -jar RAPTR-SV.jar cluster -t 15 -p `pwd`/temp -d -s AN156.raptr.flat -o `pwd`/AN156.raptr.cluster 
date
