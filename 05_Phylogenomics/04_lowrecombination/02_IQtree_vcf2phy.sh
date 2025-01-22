#!/usr/bin/env bash
#SBATCH --job-name=iqtree
#SBATCH -c 1
#SBATCH --time 11:40:00
#SBATCH --mem-per-cpu 10G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout/lowrecombination_vcf2phy_noadmix_auto.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout/lowrecombination_vcf2phy_noadmix_auto.err

#conda activate /projects/mjolnir1/apps/conda/python-3.5.6 #this may differ for your cluster. The vcf2phylip needs a specific python version

#Xchromosome
VCF=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics_Jan2025/FINAL_VCFs_2025/chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_Jan2025_lowrecombination.vcf.recode.vcf 
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics_Jan2025/FINAL_VCFs_2025/

python /projects/mjolnir1/people/crq857/Geneflow_Dogs/bin/vcf2phylip/vcf2phylip.py -i ${VCF} --output-folder ${OUTDIR} --output-prefix gatk_chrX_lowrecombination_Jan2025 -o AndeanFox





