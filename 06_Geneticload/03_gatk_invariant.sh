#!/usr/bin/env bash
#SBATCH --job-name=d
#SBATCH -c 1
#SBATCH --time 1-00:10:00
#SBATCH --mem-per-cpu 20G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout_fsc/andeanfsc_GATK_Genotype.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout_fsc/andeanfsc_GATK_Genotype.err

REF=/projects/mjolnir1/people/crq857/Chapter2/ref/canFam31.fasta
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK_fsc/
TEMPDIR=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/scratch_GATK__fsc/

java -Xmx20g -jar /projects/mjolnir1/apps/conda/gatk4-4.1.2.0/share/gatk4-4.1.2.0-1/gatk-package-4.1.2.0-local.jar HaplotypeCaller \
   -R ${REF} \
   -I /projects/mjolnir1/people/fck245/proj_c2/AllBams/AndeanFox.CanFam31.realigned.bam \
   -O ${OUTDIR}Andeanfox.vcf.gz \
   --output-mode EMIT_ALL_CONFIDENT_SITES \
   -L /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/your_file.bed \
   -ip 100 

## Make bed file from vcf with sites
cat /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Andeanfox_ID_final.recode.vcf |tail -n +12 |awk '{FS="\t";OFS="\t";print $1,$2-1,$2,$3, etc}' > /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/your_file.bed


