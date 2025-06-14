#!/usr/bin/env bash
#SBATCH --job-name=pca
#SBATCH -c 1
#SBATCH --time 12:00:00
#SBATCH --mem-per-cpu 10G
#SBATCH -o /home/crq857/projects/Asianwolves_revision/slurmout/pca.out
#SBATCH -e /home/crq857/projects/Asianwolves_revision/slurmout/pca.err

module load pcangsd

IN=/projects/psg/people/crq857/Chapter2/02_GenomewideAnalyses/Beaglefiles_PCA_June2025/Asianwolves_PCAdmix_June2025_autosomes.beagle.gz
OUTDIR=/projects/psg/people/crq857/Chapter2/02_GenomewideAnalyses/Beaglefiles_PCA_June2025

# Estimate covariance matrix for pca
pcangsd -b ${IN} -e 2 -o ${OUTDIR}/output_June14_2025_Asianwolf.txt -t 2


