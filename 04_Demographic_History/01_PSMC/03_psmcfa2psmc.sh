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


psmc -p "1+1+1+1+25*2+4+6" -r5 -t15 -N25 -o ${OUTDIR}/Shanxi1Wolf_1_1_1_1.psmc ${DIR}/Shanxi1Wolf.psmcfa


Shanxi1Wolf.psmcfa






