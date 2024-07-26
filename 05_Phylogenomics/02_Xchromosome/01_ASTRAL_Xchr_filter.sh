#!/usr/bin/env bash
#SBATCH --job-name=astral
#SBATCH -c 1
#SBATCH --time 1-11:10:00
#SBATCH --mem-per-cpu 3G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout_Oct/astral_March2024_chrX_nodogsLadakj.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout_Oct/astral_March2024_chrX_nodogsLadakj.err

module load perl
module load vcftools

#X chromosome - all samples except dogs
VCF=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.recode.vcf.gz
REMOVE=/home/crq857/projects/Chapter2/files/July26_taxaremove_onlydogs_badwolves.txt
OUT=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/VCFs_July2024/chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs

vcftools --gzvcf ${VCF} --remove ${REMOVE} --recode --recode-INFO-all --out ${OUT}

#X chromosome -  no Pakistan, Ladakh, Tajikistan, West Asia, no dogs
VCF=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.recode.vcf.gz
REMOVE=/home/crq857/projects/Chapter2/files/ASTRAL_remove_admix.txt
OUT=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/VCFs_July2024/chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_noLadakhPakistanTajWestAsia

vcftools --gzvcf ${VCF} --remove ${REMOVE} --recode --recode-INFO-all --out ${OUT}

July26_taxaremove_onlydogs_badwolves.txt
