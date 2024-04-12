#!/usr/bin/env bash
#SBATCH --job-name=gload
#SBATCH -c 1
#SBATCH --time 00:10:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout_fsc/fsc_GATK_Genotype_4.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout_fsc/fsc_GATK_Genotype_4.err

grep "LOW" /projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/Focalwolves_geneticload_nomissing_anc.vcf >  /projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/loadh.txt
grep "MODERATE" /projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/Focalwolves_geneticload_nomissing_anc.vcf >  /projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/loadm.txt
grep "HIGH" /projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/Focalwolves_geneticload_nomissing_anc.vcf >  /projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/loadl.txt
grep China_SRR20326484_Xinjiang /projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/Focalwolves_geneticload_nomissing_anc.vcf > header.txt

cat header loadh.txt loadm.txt loadl.txt > load_final.txt

from this point, I just grep'd the useful header line and any SNP with an annotation of low/moderate/high to a file called load.txt 
 and all the SNPs with ONLY modifier in the annotation to another .txt file (useful to randomly sample 'neutral' mutations) ###

R
install.packages("stringr", lib="/projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/")
library("stringr", lib.loc="/projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/")

install.packages("tidyverse", lib="/projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/")

 fdstatistic_gweu_gwme_agw_ahuntdog_maxmiss0.9_minQ20_Apr10_w100kb_s25kb.csv

scp -r crq857@mjolnirhead01fl.unicph.domain:/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_BCFtools_fsc/indDP/Rplots.pdf ~/Desktop
   /home/crq857/projects/Chapter2/slurmout_fsc/dp10_filtered_indDP_mean_min_max.txt
dp10_filtered_indDP_mean_min_max.txt
dp10_filtered_indDP_mean_min_max_missingdata.pdf
indDP Rplots.pdf

   
#!/bin/bash

#SBATCH -c 1
#SBATCH --mem-per-cpu 1G
#SBATCH --time=4:00:00
#SBATCH --array=1-15%20
#SBATCH --output=/projects/mjolnir1/people/qvw641/CottonTop/GeneticLoad/out/High.%A_%a.log
#SBATCH --job-name GL_High

module load perl
module load vcftools

dir="/projects/mjolnir1/people/qvw641/CottonTop/GeneticLoad/"
sample=$(sed -n "$SLURM_ARRAY_TASK_ID"p samples.txt | awk '{print $1}')
VCF=/projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/Focalwolves_geneticload_anc.vcf

total=$(vcftools --vcf ${VCF} --max-missing 1 --minDP 4 --indv $sample --stdout --recode --recode-INFO-all | awk '{print $10}' | grep "/1" | wc -l) # total cout of derived alleles
totalhom=$(vcftools --vcf ${VCF} --max-missing 1 --minDP 4 --indv $sample --stdout --recode --recode-INFO-all | awk '{print $10}' | grep "1/1"| wc -l) # total cout of HOM derived alleles
totalLoadHigh=$(vcftools --vcf ${VCF} --max-missing 1 --minDP 4 --indv $sample --stdout --recode --recode-INFO-all | grep HIGH | awk '{print $10}' | grep "/1" | wc -l) # total load HIGH
RealizedLoadHigh=$(vcftools --vcf ${VCF} --max-missing 1 --minDP 4 --indv $sample --stdout --recode --recode-INFO-all | grep HIGH | awk '{print $10}' | grep "1/1" | wc -l ) # realized load HIGH
totalLoadMod=$(vcftools --vcf ${VCF} --max-missing 1 --minDP 4 --indv $sample --stdout --recode --recode-INFO-all | grep MODERATE | awk '{print $10}' | grep "/1" | wc -l) # total load HIGH
RealizedLoadMod=$(vcftools --vcf ${VCF} --max-missing 1 --minDP 4 --indv $sample --stdout --recode --recode-INFO-all | grep MODERATE | awk '{print $10}' | grep "1/1" | wc -l ) # realized load MODERATE
synonymous=$(vcftools --vcf ${VCF} --max-missing 1 --minDP 4 --indv $sample --stdout --recode --recode-INFO-all | grep synonymous_variant | awk '{print $10}' | grep "/1" | wc -l ) # total synonymous
synonymousHOM=$(vcftools --vcf ${VCF} --max-missing 1 --minDP 4 --indv $sample --stdout --recode --recode-INFO-all | grep synonymous_variant | awk '{print $10}' | grep "1/1" | wc -l ) # HOM synonymous
echo $sample | awk -v t=$total -v th=$totalhom -v tL=$totalLoadHigh -v RL=$RealizedLoadHigh -v tM=$totalLoadMod -v rM=$RealizedLoadMod -v S=$synonymous -v SH=$synonymousHOM '{print $1"\t"t"\t"th"\t"tL"\t"RL"\t"tM"\t"rM"\t"S"\t"SH}' > ${dir}Counts/${sample}_countsLoad_dp8.txt
