#!/usr/bin/env bash
#SBATCH --job-name=genomeDB
#SBATCH -c 1
#SBATCH --time 9-11:00:00
#SBATCH --mem-per-cpu 20G
#SBATCH -o /home/crq857/projects/Geneflow_Dogs/slurmoutOct/GATK_GenomeDB_%A_%a.out
#SBATCH -e /home/crq857/projects/Geneflow_Dogs/slurmoutOct/GATK_GenomeDB_%A_%a.err
#SBATCH --array=1-39%10

CHR=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /home/crq857/projects/Chapter3/files/chromosomelist.txt | cut -f1)
SAMPLEMAP=/home/crq857/projects/Geneflow_Dogs/files/list_GenomeDB.txt
OUTDIR=/projects/mjolnir1/people/crq857/Geneflow_Dogs/00_Alignment/GenomeImportOct/
TEMPDIR=/projects/mjolnir1/people/crq857/Geneflow_Dogs/00_Alignment/scatch_oct/

module load jdk

java -Xmx20g -jar /projects/mjolnir1/apps/conda/gatk4-4.2.5.0/share/gatk4-4.2.5.0-0/gatk-package-4.2.5.0-local.jar GenomicsDBImport \
    --genomicsdb-workspace-path ${OUTDIR}${CHR}_gvcf_db \
    --batch-size 50 \
    -L ${CHR} \
    --sample-name-map ${SAMPLEMAP} \
    --tmp-dir ${TEMPDIR} 
