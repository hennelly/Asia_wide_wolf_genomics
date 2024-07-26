## RUN ON FARM ##
#!/usr/bin/env bash
#SBATCH --job-name=twisst
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --time 3-12:00:00
#SBATCH --mem=40GB
#SBATCH -o /home/hennelly/Asianwolves/slurmout/02_twisst_Asianwolves_final_west_nnewtwisst_EasternAsia_chrX.out
#SBATCH -e /home/hennelly/Asianwolves/slurmout/02_twisst_Asianwolves_final_west_nnewtwisst_EasternAsia_chrX.err
#SBATCH -p high

echo "My SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID
CHR=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /home/hennelly/Redwolf/files/chrlist.txt | cut -f1)

PHY=/projects/mjolnir1/people/crq857/Chapter2/03_GeneflowAnalyses/twisst/phyml/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final.phyml.trees.gz
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/03_GeneflowAnalyses/twisst/out_July
popfile=/group/ctbrowngrp2/hennelly/hennelly/Asianwolves/phyml/Twisst_popfile.txt

conda activate ete3_python3

module load ete3

#For West Asian wolves
python3 /projects/mjolnir1/people/crq857/bin/twisst/twisst.py -t ${PHY} -w ${OUTDIR}/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_July21.phyml_twisst -g Africanwolf -g Indianwolf -g WestAsia -g CentralAsia -g Europe -g Andeanfox --outgroup Andeanfox --method complete --groupsFile ${popfile} 

popfileTib=/group/ctbrowngrp2/hennelly/hennelly/Asianwolves/phyml/TwisstTibetan_popfile.txt
#For Tajikistan wolves
python3 /home/hennelly/Redwolf/bin/twisst/twisst.py -t ${DIR}/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_July21.phyml.trees.gz -w ${OUTDIR}/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_July21.phyml_twisst_CentralAsia -g Tibetan -g CentralAsiaMountains -g WestAsia -g Europe -g Andeanfox --outgroup Andeanfox --method complete --groupsFile ${popfileTib} 

#For eastern Asian wolves

python3 /home/hennelly/Redwolf/bin/twisst/twisst.py -t ${DIR}/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_July21.phyml.trees.gz -w ${OUTDIR}/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_July21.phyml_twisst_EastAsia -g Tibetan -g EastAsia -g Russia -g Europe -g Andeanfox --outgroup Andeanfox --method complete --groupsFile ${popfileTib}

/projects/mjolnir1/people/crq857/Chapter2/03_GeneflowAnalyses/twisst/phyml/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final.phyml


