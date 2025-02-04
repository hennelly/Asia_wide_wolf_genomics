#!/usr/bin/env bash
#SBATCH --job-name=lworec
#SBATCH -c 1
#SBATCH --time 6-11:40:00
#SBATCH --mem-per-cpu 60G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout/iqtree_Auto_noadmix_chrX_WestAsia.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout/iqtree_Auto_noadmix_chrX_WestAsia.err

#conda activate /projects/mjolnir1/apps/conda/python-3.5.6

PHY=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics_Jan2025/FINAL_VCFs_2025/chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_Jan2025_lowrecombination_noPakLadakh.min4.phy

PHYx=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics_Jan2025/FINAL_VCFs_2025/chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_Jan2025_lowrecombination_noPakLadakhwestAsia.min4.phy

/home/crq857/bin/iqtree-1.6.12-Linux/bin/iqtree -s ${PHY} -bb 1000 -nt AUTO -m MFP
/home/crq857/bin/iqtree-1.6.12-Linux/bin/iqtree -s ${PHYx} -bb 1000 -nt AUTO -m MFP


