#!/usr/bin/env bash
#SBATCH --job-name=genotype
#SBATCH -c 1
#SBATCH --time 5-11:00:00
#SBATCH --mem-per-cpu 20G
#SBATCH -o /home/crq857/projects/Chapter3/slurmout/GATK_Genotype_%A_%a.out
#SBATCH -e /home/crq857/projects/Chapter3/slurmout/GATK_Genotype_%A_%a.err
#SBATCH --array=11-39

CHR=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /home/crq857/projects/Chapter3/files/chromosomelist.txt | cut -f1)
REF=/projects/mjolnir1/people/crq857/Chapter2/ref/canFam31.fasta
OUTDIR=/projects/mjolnir1/people/crq857/Geneflow_Dogs/00_Alignment/GenotypeGATK/
TEMPDIR=/projects/mjolnir1/people/crq857/Geneflow_Dogs/00_Alignment/scratch_GATK/

cd /projects/mjolnir1/people/crq857/Geneflow_Dogs/00_Alignment/GenomeImportOct/
java -Xmx20g -jar /projects/mjolnir1/apps/conda/gatk4-4.2.5.0/share/gatk4-4.2.5.0-0/gatk-package-4.2.5.0-local.jar GenotypeGVCFs \
   -R ${REF} \
   -V gendb://${CHR}_gvcf_db \
   -O ${OUTDIR}gatk_${CHR}.vcf.gz \
   --tmp-dir ${TEMPDIR}
