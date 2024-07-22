#!/usr/bin/env bash
#SBATCH --job-name=filterGATK
#SBATCH -c 1
#SBATCH --time 2-11:00:00
#SBATCH --mem-per-cpu 20G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout/fsc_filterGATK_%A_%a.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout/fsc_filterGATK_%A_%a.err
#SBATCH --array=1-39%10

CHR=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /home/crq857/projects/Chapter3/files/chromosomelist.txt | cut -f1)

## filter to keep only individuals I'm interested in with removing non-variant SNPs. Do this for each chromosome

KEEP=keep.txt

module load perl
module load vcftools

vcftools --gzvcf gatk_${CHR}.vcf.gz --keep ${KEEP} --non-ref-ac-any 1 --recode --recode-INFO-all --out gatk_fsc_${CHR}.vcf

## then combine

#for autosomes
cat <(grep "#" gatk_fsc_chr1.vcf.recode.vcf) <(for number in $(seq 1 1 38); do grep -v "#" gatk_fsc_chr${number}.vcf.recode.vcf; done) > Individuals_fsc_unfiltered.recode.vcf




Wolf_China_SRR20326486
Wolf_Kyrgyz179
Wolf__Kyrgyz180

