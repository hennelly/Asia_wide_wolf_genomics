#!/usr/bin/env bash
#SBATCH --job-name=angsdPCA
#SBATCH -c 1
#SBATCH --time 1-00:00:00
#SBATCH -c 10   ## number cpus
#SBATCH --mem=40gb      ## total RAM
#SBATCH -o /home/crq857/projects/Chapter2/slurmout_Oct/angsd_PCAngsd_Dec21_%A_%a.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout_Oct/angsd_PCAngsd_Dec21_%A_%a.err
#SBATCH --array=1-38%10

CHR=$(sed -n "$SLURM_ARRAY_TASK_ID"p /home/crq857/projects/Geneflow_Dogs/files/chrlist_angsd.txt | awk '{print $1}')
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/02_GenomewideAnalyses/Beaglefiles_PCA
LIST=/home/crq857/projects/Chapter2/list_Sept/bamlist_for_PCAangsd_listDec15.txt
REF=/projects/mjolnir1/people/crq857/Chapter2/ref/canFam31.fasta

module load angsd

angsd -GL 1 \
  -bam ${LIST} \
   -ref ${REF} \
  -checkBamHeaders 0 \
  -trim 0 -C 50 -baq 1 \
  -nThreads 10 \
  -minMapQ 20 -minQ 20 -minInd 88 \
  -uniqueOnly 1 -remove_bads 1 \
  -noTrans 1 -doGlf 2 -doMajorMinor 1 -doMaf 1 \
  -SNP_pval 1e-6 \
  -P 10 \
  -out ${OUTDIR}/Asianwolves_PCAdmix_Dec26_${CHR} \
  -r ${CHR}: