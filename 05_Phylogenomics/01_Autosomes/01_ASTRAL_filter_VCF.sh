#!/usr/bin/env bash
#SBATCH --job-name=astral
#SBATCH -c 1
#SBATCH --time 1-11:10:00
#SBATCH --mem-per-cpu 3G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout_Oct/astral_March2024_chrX_nodogsLadakj_withNAnoadmix.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout_Oct/astral_March2024_chrX_nodogsLadakj_withNAnoadmix.err

module load perl
module load vcftools

#Autosomes - all samples except dogs
VCF=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.recode.vcf.vcf.gz
REMOVE=/home/crq857/projects/Chapter2/files/July26_taxaremove_onlydogs_badwolves.txt
OUT=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_VCFs_July262024/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_withNAwolves

vcftools --gzvcf ${VCF} --remove ${REMOVE} --recode --recode-INFO-all --out ${OUT}

#Autosomes - no Pakistan, Ladakh, Tajikistan, West Asia, no dogs
VCFnoadmix=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.recode.vcf.vcf.gz
REMOVEnoadmix=/home/crq857/projects/Chapter2/files/July26_taxaremove_onlydogs_admixwolves.txt
OUTnoadmix=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_VCFs_July262024/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_noNAwolvesLadakhPakistanTajWestAsia

vcftools --gzvcf ${VCFnoadmix} --remove ${REMOVEnoadmix} --recode --recode-INFO-all --out ${OUTnoadmix}





