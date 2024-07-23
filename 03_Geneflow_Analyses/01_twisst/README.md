#!/usr/bin/env bash
#SBATCH --job-name=twisst
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --time 3-12:00:00
#SBATCH --mem=40GB
#SBATCH -o /home/hennelly/Asianwolves/slurmout/02_twisst_Asianwolves_final_west_nnewtwisst_EasternAsia_chrX_Centralagain.out
#SBATCH -e /home/hennelly/Asianwolves/slurmout/02_twisst_Asianwolves_final_west_nnewtwisst_EasternAsia_chrX_Centralagain.err
#SBATCH -p high

conda activate ete3_python3

DIR=/group/ctbrowngrp2/hennelly/hennelly/Asianwolves/phyml
OUTDIR=/group/ctbrowngrp2/hennelly/hennelly/Asianwolves/output
popfileTib=/group/ctbrowngrp2/hennelly/hennelly/Asianwolves/phyml/TwisstTibetan_popfile.txt

python3 /home/hennelly/Redwolf/bin/twisst/twisst.py -t ${DIR}/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_July21.phyml.trees.gz -w ${OUTDIR}/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_July21.phyml_twisst_CentralAsia_July22_withRussia -g Tibetan -g CentralAsiaMountains -g Russia -g Europe -g Andeanfox --outgroup Andeanfox --method complete --groupsFile ${popfileTib}

/group/ctbrowngrp2/hennelly/hennelly/Asianwolves/phyml/TwisstTibetan_popfile.txt




