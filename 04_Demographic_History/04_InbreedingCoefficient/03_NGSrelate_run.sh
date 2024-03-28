#!/usr/bin/env bash
#SBATCH --job-name=ngsrelate
#SBATCH -c 1
#SBATCH --time 2-5:00:00
#SBATCH --mem-per-cpu 10G
#SBATCH -o /home/crq857/projects/Geneflow_Dogs/slurmout/ngsrelate.out
#SBATCH -e /home/crq857/projects/Geneflow_Dogs/slurmout/ngsrelate.err

module load angsd

GLF=/projects/mjolnir1/people/crq857/Chapter2/04_Demographichistory/NSGRelate/Asianwolves_NGSRelate_Mar25_autosomes.glf.gz
FREQ=/projects/mjolnir1/people/crq857/Chapter2/04_Demographichistory/NSGRelate/autosomes.freq

/projects/mjolnir1/apps/ngsRelate/ngsRelate -F 1  -g ${GLF} -n 99 -f ${FREQ} -O output.res
