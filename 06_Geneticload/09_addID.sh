#!/usr/bin/env bash
#SBATCH --job-name=gload
#SBATCH -c 1
#SBATCH --time 01:00:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/reproductivegenes/slurmout/extract.out
#SBATCH -e /home/crq857/projects/reproductivegenes/slurmout/extract.err

module load perl
module load gsl/2.5
module load bcftools

VCF=/projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/Focalwolves_geneticload.vcf
VCFOUT=/projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/Focalwolves_geneticload_ID.vcf

bcftools annotate --set-id '%CHROM\_%POS' ${VCF} -o ${VCFOUT}
