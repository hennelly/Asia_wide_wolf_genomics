#!/usr/bin/env bash
#SBATCH --job-name=PSMC
#SBATCH -c 1
#SBATCH --time 00:10:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout/PSMC_plot.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout/PSMC_plot.err

module load psmc


FILE=Kyrgyz_WLF180.CanFam31.bam_autosomes.bam
DIR=/projects/mjolnir1/people/crq857/Chapter2/04_Demographichistory/PSMC/psmc
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/04_Demographichistory/PSMC/plot_lc

psmc_plot.pl -u 4.5e-09 -g 4.4 -R -M "sample1=0.04" ${OUTDIR}/${FILE}_u4.5e9g4.4_FNR0.04  ${DIR}/${FILE}.psmc


