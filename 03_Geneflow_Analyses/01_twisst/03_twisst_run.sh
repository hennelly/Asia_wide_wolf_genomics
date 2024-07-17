#!/usr/bin/env bash
#SBATCH --job-name=twisst
#SBATCH -c 1
#SBATCH --time 1-10:30:00
#SBATCH --mem-per-cpu 5G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout/twisst_run.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout/twisst_run.err
#SBATCH --array=1

CHR=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /home/crq857/projects/Geneflow_Dogs/files/chrlist_angsd.txt | cut -f1)

DIR=/projects/mjolnir1/people/crq857/Chapter2/03_GeneflowAnalyses/twisst/phyml
popfile=/home/crq857/projects/Chapter2/files/Twisst_popfile.txt
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/03_GeneflowAnalyses/twisst/output

module load python/2.7.18
module load numpy
module load phyml

python /projects/mjolnir1/people/crq857/bin/twisst/twisst.py -t ${DIR}/gatk_${CHR}_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final.phyml.trees.gz -w ${OUTDIR}/gatk_${CHR}_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_twisst -g Africanwolf -g Indianwolf -g WestAsia -g CentralAsia -g Europe -g Andeanfox --method complete --groupsFile ${popfile} 
