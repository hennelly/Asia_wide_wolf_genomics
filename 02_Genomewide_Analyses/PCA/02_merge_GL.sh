#!/usr/bin/env bash
#SBATCH --job-name=PCA
#SBATCH -c 1
#SBATCH --time 12:00:00
#SBATCH --mem-per-cpu 10G
#SBATCH -o /home/crq857/projects/Asianwolves_revision/slurmout/combine.out
#SBATCH -e /home/crq857/projects/Asianwolves_revision/slurmout/combine.err
#SBATCH --array=1-38%5

cp Asianwolves_PCAdmix_June2025_chr1.beagle.gz Asianwolves_PCAdmix_June2025_autosomes.beagle.gz

for CHR in `seq 2 38`
do
  gunzip -c Asianwolves_PCAdmix_June2025_chr${CHR}.beagle.gz | sed 1d | gzip -c
done >> Asianwolves_PCAdmix_June2025_autosomes.beagle.gz





