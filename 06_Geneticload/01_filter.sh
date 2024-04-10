#!/usr/bin/env bash
#SBATCH --job-name=gload
#SBATCH -c 1
#SBATCH --time 01:00:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/reproductivegenes/slurmout/extract.out
#SBATCH -e /home/crq857/projects/reproductivegenes/slurmout/extract.err

module load perl
module load vcftools 

#first I filter all samples (only focal gray wolves and two outgroups) for minDP of 4 and no missing data
# Then I filter for only my focal wolves with a strigent filter (minDP 10; maxDP 60) since all samples are over 20x. 
# Then I grab coordinate from this snplist 
# Then I extract the exact snps found in the focal wolf dataset from the Andean fox and Dhole samples

VCF=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.recode.vcf.vcf
OUT=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Geneticload_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_maxmiss1_minD4
KEEP=/home/crq857/projects/Chapter2/scripts_geneticload/keep_geneticload.txt

vcftools --vcf ${VCF} --minDP 4 --keep ${KEEP} --max-missing 1 --recode --recode-INFO-all --out ${OUT}

KEEPwolf=/home/crq857/projects/Chapter2/scripts_geneticload/keep_geneticloadw.txt
OUTw=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Geneticload_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_maxmiss1_minD4_onlywolf_Apr10

vcftools --vcf ${OUT}.recode.vcf --keep ${KEEPwolf} --max-missing 1 --minDP 10 --maxDP 60 --mac 2 --non-ref-ac-any 1 --recode --recode-INFO-all --out ${OUTw}

#Add snp id
module load perl
module load gsl/2.5
module load bcftools
SNPLIST=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Geneticload_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_maxmiss1_minD4_onlywolf_Apr10.recode.vcf 
OUT2=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Geneticload_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_maxmiss1_minD4_onlywolf_Apr10_id.vcf 
VCF=/projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/Focalwolves_geneticload.vcf
VCFOUT=/projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/Focalwolves_geneticload_ID.vcf

bcftools annotate --set-id '%CHROM\_%POS' ${VCF} -o ${OUT2}

#create snplist
OUT2=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Geneticload_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_maxmiss1_minD4_onlywolf_Apr10_id.vcf 
VCF=/projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/Focalwolves_geneticload.vcf
awk '{ print $3 }' ${OUT2}.vcf > /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/snp.list

#extract SNPs
SNPS=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/snp.list
OUTd=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Dhole
OUTa=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Andeanfox
OUTx=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Geneticload_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_maxmiss1_minD4_snpswolves
#keep only snps in focal wolf pop
vcftools --vcf ${OUT}.recode.vcf --snps ${SNPS} --recode --recode-INFO-all --out ${OUTx}

Wolves to include: 

Indianwolf_SRR13985171
Indianwolf_BH123
Wolf_Tibetan_CAN32
Wolf_Tibetan_CAN9A
Wolf_GeneralIran
Wolf_Iran_Hajjiabad
Wolf_Iran_Zanjan
Wolf_Iran_Tehran_SRR20326410
Wolf_Iran_Tehran_SRR20326408
Wolf_Xinjiang_CAN24
Wolf_Xinjiang_CAN30
Wolf_Tajikistan_SRR20326384
China_SRR20326484_Xinjiang
Wolf_Mexican1
