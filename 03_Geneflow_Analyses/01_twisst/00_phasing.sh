#!/usr/bin/env bash
#SBATCH --job-name=shapeit
#SBATCH --array=1
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --time 3-12:00:00
#SBATCH --mem=10GB
#SBATCH -o /home/hennelly/Redwolf/slurmout/01_shapeit_chrXA.out
#SBATCH -e /home/hennelly/Redwolf/slurmout/01_shapeit_chrXA.err
#SBATCH -p high

VCF=/group/ctbrowngrp2/hennelly/hennelly/Redwolf/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.recode.vcf
gunzip ${VCF}.gz

GENEMAPDIR=/group/ctbrowngrp2/hennelly/hennelly/Pakistan_Graywolf_Genomics/RunsofHomozygosity/ROH_bcftools/ANALYSIS_DEC152021/dog_recomb/canFam3.1/maps

/group/ctbrowngrp2/hennelly/hennelly/Pakistan_Graywolf_Genomics/Selection/Genes/IGF1region/shapeit/shapeit.v2.904.3.10.0-693.11.6.el7.x86_64/bin/shapeit -M ${GENEMAPDIR}/mark4_cleaned_chrX.cf3.1.sortedal2_Apr040.txt --input-vcf ${VCF}  -O /group/ctbrowngrp2/hennelly/hennelly/Redwolf/files_May/Asianwolves_gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9 --window 0.5 -T 4

#######################
# Convert haps to vcf #
#######################

XCHR=/group/ctbrowngrp2/hennelly/hennelly/Redwolf/files_May/Asianwolves_gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9
OUTVCF=/group/ctbrowngrp2/hennelly/hennelly/Redwolf/files_May/Asianwolves_gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.vcf
/group/ctbrowngrp2/hennelly/hennelly/Pakistan_Graywolf_Genomics/Selection/Genes/IGF1region/shapeit/shapeit.v2.904.3.10.0-693.11.6.el7.x86_64/bin/shapeit -convert  --input-haps ${XCHR} --output-vcf ${OUTVCF}
