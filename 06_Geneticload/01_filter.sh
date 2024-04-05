#!/usr/bin/env bash
#SBATCH --job-name=gload
#SBATCH -c 1
#SBATCH --time 1-1:00:00
#SBATCH --mem-per-cpu 5G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout/geneticloadfilter.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout/geneticloadfilter.err

module load perl
module load vcftools 

KEEP=/home/crq857/projects/Chapter2/scripts_geneticload/keep_geneticload.txt
VCF=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.recode.vcf.vcf
OUT=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_geneticload

vcftools --vcf ${VCF} --keep ${KEEP} --minDP 10 --maxDP 60 --mac 2 --non-ref-ac-any 1 --max-missing 0.9 --out ${OUT}


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
