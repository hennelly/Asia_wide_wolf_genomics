#!/usr/bin/env bash
#SBATCH --job-name=angsd
#SBATCH -c 1
#SBATCH --time 5-12:00:00
#SBATCH --mem-per-cpu 20G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout/angsd_Dec21_NGSadmix_%A_%a.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout/angsd_Dec21_NGSadmix_%A_%a.err
#SBATCH --array=1-38%5

# Eurasian wolves and basal canids + dogs  

CHR=$(sed -n "$SLURM_ARRAY_TASK_ID"p /home/crq857/projects/Geneflow_Dogs/files/chrlist_angsd.txt | awk '{print $1}')
REF=/projects/mjolnir1/people/crq857/Chapter2/ref/canFam31.fasta
LIST=/home/crq857/projects/Chapter2/list_Sept/bamlist_for_ngsAdmix_Jan22.txt
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/02_GenomewideAnalyses/Beaglefiles_Jan22

module load angsd

angsd -out ${OUTDIR}/Allcanids_Jan22_2025_NGSAdmix_${CHR} -bam ${LIST} -ref ${REF} -nThreads 10 \
    -GL 1 \
    -checkBamHeaders 0 \
    -trim 0 -C 50 -baq 1 \
    -minMapQ 20 -minQ 20 -minInd 102 \
    -uniqueOnly 1 -remove_bads 1 \
    -noTrans 1 -doGlf 2 -doMajorMinor 1 -doMaf 1 \
    -SNP_pval 1e-6 \
    -P 10 \
    -r ${CHR}:
