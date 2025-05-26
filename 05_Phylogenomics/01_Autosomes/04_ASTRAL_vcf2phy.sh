#!/usr/bin/env bash
#SBATCH --partition=cpuqueue
#SBATCH --qos=normal
#SBATCH --cpus-per-task=4
#SBATCH --mem=1G
#SBATCH --array=1000-1010%10
#SBATCH --output=/home/crq857/projects/Asianwolves_revision/slurmout/zAutosomes_astral_%A_%a.out
#SBATCH --error=/home/crq857/projects/Asianwolves_revision/slurmout/zAutosomes_astral_%A_%a.err
#SBATCH --time=02:00:00

BEDFILE=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /projects/psg/people/crq857/Chapter2/05_Phylogenomics/bedfiles/listfiles.txt)
DIR=/projects/psg/people/crq857/Chapter2/05_Phylogenomics/ASTRAL_vcf_more
REMOVE=/projects/psg/people/crq857/Chapter2/05_Phylogenomics/ASTRAL_vcf_more/removelist.txt

OUTDIR=/projects/psg/people/crq857/Chapter2/05_Phylogenomics/ASTRAL_vcf_more

python /projects/psg/people/crq857/bin/vcf2phylip/vcf2phylip.py -i ${DIR}/REVISION_Autosomes_nodogs_withNAwolves_Jan2025_${BEDFILE}.vcf_headerfinal_finalsamplelist.vcf.recode.vcf --output-folder ${OUTDIR} --output-prefix REVISION_Autosomes_nodogs_withNAwolves_Jan2025_${BEDFILE} -o AndeanFox












