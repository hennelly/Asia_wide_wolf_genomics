#!/usr/bin/env bash
#SBATCH --job-name=haplotypecaller
#SBATCH -c 1
#SBATCH --time 6-12:00:00
#SBATCH --mem-per-cpu 15G
#SBATCH --array=1-19
#SBATCH -o /home/crq857/projects/Chapter2/slurmout/HaplotpeCaller_%A_%a.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout/HaplotpeCaller_%A_%a.err

TEMPDIR=/group/ctbrowngrp2/hennelly/hennelly/Chapter3/Alignment/tempdirAug
REF=/projects/mjolnir1/people/crq857/Chapter2/ref_lauren/canFam3_withY.fa

echo "My SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID
BAMDIR=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /home/crq857/projects/Chapter2/files/GATK_MW.txt | cut -f1)
BAM=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /home/crq857/projects/Chapter2/files/GATK_MW.txt | cut -f2)
NAME=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /home/crq857/projects/Chapter2/files/GATK_MW.txt | cut -f3)

# Conda activate /projects/mjolnir1/apps/conda/gatk4-4.2.5.0/

java -Xmx20g -jar /projects/mjolnir1/apps/conda/gatk4-4.2.5.0/share/gatk4-4.2.5.0-0/gatk-package-4.2.5.0-local.jar HaplotypeCaller  \
   -R ${REF} \
   -I ${BAMDIR}/${BAM} \
   -O /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/03_gvcf/${NAME}.g.vcf.gz \
   -ERC GVCF \
   --tmp-dir ${TEMPDIR}
