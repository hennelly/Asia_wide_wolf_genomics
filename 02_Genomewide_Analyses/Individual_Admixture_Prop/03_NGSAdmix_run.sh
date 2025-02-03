#!/usr/bin/env bash
#SBATCH --job-name=NGSAdmix
#SBATCH -c 1
#SBATCH --time 2-00:00:00
#SBATCH --mem-per-cpu 30G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout/angsd_NGSadmix_test_%A_%a.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout/angsd_NGSadmix_test_%A_%a.err
#SBATCH --array=1-12%10

K=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /home/crq857/projects/Chapter2/files/NGAdmixlist.txt | cut -f1)

IN=/projects/mjolnir1/people/crq857/Chapter2/02_GenomewideAnalyses/Beaglefiles_Jan22/Allcanids_Jan22_2025_NGSAdmix_autosomes.beagle.gz

/projects/mjolnir1/people/crq857/Chapter2/bin/NGSAdmix/NGSadmix -likes ${IN} -K ${K} -o /projects/mjolnir1/people/crq857/Chapter2/02_GenomewideAnalyses/Beaglefiles_Jan22/Autosomes_DONE_allcanids_Feb3_NGSAdmix_${K} -P 10  



