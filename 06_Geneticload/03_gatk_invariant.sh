#!/usr/bin/env bash
#SBATCH --job-name=d
#SBATCH -c 1
#SBATCH --time 30:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout_fsc/andeanfsc_GATK_Genotype.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout_fsc/andeanfsc_GATK_Genotype.err

conda activate /projects/mjolnir1/apps/conda/java-jdk-8.0.112

REF=/projects/mjolnir1/people/crq857/Chapter2/ref/canFam31.fasta
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK_fsc/
TEMPDIR=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/scratch_GATK__fsc/

java -Xmx20g -jar /projects/mjolnir1/apps/conda/gatk4-4.1.2.0/share/gatk4-4.1.2.0-1/gatk-package-4.1.2.0-local.jar HaplotypeCaller \
   -R ${REF} \
   -I /projects/mjolnir1/people/fck245/proj_c2/AllBams/AndeanFox.CanFam31.realigned.bam \
   -O ${OUTDIR}Andeanfox.vcf.gz \
   -ERC BP_RESOLUTION \
   --output-mode EMIT_ALL_CONFIDENT_SITES \
   -L /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/your_file.bed \

# dhole
#conda activate /projects/mjolnir1/apps/conda/java-jdk-8.0.112

REF=/projects/mjolnir1/people/crq857/Chapter2/ref/canFam31.fasta
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK_fsc/
TEMPDIR=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/scratch_GATK__fsc/

java -Xmx20g -jar /projects/mjolnir1/apps/conda/gatk4-4.1.2.0/share/gatk4-4.1.2.0-1/gatk-package-4.1.2.0-local.jar HaplotypeCaller \
   -R ${REF} \
   -I /projects/mjolnir1/people/fck245/proj_c2/AllBams/BerlinZoo.CanFam31.realigned.bam \
   -O ${OUTDIR}Dhole.vcf.gz \
   -ERC BP_RESOLUTION \
   --output-mode EMIT_ALL_CONFIDENT_SITES \
   -L /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/your_file.bed \






