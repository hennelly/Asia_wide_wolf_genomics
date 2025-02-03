#!/usr/bin/env bash
#SBATCH --job-name=merge
#SBATCH -c 1
#SBATCH --time 15:00:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout/merge_ngsadmix.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout/merge_ngsadmix.err

cd /projects/mjolnir1/people/crq857/Chapter2/02_GenomewideAnalyses/Beaglefiles_Jan22 

cp Allcanids_Jan22_2025_NGSAdmix_chr1.beagle.gz Allcanids_Jan22_2025_NGSAdmix_autosomes.beagle.gz

for CHR in `seq 2 38`
do
  gunzip -c Allcanids_Jan22_2025_NGSAdmix_chr${CHR}.beagle.gz | sed 1d | gzip -c
done >> Allcanids_Jan22_2025_NGSAdmix_autosomes.beagle.gz
