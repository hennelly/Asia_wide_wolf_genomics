#!/usr/bin/env bash
#SBATCH --job-name=merge
#SBATCH -c 1
#SBATCH --time 5:00:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Geneflow_Dogs/slurmout/merge.out
#SBATCH -e /home/crq857/projects/Geneflow_Dogs/slurmout/merge.err

cp Asianwolves_PCAdmix_Dec26_chr1.beagle.gz Asianwolves_PCAdmix_Dec26_autosomes.beagle.gz

for CHR in `seq 2 38`
do
  gunzip -c Asianwolves_PCAdmix_Dec26_chr${CHR}.beagle.gz | sed 1d | gzip -c
done >> Asianwolves_PCAdmix_Dec26_autosomes.beagle.gz
