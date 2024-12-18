#!/usr/bin/env bash
#SBATCH --job-name=het
#SBATCH -c 1
#SBATCH --time 1-12:00:00
#SBATCH --mem-per-cpu 10G
#SBATCH --array=1-22%5
#SBATCH -o /home/crq857/projects/Chapter2/slurmout/het_Dec25_%A_%a.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout/het_Dec25_%A_%a.err

echo "My SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID
BAMDIR=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /home/crq857/projects/Chapter2/files/het_rerun_Dec19.txt | cut -f1)
BAM=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /home/crq857/projects/Chapter2/files/het_rerun_Dec19.txt | cut -f2)
ANC=/projects/mjolnir1/people/crq857/Chapter2/04_Demographichistory/ANGSD/AndeanFox_mapped2canfam31.fa.gz
REF=/projects/mjolnir1/people/crq857/Chapter2/ref/canFam31.fasta

module load angsd 
module load samtools 

#samtools faidx ${ANC}

angsd -i ${BAMDIR} -ref ${REF} -remove_bads 1 -only_proper_pairs 1 -C 50 -setMinDepth 4 -doCounts 1 -GL 1 -P 4 -minMapQ 20 -minQ 20 -anc ${ANC} -doSaf 1 -out /projects/mjolnir1/people/crq857/Chapter2/04_Demographichistory/ANGSD_Dec19/${BAM}_het
