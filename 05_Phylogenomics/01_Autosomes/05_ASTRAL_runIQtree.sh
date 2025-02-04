#!/usr/bin/env bash
#SBATCH --job-name=iqtreeauto
#SBATCH -c 1
#SBATCH --time 1-11:40:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout/iqtree_fullgenome_run_%A_%a.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout/iqtree_fullgenome_run_%A_%a.err
#SBATCH --array=1-992%15

#conda activate /projects/mjolnir1/apps/conda/python-3.5.6
#cd /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics_Jan2025/Astral_Autosomes/VCFs_final
#ls  *phy > FINAL_list_autosomes_Feb3.txt

### no dogs, with NA
PHY=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics_Jan2025/Astral_Autosomes/VCFs_final/FINAL_list_autosomes_Feb3.txt)

/home/crq857/bin/iqtree-1.6.12-Linux/bin/iqtree -s  /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics_Jan2025/Astral_Autosomes/VCFs_final/${PHY} -bb 1000 -nt AUTO




