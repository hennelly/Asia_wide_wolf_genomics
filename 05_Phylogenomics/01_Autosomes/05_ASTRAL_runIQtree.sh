#!/usr/bin/env bash
#SBATCH --partition=cpuqueue
#SBATCH --qos=normal
#SBATCH --cpus-per-task=4
#SBATCH --mem=1G
#SBATCH --array=1-11
#SBATCH --output=/home/crq857/projects/Asianwolves_revision/slurmout/zAutosomes_astral_%A_%a.out
#SBATCH --error=/home/crq857/projects/Asianwolves_revision/slurmout/zAutosomes_astral_%A_%a.err
#SBATCH --time=02:00:00

PHY=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /projects/psg/people/crq857/Chapter2/05_Phylogenomics/ASTRAL_vcf_more/FINAL_list_autosomes_May202025.txt)
DIR=/projects/psg/people/crq857/Chapter2/05_Phylogenomics/ASTRAL_vcf_more

/home/crq857/bin/iqtree-1.6.12-Linux/bin/iqtree -s ${DIR}/${PHY} -bb 1000 -nt AUTO




