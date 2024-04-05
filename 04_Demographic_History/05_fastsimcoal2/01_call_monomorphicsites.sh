#!/usr/bin/env bash
#SBATCH --job-name=fsc
#SBATCH -c 1
#SBATCH --time 4-11:00:00
#SBATCH --mem-per-cpu 20G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout_fsc/fsc_GATK_Genotype_%A_%a.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout_fsc/fsc_GATK_Genotype_%A_%a.err
#SBATCH --array=1-32%15

CHR=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /home/crq857/projects/Chapter3/files/chromosomelist_order.txt | cut -f1)
REF=/projects/mjolnir1/people/crq857/Chapter2/ref/canFam31.fasta
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK_fsc/
TEMPDIR=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/scratch_GATK__fsc/

cd /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/04_Genomeimport/
java -Xmx20g -jar /projects/mjolnir1/apps/conda/gatk4-4.2.5.0/share/gatk4-4.2.5.0-0/gatk-package-4.2.5.0-local.jar GenotypeGVCFs \
   -R ${REF} \
   -V gendb://${CHR}_gvcf_db \
   -all-sites \
   -O ${OUTDIR}gatk_${CHR}.vcf.gz \
   --tmp-dir ${TEMPDIR}





#Then reduce the file 



