#!/usr/bin/env bash
#SBATCH --job-name=ASTRAL
#SBATCH -c 1
#SBATCH --time 11:40:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Geneflow_Dogs/slurmout/iqtree_fullgenome_run_%A_%a.out
#SBATCH -e /home/crq857/projects/Geneflow_Dogs/slurmout/iqtree_fullgenome_run_%A_%a.err
#SBATCH --array=1-1000%10

#conda activate /projects/mjolnir1/apps/conda/python-3.5.6
#cd /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/x_FINAL_July262024_phy_autosomes_noadmix_noEth
#ls  *phy > FINAL_list_autosomes_noadmix.txt_phy_noEth.txt

### no dogs, with NA
PHY=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/x_FINAL_July262024_phy_autosomes_nodogswithNA_noEth/FINAL_list_autosomes_nodogwithNA.txt_phy_noEth.txt)

/home/crq857/bin/iqtree-1.6.12-Linux/bin/iqtree -s  /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/x_FINAL_July262024_phy_autosomes_nodogswithNA_noEth/${PHY} -bb 1000 -nt AUTO

## no admix

#ls  *phy > FINAL_list_autosomes_noadmixtxt_phy.txt
PHY=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/x_FINAL_July262024_phy_autosomes_noadmix_noEth/FINAL_list_autosomes_noadmix.txt_phy_noEth.txt)

/home/crq857/bin/iqtree-1.6.12-Linux/bin/iqtree -s  /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/x_FINAL_July262024_phy_autosomes_noadmix_noEth/${PHY} -bb 1000 -nt AUTO



