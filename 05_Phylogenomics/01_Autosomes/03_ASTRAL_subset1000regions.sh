#!/usr/bin/env bash
#SBATCH --job-name=astral
#SBATCH -c 1
#SBATCH --time 01:10:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout/astral_extract_%A_%a.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout/astral_extract_%A_%a.err
#SBATCH --array=10-1000%10

BEDFILE=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/bedfiles/listfiles.txt)

DIR=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics_Jan2025/Astral_Autosomes/VCFs
VCF=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics_Jan2025/FINAL_VCFs_2025/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_withNAwolves_Jan2025.recode.vcf

module load bedtools

# no dogs with NA wolves
bedtools intersect -a ${VCF} -b /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/bedfiles/${BEDFILE} > ${DIR}/Autosomes_nodogs_withNAwolves_Jan2025_${BEDFILE}.vcf





