#!/usr/bin/env bash
#SBATCH --job-name=snpeff
#SBATCH -c 1
#SBATCH --time 12:00:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/reproductivegenes/slurmout/08_snpeff.out
#SBATCH -e /home/crq857/projects/reproductivegenes/slurmout/08_snpeff.err

#conda activate /projects/mjolnir1/apps/conda/snpeff-5.2

####### ANNOTATION ANALYSIS #########
VCF=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_geneticload.recode.vcf
OUT=/projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/Focalwolves_geneticload.vcf
CONFIG=/home/crq857/projects/reproductivegenes/scripts/snpEff_copy.config

java -Xmx8g -jar /projects/mjolnir1/apps/snpeff-5.1d/snpEff.jar -c ${CONFIG} -v CanFam3.1.99 ${VCF} > ${OUT}
