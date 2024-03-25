#!/usr/bin/env bash
#SBATCH --job-name=astral
#SBATCH -c 1
#SBATCH --time 01:10:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout_Oct/astral_chrX_extract_%A_%a.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout_Oct/astral_chrX_extract_%A_%a.err
#SBATCH --array=1-500%10

BEDFILE=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/bedfiles_chrX/listfiles.txt)
DIR=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/input_chrX_March2024
VCF=/projects/mjolnir1/people/crq857/Chapter2/06_Datasets/Xchr_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl.recode.vcf

module load bedtools

bedtools intersect -a ${VCF} -b /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/bedfiles_chrX/${BEDFILE} > ${DIR}/ChrX_allwolves_March2024_chrX_${BEDFILE}.vcf
