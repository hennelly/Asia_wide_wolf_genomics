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

python /projects/mjolnir1/people/crq857/bin/twisst/twisst.py -t ${DIR}/gatk_${CHR}_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final.phyml.trees.gz -w ${OUTDIR}/gatk_${CHR}_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_twisst -g Africanwolf -g Indianwolf -g WestAsia -g CentralAsia -g Europe  --outgroup Andeanfox --method complete --groupsFile ${popfile} 


Twisst_popfile.txt
### RUN ON FARM 

#!/usr/bin/env bash
#SBATCH --job-name=twisst
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --time 3-12:00:00
#SBATCH --mem=40GB
#SBATCH -o /home/hennelly/Asianwolves/slurmout/02_twisst_Asianwolves_final_west_nnewtwisst_%A_%a.out
#SBATCH -e /home/hennelly/Asianwolves/slurmout/02_twisst_Asianwolves_final_west_nnewtwisst_%A_%a.err
#SBATCH -p high
#SBATCH --array=1-38%15

echo "My SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID
CHR=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /home/hennelly/Redwolf/files/chrlist.txt | cut -f1)

DIR=/group/ctbrowngrp2/hennelly/hennelly/Asianwolves/phyml
OUTDIR=/group/ctbrowngrp2/hennelly/hennelly/Asianwolves/output
popfile=/group/ctbrowngrp2/hennelly/hennelly/Asianwolves/phyml/Twisst_popfile.txt

conda activate ete3_python3

#For West Asian wolves
python3 /home/hennelly/Redwolf/bin/twisst/twisst.py -t ${DIR}/gatk_chr${CHR}_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final.phyml.trees.gz -w ${OUTDIR}/gatk_chr${CHR}_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_twisst -g Africanwolf -g Indianwolf -g WestAsia -g CentralAsia -g Europe -g Andeanfox --outgroup Andeanfox --method complete --groupsFile ${popfile} 

popfileTib=/group/ctbrowngrp2/hennelly/hennelly/Asianwolves/phyml/TwisstTibetan_popfile.txt
#For Tajikistan wolves
python3 /home/hennelly/Redwolf/bin/twisst/twisst.py -t ${DIR}/gatk_chr${CHR}_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final.phyml.trees.gz -w ${OUTDIR}/gatk_chr${CHR}_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_twisst_CentralAsia -g Tibetan -g CentralAsiaMountains -g WestAsia -g Europe -g Andeanfox --outgroup Andeanfox --method complete --groupsFile ${popfileTib} 







