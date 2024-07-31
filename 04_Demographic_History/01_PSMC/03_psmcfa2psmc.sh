#!/usr/bin/env bash
#SBATCH --job-name=PSMC
#SBATCH -c 1
#SBATCH --time 12:00:00
#SBATCH --mem-per-cpu 5G
#SBATCH --array=1-23%10
#SBATCH -o /home/crq857/projects/Chapter2/slurmout/PSMC_psmc_rerun_testlc_%A_%a.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout/PSMC_psmc_rerun_testlc_%A_%a.err

echo "My SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID
PSMCFA=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /home/crq857/projects/Chapter2/list_Dec/psmcfa_highcov.txt | cut -f1)
DIR=/projects/mjolnir1/people/crq857/Chapter2/04_Demographichistory/PSMC/psmcfa
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/04_Demographichistory/PSMC/psmc

module load psmc

#psmc -p "4+25*2+4+6" -r5 -t15 -N25 -o ${OUTDIR}/${PSMCFA}_4.psmc ${DIR}/${PSMCFA}

## Also try other combinations of input to see if it impacts the PSMC curve 

#psmc -p "2+2+25*2+4+6" -r5 -t15 -N25 -o ${OUTDIR}/${PSMCFA}_2_2.psmc ${DIR}/${PSMCFA}
psmc -p "1+1+1+1+25*2+4+6" -r5 -t15 -N25 -o ${OUTDIR}/${PSMCFA}_1_1_1_1.psmc ${DIR}/${PSMCFA}


scp -r crq857@mjolnirgate.unicph.domain:/home/crq857/projects/Chapter2/scripts_June2024/*pdf   ~/Desktop
/home/crq857/projects/Chapter2/scripts_June2024/*pdf

#!/usr/bin/env bash
#SBATCH --job-name=lworec
#SBATCH -c 1
#SBATCH --time 2-11:40:00
#SBATCH --mem-per-cpu 50G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout/iqtree_Xchr_noadmix_try2.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout/iqtree_Xchr_noadmix_try2.err

#conda activate /projects/mjolnir1/apps/conda/python-3.5.6

PHYnoad=/projects/mjolnir1/people/crq857/Chapter2/06_Datasets/Xchr_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_lowrecombination_noadmixPak.min4_copy.phy
#/home/crq857/bin/iqtree-1.6.12-Linux/bin/iqtree -s ${PHY} -bb 1000 -nt AUTO -m MFP
/home/crq857/bin/iqtree-1.6.12-Linux/bin/iqtree -s ${PHYnoad} -bb 1000 -nt AUTO -m MFP

# you may need to download iqtree: http://www.iqtree.org/
# the -m flag is to decide which substitution model best fits the data. The MFP flag is telling iqtree to estimate which model is best
# the -bb flag is for bootstrapping. The 1000 tells iqtree to do 1000 bootstrap replicates





