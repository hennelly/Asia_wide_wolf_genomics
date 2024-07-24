#!/usr/bin/env bash
#SBATCH --job-name=merge
#SBATCH -c 1
#SBATCH --time 5:00:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Geneflow_Dogs/slurmout/merge_ngsadmix.out
#SBATCH -e /home/crq857/projects/Geneflow_Dogs/slurmout/merge_ngsadmix.err


cp Allcanids_Dec26_NGSAdmix_chr1.beagle.gz Asianwolves_NGSAdmix_Dec26_autosomes.beagle.gz

for CHR in `seq 2 38`
do
  gunzip -c Asianwolves_PCAdmix_Dec26_chr${CHR}.beagle.gz | sed 1d | gzip -c
done >> Asianwolves_NGSAdmix_Dec26_autosomes.beagle.gz
