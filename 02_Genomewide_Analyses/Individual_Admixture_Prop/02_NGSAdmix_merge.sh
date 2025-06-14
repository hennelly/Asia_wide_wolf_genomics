#!/usr/bin/env bash
#SBATCH --job-name=angsd
#SBATCH -c 1
#SBATCH --time 12:00:00
#SBATCH --mem-per-cpu 10G
#SBATCH -o /home/crq857/projects/Asianwolves_revision/slurmout/combine.out
#SBATCH -e /home/crq857/projects/Asianwolves_revision/slurmout/combine.err

cp Graywolves_June12_2025_NGSAdmix_chr1.beagle.gz Graywolves_June12_2025_NGSAdmix_autosomes.beagle.gz

for CHR in `seq 2 38`
do
  gunzip -c Graywolves_June12_2025_NGSAdmix_chr${CHR}.beagle.gz | sed 1d | gzip -c
done >> Graywolves_June12_2025_NGSAdmix_autosomes.beagle.gz





#!/usr/bin/env bash
#SBATCH --job-name=angsd
#SBATCH -c 1
#SBATCH --time 12:00:00
#SBATCH --mem-per-cpu 10G
#SBATCH -o /home/crq857/projects/Asianwolves_revision/slurmout/combine.out
#SBATCH -e /home/crq857/projects/Asianwolves_revision/slurmout/combine.err

cp Allcanids_June12_2025_NGSAdmix_chr1.beagle.gz Allcanids_June12_2025_NGSAdmix_autosomes.beagle.gz

for CHR in `seq 2 38`
do
  gunzip -c Allcanids_June12_2025_NGSAdmix_chr${CHR}.beagle.gz | sed 1d | gzip -c
done >> Allcanids_June12_2025_NGSAdmix_autosomes.beagle.gz








