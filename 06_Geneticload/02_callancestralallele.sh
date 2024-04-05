#!/usr/bin/env bash
#SBATCH --job-name=gload
#SBATCH -c 1
#SBATCH --time 01:00:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/reproductivegenes/slurmout/extract.out
#SBATCH -e /home/crq857/projects/reproductivegenes/slurmout/extract.err

module load perl
module load vcftools 

VCF=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.recode.vcf.vcf
OUT=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Geneticload_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_maxmiss1_minD4
KEEP=/home/crq857/projects/Chapter2/scripts_geneticload/keep_geneticload.txt

vcftools --vcf ${VCF} --minD 4 --keep ${KEEP} --max-missing 1 --recode --recode-INFO-all --out ${OUT}

KEEPwolf=/home/crq857/projects/Chapter2/scripts_geneticload/keep_geneticloadw.txt
OUTw=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Geneticload_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_maxmiss1_minD4_onlywolf

vcftools --vcf ${OUT}.recode.vcf --keep ${KEEPwolf} --minDP 10 --maxDP 60 --mac 2 --non-ref-ac-any 1 --recode --recode-INFO-all --out ${OUTw}

#create snplist
awk '{ print $3 }' ${OUTw}.recode.vcf > /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/snp.list

#extract SNPs
SNPS=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/snp.list
OUTd=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Dhole
OUTa=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Andeanfox
OUTx=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Geneticload_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_maxmiss1_minD4_snpswolves
#keep only snps in focal wolf pop
vcftools --vcf ${OUT}.recode.vcf --snps ${SNPS} --recode --recode-INFO-all --out ${OUTx}

#vcf for Dhole
vcftools --vcf ${OUTx}.recode.vcf --indv Dhole_BerlinZoo --recode --recode-INFO-all --out ${OUTd}

#vcf for Andean fox 
vcftools --vcf ${OUTx}.recode.vcf --indv AndeanFox --recode --recode-INFO-all --out ${OUTa}













