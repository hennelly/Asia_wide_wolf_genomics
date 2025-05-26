#!/usr/bin/env bash
#SBATCH --partition=cpuqueue
#SBATCH --qos=normal
#SBATCH --cpus-per-task=4
#SBATCH --mem=1G
#SBATCH --array=1-1011%10
#SBATCH --output=/home/crq857/projects/Asianwolves_revision/slurmout/qAutosomes_astral_%A_%a.out
#SBATCH --error=/home/crq857/projects/Asianwolves_revision/slurmout/qAutosomes_astral_%A_%a.err
#SBATCH --time=01:00:00

BEDFILE=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /projects/psg/people/crq857/Chapter2/05_Phylogenomics/bedfiles/listfiles.txt)
DIR=/projects/psg/people/crq857/Chapter2/05_Phylogenomics/ASTRAL_vcf_more_again
REMOVE=/projects/psg/people/crq857/Chapter2/05_Phylogenomics/ASTRAL_vcf_more/removelist.txt

module load perl
module load vcftools

vcftools --vcf ${DIR}/REVISION_Autosomes_nodogs_withNAwolves_Jan2025_${BEDFILE}.vcf_headerfinal.vcf --remove ${REMOVE} --out ${DIR}/REVISION_Autosomes_nodogs_withNAwolves_Jan2025_${BEDFILE}.vcf_headerfinal_finalsamplelist.vcf --recode --keep-INFO-all



