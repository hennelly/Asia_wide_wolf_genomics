#!/usr/bin/env bash
#SBATCH --job-name=merge
#SBATCH -c 1
#SBATCH --time 15:00:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Asianwolves_revision/slurmout/merge_ngsadmix.out
#SBATCH -e /home/crq857/projects/Asianwolves_revision/slurmout/merge_ngsadmix.err

cd /projects/psg/people/crq857/Asianwolves_revision/01_GenomewideAnalyses/Admixture

cp Graywolves_Apr25_2025_NGSAdmix_chr1.beagle.gz Graywolves_Apr25_2025_NGSAdmix_autosomes.beagle.gz

for CHR in `seq 2 38`
do
  gunzip -c Graywolves_Apr25_2025_NGSAdmix_chr${CHR}.beagle.gz | sed 1d | gzip -c
done >> Graywolves_Apr25_2025_NGSAdmix_autosomes.beagle.gz



#!/usr/bin/env bash
#SBATCH --job-name=NGSAdmix
#SBATCH -c 1
#SBATCH --time 2-00:00:00
#SBATCH --mem-per-cpu 30G
#SBATCH -o /home/crq857/projects/Asianwolves_revision/slurmout/angsd_NGSadmix_test_%A_%a.out
#SBATCH -e /home/crq857/projects/Asianwolves_revision/slurmout/angsd_NGSadmix_test_%A_%a.err
#SBATCH --array=1-12%10

K=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /home/crq857/projects/Chapter2/files/NGAdmixlist.txt | cut -f1)

IN=/projects/psg/people/crq857/Asianwolves_revision/01_GenomewideAnalyses/Admixture/Graywolves_Apr25_2025_NGSAdmix_autosomes.beagle.gz

/projects/psg/people/crq857/Chapter2/bin/NGSAdmix/NGSadmix -likes ${IN} -K ${K} -o /projects/psg/people/crq857/Asianwolves_revision/01_GenomewideAnalyses/Admixture_results/Graywolves_Apr25_2025_NGSAdmix_autosomes_${K} -P 10  

