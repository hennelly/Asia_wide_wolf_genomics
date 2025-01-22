#!/usr/bin/env bash
#SBATCH --job-name=astral
#SBATCH -c 1
#SBATCH --time 1-11:10:00
#SBATCH --mem-per-cpu 3G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout/astral_xchr_noadmix_Jan22_2025_noadmix.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout/astral_xchr_noadmix_Jan22_2025_noadmix.err

module load perl
module load vcftools

#X chromosome - all samples except dogs
VCF=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_VCFs_July262024/July26chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs.recode.vcf
REMOVE=/home/crq857/projects/Chapter2/files/July26_taxaremove_onlydogs_badwolves.txt
OUT=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics_Jan2025/FINAL_VCFs_2025/chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_Jan2025

vcftools --vcf ${VCF} --remove ${REMOVE} --recode --recode-INFO-all --out ${OUT}

#X chromosome -  no Pakistan, Ladakh, Tajikistan, West Asia, no dogs, no NA wolves
VCF=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_VCFs_July262024/July26chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_noLadakhPakistanTajWestAsia.recode.vcf
REMOVE=/home/crq857/projects/Chapter2/files/July26_taxaremove_onlydogs_admixwolves.txt
OUT=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics_Jan2025/FINAL_VCFs_2025/chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_noLadakhPakistanTajWestAsia_Jan2025

vcftools --vcf ${VCF} --remove ${REMOVE} --recode --recode-INFO-all --out ${OUT}
