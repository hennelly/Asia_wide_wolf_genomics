#!/usr/bin/env bash
#SBATCH --job-name=vcf2phy
#SBATCH -c 1
#SBATCH --time 01:40:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout/vcf2python_noadmix.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout/vcf2python_noadmix.err

# No admixed individuals 
VCF=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics_Jan2025/FINAL_VCFs_2025/chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_noLadakhPakistanTajWestAsia_Jan2025.recode.vcf
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics_Jan2025/FINAL_VCFs_2025/
FILE=chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_noLadakhPakistanTajWestAsia_Jan2025_phy

#run vcf2phy
python /projects/mjolnir1/people/crq857/Geneflow_Dogs/bin/vcf2phylip/vcf2phylip.py -i ${VCF} --output-folder ${OUTDIR} --output-prefix ${FILE} -o AndeanFox

# All individuals 
VCF=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics_Jan2025/FINAL_VCFs_2025/chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_Jan2025.recode.vcf
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics_Jan2025/FINAL_VCFs_2025/
FILE=chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_Jan2025_phy

#run vcf2phy
python /projects/mjolnir1/people/crq857/Geneflow_Dogs/bin/vcf2phylip/vcf2phylip.py -i ${VCF} --output-folder ${OUTDIR} --output-prefix ${FILE} -o AndeanFox

