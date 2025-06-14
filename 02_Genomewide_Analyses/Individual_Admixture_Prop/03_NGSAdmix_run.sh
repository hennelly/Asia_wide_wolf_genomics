#!/usr/bin/env bash
#SBATCH --job-name=angsd
#SBATCH -c 1
#SBATCH --time 4-12:00:00
#SBATCH --mem-per-cpu 50G
#SBATCH -o /home/crq857/projects/Asianwolves_revision/slurmout/angsd_Apr25_wolvesNGSadmix_%A_%a.out
#SBATCH -e /home/crq857/projects/Asianwolves_revision/slurmout/angsd_Apr25_wolvesNGSadmix_%A_%a.err
#SBATCH --array=1-12%5

K=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /home/crq857/projects/Chapter2/files/NGAdmixlist.txt | cut -f1)

IN=/projects/psg/people/crq857/Asianwolves_revision/01_GenomewideAnalyses/Admixture_June2025_wolves/Graywolves_June12_2025_NGSAdmix_autosomes.beagle.gz

/projects/psg/people/crq857/Chapter2/bin/NGSAdmix/NGSadmix -likes ${IN} -K ${K} -o /projects/psg/people/crq857/Asianwolves_revision/01_GenomewideAnalyses/Admixture_June2025_wolves/Graywolves_June12_2025_NGSAdmix_autosomes_K${K} -P 10  



