#!/usr/bin/env bash
#SBATCH --job-name=ASTRAL
#SBATCH -c 1
#SBATCH --time 01:40:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Geneflow_Dogs/slurmout/iqtree_fullgenome_run_%A_%a.out
#SBATCH -e /home/crq857/projects/Geneflow_Dogs/slurmout/iqtree_fullgenome_run_%A_%a.err
#SBATCH --array=1-5000%10

#conda activate /projects/mjolnir1/apps/conda/python-3.5.6

PHY=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/phyfiles/filelist.txt)

/home/crq857/bin/iqtree-1.6.12-Linux/bin/iqtree -s  /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/phyfiles/${PHY} -bb 1000 -nt AUTO





