#!/usr/bin/env bash
#SBATCH --job-name=gload
#SBATCH -c 1
#SBATCH --time 00:30:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/reproductivegenes/slurmout/extract.out
#SBATCH -e /home/crq857/projects/reproductivegenes/slurmout/extract.err

module load perl
module load vcftools 

SNPvcf=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_geneticload_WOLVES_ID_noheader.vcf
VCF=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_geneticload_ID.vcf
OUT=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_geneticload_ancetral

#create snplist
awk '{ print $3 }' ${SNPvcf} > /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/snp.list

SNPS=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/snp.list
OUTd=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Dhole
OUTa=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Andeanfox

#keep only snps in focal wolf pop
vcftools --vcf ${VCF} --snps ${SNPS} --recode --recode-INFO-all --out ${OUT}

#vcf for Dhole
vcftools --vcf ${OUT}.recode.vcf --indv Dhole_BerlinZoo --recode --recode-INFO-all --out ${OUTd}

#vcf for Andean fox 
vcftools --vcf ${OUT}.recode.vcf --indv AndeanFox --recode --recode-INFO-all --out ${OUTa}






