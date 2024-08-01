#!/usr/bin/env bash
#SBATCH --job-name=ASTRAL
#SBATCH -c 1
#SBATCH --time 01:40:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Geneflow_Dogs/slurmout/iqtree_Xchr_run_%A_%a.out
#SBATCH -e /home/crq857/projects/Geneflow_Dogs/slurmout/iqtree_Xchr_run_%A_%a.err
#SBATCH --array=1-500%10

#conda activate /projects/mjolnir1/apps/conda/python-3.5.6
#cd /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_chrX_July262026_phy_July2024_nodogs_withNA_noEth
#ls  *phy > FINAL_listfileschrX.txt_phy_noEth.txt

PHY=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_chrX_July262026_phy_July2024_nodogs_withNA_noEth/FINAL_listfileschrX.txt_phy_noEth.txt)

/home/crq857/bin/iqtree-1.6.12-Linux/bin/iqtree -s  /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_chrX_July262026_phy_July2024_nodogs_withNA_noEth/${PHY} -bb 1000 -nt AUTO

### NO ADMIXED

#cd /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_chrX_July262026_phy_July2024_noadmix_noEth
#ls  *phy > FINAL_listfileschrX_noadmix.txt_phy_noEth.txt

PHY=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_chrX_July262026_phy_July2024_noadmix_noEth/FINAL_listfileschrX_noadmix.txt_phy_noEth.txt)

/home/crq857/bin/iqtree-1.6.12-Linux/bin/iqtree -s  /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_chrX_July262026_phy_July2024_noadmix_noEth/${PHY} -bb 1000 -nt AUTO





