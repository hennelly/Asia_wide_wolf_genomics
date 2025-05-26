#!/usr/bin/env bash
#SBATCH --job-name=afox
#SBATCH -c 1
#SBATCH --time 3-11:00:00
#SBATCH --mem-per-cpu 20G
#SBATCH -o /home/crq857/projects/reproductivegenes/slurmout/Andeanfox_%A_%a.out
#SBATCH -e /home/crq857/projects/reproductivegenes/slurmout/Andeanfox_%A_%a.err
#SBATCH --array=1-39%20

CHR=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /home/crq857/projects/Chapter3/files/chromosomelist_correct.txt | cut -f1)
SAMPLEMAP=/home/crq857/projects/Chapter2/files/GBImportSampleMap_Andeanfox.txt
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/04_Genomeimport_Andeanfox/
TEMPDIR=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/04_Genomeimporttemp_Andeanfox/

module load jdk

java -Xmx20g -jar /projects/mjolnir1/apps/conda/gatk4-4.2.5.0/share/gatk4-4.2.5.0-0/gatk-package-4.2.5.0-local.jar GenomicsDBImport \
    --genomicsdb-workspace-path ${OUTDIR}${CHR}_gvcf_db \
    --batch-size 50 \
    -L ${CHR} \
    --sample-name-map ${SAMPLEMAP} \
    --tmp-dir ${TEMPDIR} 


#!/usr/bin/env bash
#SBATCH --job-name=dhole
#SBATCH -c 1
#SBATCH --time 2-11:00:00
#SBATCH --mem-per-cpu 10G
#SBATCH -o /home/crq857/projects/reproductivegenes/slurmout/Dhole_%A_%a.out
#SBATCH -e /home/crq857/projects/reproductivegenes/slurmout/Dhole_%A_%a.err
#SBATCH --array=1-39%20

CHR=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /home/crq857/projects/Chapter3/files/chromosomelist_correct.txt | cut -f1)
SAMPLEMAP=/home/crq857/projects/Chapter2/files/GBImportSampleMap_Dhole.txt
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/04_Genomeimport_Dhole/
TEMPDIR=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/scratch_Dhole/

module load jdk

java -Xmx20g -jar /projects/mjolnir1/apps/conda/gatk4-4.2.5.0/share/gatk4-4.2.5.0-0/gatk-package-4.2.5.0-local.jar GenomicsDBImport \
    --genomicsdb-workspace-path ${OUTDIR}${CHR}_gvcf_db \
    --batch-size 50 \
    -L ${CHR} \
    --sample-name-map ${SAMPLEMAP} \
    --tmp-dir ${TEMPDIR} 


