#!/usr/bin/env bash
#SBATCH --job-name=paleomix
#SBATCH -c 1
#SBATCH --time 12-12:00:00
#SBATCH --mem-per-cpu 10G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout/Paleomix_W13_Guizhou.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout/Paleomix_W13_Guizhou.err

DIR=/projects/mjolnir1/people/crq857/Chapter2/bams_Dec

cd ${DIR}

module load paleomix

paleomix bam run --jar-root /projects/mjolnir1/apps/conda/paleomix-1.3.6/share/picard-2.27.2-0/ --log-level info --max-threads 50 --adapterremoval-max-threads 50 --bwa-max-threads 50 --log-file W13_Guizhou_log /home/crq857/projects/Chapter2/yamls/example.yaml

#each sample was run independently, with each its own yaml file. 







#!/usr/bin/env bash
#SBATCH --job-name=paleomix
#SBATCH -c 1
#SBATCH --time 3-12:00:00
#SBATCH --mem-per-cpu 30G
#SBATCH -o /home/crq857/projects/Asianwolves_revision/slurmout/China_Sichuan_again_SRR20326479.out
#SBATCH -e /home/crq857/projects/Asianwolves_revision/slurmout/China_Sichuan_again_SRR20326479.err

DIR=/projects/psg/people/crq857/Chapter2/bams_Dec

cd ${DIR}

module load paleomix

paleomix bam run --jar-root /datasets/globe_software/conda/paleomix-1.3.9/share/picard-2.27.5-0/ --log-level info --max-threads 50 --adapterremoval-max-threads 50 --bwa-max-threads 50 --log-file China_Sichuan_again_SRR20326479 /home/crq857/projects/Asianwolves_revision/scripts/China_Sichuan_again_SRR20326479.paleo

#each sample was run independently, with each its own yaml file. 





China_Sichuan_again_SRR20326479.paleo

