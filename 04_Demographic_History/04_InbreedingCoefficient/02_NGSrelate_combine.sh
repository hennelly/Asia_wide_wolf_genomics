#!/usr/bin/env bash
#SBATCH --job-name=freq
#SBATCH -c 1
#SBATCH --time 5:00:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Geneflow_Dogs/slurmout/freq.out
#SBATCH -e /home/crq857/projects/Geneflow_Dogs/slurmout/freq.err

cp Asianwolves_NGSRelate_Mar25_chr1.mafs.gz Asianwolves_NGSRelate_Mar25_autosomes.mafs.gz

for CHR in `seq 2 38`
do
  gunzip -c Asianwolves_NGSRelate_Mar25_chr${CHR}.mafs.gz | sed 1d | gzip -c
done >> Asianwolves_NGSRelate_Mar25_autosomes.mafs.gz


cp Asianwolves_NGSRelate_Mar25_chr1.glf.gz Asianwolves_NGSRelate_Mar25_autosomes.glf.gz

for CHR in `seq 2 38`
do
  gunzip -c Asianwolves_NGSRelate_Mar25_chr${CHR}.glf.gz | sed 1d | gzip -c
done >> Asianwolves_NGSRelate_Mar25_autosomes.glf.gz

zcat Asianwolves_NGSRelate_Mar25_autosomes.mafs.gz | cut -f5 |sed 1d > autosomes.freq

