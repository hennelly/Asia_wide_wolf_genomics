#!/usr/bin/env bash

#SBATCH --job-name=execute_snp_calling
#SBATCH --array=1-38%1
#SBATCH -c 1
#SBATCH --time 00:10:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout_fsc/fsc_GATK_Genotype_%A_%a.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout_fsc/fsc_GATK_Genotype_%A_%a.err

# Change NUMBER in line 4 to the total number of chromosomes in your organism (also the result of `wc -l < chromosome_lengths.txt`)

echo "My SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID
number=$(sed "${SLURM_ARRAY_TASK_ID}q;d"  /home/crq857/projects/Chapter3/files/chromosomelist_length.txt| cut -f1)

cd ${number}
sbatch ${number}.bcftools.sh

