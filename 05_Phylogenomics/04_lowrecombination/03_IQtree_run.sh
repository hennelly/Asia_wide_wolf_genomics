#!/usr/bin/env bash
#SBATCH --job-name=lworec
#SBATCH -c 1
#SBATCH --time 11:40:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout/iqtree_fullgenome.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout/iqtree_fullgenome.err

#conda activate /projects/mjolnir1/apps/conda/python-3.5.6

PHY=/projects/mjolnir1/people/crq857/Chapter2/06_Datasets/Xchr_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_lowrecombination.min4.phy

/home/crq857/bin/iqtree-1.6.12-Linux/bin/iqtree -s ${PHY} -bb 1000 -nt AUTO -m MFP

# you may need to download iqtree: http://www.iqtree.org/
# the -m flag is to decide which substitution model best fits the data. The MFP flag is telling iqtree to estimate which model is best
# the -bb flag is for bootstrapping. The 1000 tells iqtree to do 1000 bootstrap replicates