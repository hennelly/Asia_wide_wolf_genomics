#!/usr/bin/env bash
#SBATCH --job-name=astral
#SBATCH -c 1
#SBATCH --time 11:10:00
#SBATCH --mem-per-cpu 3G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout_Oct/astral_March2024_chrX.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout_Oct/astral_March2024_chrX.err

module load perl
module load vcftools

XCHR=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.recode.vcf
REMOVE=remove.txt
XOUT=/projects/mjolnir1/people/crq857/Chapter2/06_Datasets/Xchr_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl

vcftools --vcf ${XCHR} --remove ${REMOVE} --recode --recode-INFO-all --out ${XOUT}
