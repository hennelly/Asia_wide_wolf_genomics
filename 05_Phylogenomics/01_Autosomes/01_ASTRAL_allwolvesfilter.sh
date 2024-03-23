#!/usr/bin/env bash
#SBATCH --job-name=astral
#SBATCH -c 1
#SBATCH --time 11:10:00
#SBATCH --mem-per-cpu 3G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout_Oct/astral_March2024.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout_Oct/astral_March2024.err

module load perl
module load vcftools

VCF=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.recode.vcf.vcf
REMOVE=remove.txt
OUT=/projects/mjolnir1/people/crq857/Chapter2/06_Datasets/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl

vcftools --vcf ${VCF} --remove ${REMOVE} --recode --recode-INFO-all --out ${OUT}
