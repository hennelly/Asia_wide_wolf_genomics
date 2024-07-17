#!/usr/bin/env bash
#SBATCH --job-name=twisst
#SBATCH -c 1
#SBATCH --time 1-10:30:00
#SBATCH --mem-per-cpu 5G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout/twisst_%A_%a.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout/twisst_%A_%a.err
#SBATCH --array=1-38%5

module load python/2.7.18
module load numpy

CHR=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /home/crq857/projects/Geneflow_Dogs/files/chrlist_angsd.txt | cut -f1)

DIR=/projects/mjolnir1/people/crq857/Chapter2/phasedvcf
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/03_GeneflowAnalyses/twisst/geno

#conda activate /projects/mjolnir1/apps/conda/numpy-1.21.2
## Convert to Geno
python3 /projects/mjolnir1/people/crq857/bin/genomics_general/VCF_processing/parseVCF.py -i ${DIR}/gatk_${CHR}_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_final.recode.vcf --skipIndels | gzip > ${OUTDIR}/gatk_${CHR}_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final.geno.gz
