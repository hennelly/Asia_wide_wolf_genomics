#!/usr/bin/env bash
#SBATCH --job-name=lowrec
#SBATCH -c 1
#SBATCH --time 03:30:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout/lowrecombination_removeadmixWestAsia.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout/lowrecombination_removeadmixWestAsia.err

XVCF=/projects/mjolnir1/people/crq857/Chapter2/06_Datasets/Xchr_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_lowrecombination.vcf.recode.vcf
VCF=/projects/mjolnir1/people/crq857/Chapter2/06_Datasets/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAL_lowrecombination.vcf.recode.vcf
REMOVE=/home/crq857/projects/Chapter2/files/removeadmix.txt
XOUTVCF=/projects/mjolnir1/people/crq857/Chapter2/06_Datasets/Xchr_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_lowrecombination_noPakistan
OUTVCF=/projects/mjolnir1/people/crq857/Chapter2/06_Datasets/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_lowrecombination_noPakistan

module load perl
module load vcftools

vcftools --vcf ${XVCF} --remove ${REMOVE} --out ${XOUTVCF} --recode --keep-INFO-all
vcftools --vcf ${VCF} --remove ${REMOVE} --out ${OUTVCF} --recode --keep-INFO-all


## NO PAKISTAN AND WEST ASIA 

XVCF=/projects/mjolnir1/people/crq857/Chapter2/06_Datasets/Xchr_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_lowrecombination.vcf.recode.vcf
VCF=/projects/mjolnir1/people/crq857/Chapter2/06_Datasets/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAL_lowrecombination.vcf.recode.vcf
REMOVE=/home/crq857/projects/Chapter2/files/removeadmix_WestAsia.txt
XOUTVCF=/projects/mjolnir1/people/crq857/Chapter2/06_Datasets/Xchr_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_lowrecombination_noPakistanWestAsia
OUTVCF=/projects/mjolnir1/people/crq857/Chapter2/06_Datasets/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_lowrecombination_noPakistanWestAsia

module load perl
module load vcftools

vcftools --vcf ${XVCF} --remove ${REMOVE} --out ${XOUTVCF} --recode --keep-INFO-all
vcftools --vcf ${VCF} --remove ${REMOVE} --out ${OUTVCF} --recode --keep-INFO-all




