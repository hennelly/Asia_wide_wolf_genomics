#!/usr/bin/env bash
#SBATCH --job-name=iqtree
#SBATCH -c 1
#SBATCH --time 11:40:00
#SBATCH --mem-per-cpu 10G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout/iqtree_Xchr_admix.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout/iqtree_Xchr_admix.err

#All individuals
PHY=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics_Jan2025/FINAL_VCFs_2025/chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_Jan2025_phy.min4.phy

/home/crq857/bin/iqtree-1.6.12-Linux/bin/iqtree -s ${PHY} -bb 1000 -nt AUTO


chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_Jan2025_phy.min4.phy

### NO ADMIXED

PHY=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics_Jan2025/FINAL_VCFs_2025/chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_noLadakhPakistanTajWestAsia_Jan2025_phy.min4.phy

/home/crq857/bin/iqtree-1.6.12-Linux/bin/iqtree -s ${PHY} -bb 1000 -nt AUTO






