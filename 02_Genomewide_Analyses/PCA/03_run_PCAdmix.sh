#!/usr/bin/env bash
#SBATCH --job-name=PCAngsd
#SBATCH -c 1
#SBATCH --time 12:00:00
#SBATCH --mem-per-cpu 5G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout_Oct/PCAngsd.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout_Oct/PCAngsd.err

#conda activate /projects/mjolnir1/apps/conda/pcangsd-1.10

IN=/projects/mjolnir1/people/crq857/Chapter2/02_GenomewideAnalyses/Beaglefiles_PCA/Asianwolves_PCAdmix_Dec26_autosomes.beagle.gz
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/02_GenomewideAnalyses/PCA

# Estimate covariance matrix for pca
pcangsd -b ${IN} -e 2 -o ${OUTDIR}/output_Dec29_Asianwolf.txt -t 2
