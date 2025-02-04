#!/usr/bin/env bash
#SBATCH --job-name=lowrec
#SBATCH -c 1
#SBATCH --time 03:30:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout/lowrecombination_removeadmixWestAsia.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout/lowrecombination_removeadmixWestAsia.err

XOUTVCF=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics_Jan2025/FINAL_VCFs_2025/chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_Jan2025_lowrecombination_noPakLadakh.vcf
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics_Jan2025/FINAL_VCFs_2025/
FILE=chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_Jan2025_lowrecombination_noPakLadakh
python /projects/mjolnir1/people/crq857/Geneflow_Dogs/bin/vcf2phylip/vcf2phylip.py -i ${XOUTVCF}.recode.vcf --output-folder ${OUTDIR} --output-prefix ${FILE} -o AndeanFox

## NO PAKISTAN AND WEST ASIA 

VCF=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics_Jan2025/FINAL_VCFs_2025/chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_Jan2025_lowrecombination.vcf.recode.vcf
REMOVE=/home/crq857/projects/Chapter2/files/removeadmix_WestAsia.txt
XOUTVCFwest=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics_Jan2025/FINAL_VCFs_2025/chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_Jan2025_lowrecombination_noPakLadakhwestAsia.vcf

module load perl
module load vcftools

vcftools --vcf ${VCF} --remove ${REMOVE} --out ${XOUTVCFwest} --recode --keep-INFO-all
