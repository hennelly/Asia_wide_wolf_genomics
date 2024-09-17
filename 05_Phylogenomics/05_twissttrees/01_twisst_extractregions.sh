#!/usr/bin/env bash
#SBATCH --job-name=astral
#SBATCH -c 1
#SBATCH --time 1:10:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Geneflow_Dogs/slurmout/bedtoolsrandom.out
#SBATCH -e /home/crq857/projects/Geneflow_Dogs/slurmout/bedtoolsrandom.err

## Extract genomic regions that have a twisst value of over 0.3 for topology 73

VCF=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_VCFs_July262024/Autosomes_NO_ETHIOPIAN_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_withNAwolves.recode.vcf
BED=/projects/mjolnir1/people/crq857/Chapter2/twisstresults/bedfile.bed
OUTVCF=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_VCFs_July262024/Autosomes_NO_ETHIOPIAN_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_withNAwolves_twisst0.3

#Autosomes
module load bedtools

bedtools intersect -a ${VCF} -b ${BED} > ${OUTVCF}
