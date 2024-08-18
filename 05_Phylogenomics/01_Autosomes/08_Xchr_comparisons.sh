#!/usr/bin/env bash
#SBATCH --job-name=astral
#SBATCH -c 1
#SBATCH --time 1-11:10:00
#SBATCH --mem-per-cpu 3G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout_Oct/astral_March2024_chrX_nodogsLadakj_withNAx3.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout_Oct/astral_March2024_chrX_nodogsLadakj_withNAx3.err

module load perl
module load vcftools

#Autosomes - no Pakistan, no SW Asia
FILE= /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_VCFs_July262024/July30_NO_ETHIOPIAN_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs.recode.vcf
REMOVE_noSWAsia=/home/crq857/projects/Chapter2/files/July26_taxaremove_onlydogs_badwolves_Pakistan_SWAsia.txt
OUTFILE_noSWAsia=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_VCFs_July262024/Xchr_NO_ETHIOPIAN_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_withNAwolves_noPakistan_noSWAsia_Auug17

vcftools --vcf ${FILE} --remove ${REMOVE_noSWAsia} --out ${OUTFILE_noSWAsia} --recode --keep-INFO-all

REMOVE_noPakand2cose=/home/crq857/projects/Chapter2/files/July26_taxaremove_onlydogs_badwolves_Pakistan_2closeSWAsia.txt
OUTFILE_noPakandclose=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_VCFs_July262024/ChrX_NO_ETHIOPIAN_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_withNAwolves_noPakistan_nocloseSW_Auug17

vcftools --vcf ${FILE} --remove ${REMOVE_noPakand2cose} --out ${OUTFILE_noPakandclose} --recode --keep-INFO-all

REMOVE_noIndia=/home/crq857/projects/Chapter2/files/July26_taxaremove_onlydogs_badwolves_Pakistan_Indian.txt
OUTFILE_noIndia=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_VCFs_July262024/ChrX_NO_ETHIOPIAN_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_withNAwolves_noPakistan_noIndia_Auug17

vcftools --vcf ${FILE} --remove ${REMOVE_noIndia} --out ${OUTFILE_noIndia} --recode --keep-INFO-all
