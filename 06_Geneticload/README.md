# Genetic load


VCF=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Andeanfox_ID_final.recode.vcf

java -jar picard.jar VcfToIntervalList 
      I=${VCF} 
      O=sample.interval_list 


#!/usr/bin/env bash
#SBATCH --job-name=genotype
#SBATCH -c 1
#SBATCH --time 4-11:00:00
#SBATCH --mem-per-cpu 20G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout_Oct/GATK_Genotype_%A_%a.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout_Oct/GATK_Genotype_%A_%a.err
#SBATCH --array=1-32%15

CHR=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /home/crq857/projects/Chapter3/files/chromosomelist.txt | cut -f1)
REF=/projects/mjolnir1/people/crq857/Chapter2/ref/canFam31.fasta
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/
TEMPDIR=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/scratch_GATK/
VCF=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Andeanfox_ID_final.recode.vcf

cd /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/04_Genomeimport/
java -Xmx20g -jar /projects/mjolnir1/apps/conda/gatk4-4.2.5.0/share/gatk4-4.2.5.0-0/gatk-package-4.2.5.0-local.jar GenotypeGVCFs \
   -R ${REF} \
   -V gendb://${CHR}_gvcf_db \
   -L variants.vcf \
   -O ${OUTDIR}gatk_${CHR}_outgroup.vcf.gz \
   --tmp-dir ${TEMPDIR}
   

java -Xmx20g -jar /projects/mjolnir1/apps/conda/gatk4-4.2.5.0/share/gatk4-4.2.5.0-0/gatk-package-4.2.5.0-local.jar

-L variants.vcf


        gatk --java-options "-Xmx4g" HaplotypeCaller  \
                -R $REF \
                -I $DIR1/${IND}_trimm_dedup_auto.bam \
                -O $DIR2/${IND}.all.vcf.gz \
                -ERC BP_RESOLUTION \
                -L jointcallall2_bisnps_qual_dp_mac2_miss.bed \
                --output-mode EMIT_ALL_CONFIDENT_SITES
                
#!/usr/bin/env bash
#SBATCH --job-name=fsc
#SBATCH -c 1
#SBATCH --time 1-00:00:00
#SBATCH --mem-per-cpu 20G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout_fsc/andeanfsc_GATK_Genotype.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout_fsc/andeanfsc_GATK_Genotype.err

REF=/projects/mjolnir1/people/crq857/Chapter2/ref/canFam31.fasta
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK_fsc/
TEMPDIR=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/scratch_GATK__fsc/


java -Xmx20g -jar /projects/mjolnir1/apps/conda/gatk4-4.2.5.0/share/gatk4-4.2.5.0-0/gatk-package-4.2.5.0-local.jar HaplotypeCaller \
   -R ${REF} \
   -I /projects/mjolnir1/people/fck245/proj_c2/AllBams/AndeanFox.CanFam31.realigned.bam \
   -O ${OUTDIR}Andeanfox.vcf.gz \
   -ERC BP_RESOLUTION \
   -L /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Dhole_ID_final.recode.vcf.gz \
   -ip 100 
   --output-mode EMIT_ALL_CONFIDENT_SITES



module load python
 module load openjdk/17.0.8
 module load gatk 
 
 gatk IndexFeatureFile \
     -F /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Dhole_ID_final.recode.vcf.gz


#!/usr/bin/env bash
#SBATCH --job-name=fsc
#SBATCH -c 1
#SBATCH --time 00:10:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout_fsc/andeanfsc_GATK_Genotype.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout_fsc/andeanfsc_GATK_Genotype.err

REF=/projects/mjolnir1/people/crq857/Chapter2/ref/canFam31.fasta
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK_fsc/
TEMPDIR=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/scratch_GATK__fsc/


#!/usr/bin/env bash
#SBATCH --job-name=fsc
#SBATCH -c 1
#SBATCH --time 2-00:10:00
#SBATCH --mem-per-cpu 20G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout_fsc/test.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout_fsc/test.err

REF=/projects/mjolnir1/people/crq857/Chapter2/ref/canFam31.fasta
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK_fsc/
TEMPDIR=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/scratch_GATK__fsc/

java -Xmx20g -jar /projects/mjolnir1/apps/conda/gatk4-4.1.2.0/share/gatk4-4.1.2.0-1/gatk-package-4.1.2.0-local.jar HaplotypeCaller \
   -R ${REF} \
   -I /projects/mjolnir1/people/fck245/proj_c2/AllBams/BerlinZoo.CanFam31.realigned.bam \
   -O ${OUTDIR}Andeanfox.vcf.gz \
   --output-mode EMIT_ALL_CONFIDENT_SITES \
   -L /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Andeanfox_ID_fina2.bed.bed \
   -ip 100 

/home/crq857/projects/Chapter2/slurmout_fsc/andeanfsc_GATK_Genotypedhole.err
plink2 --vcf /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Andeanfox_ID_final.recode.vcf --make-bed --out /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Andeanfox_ID_fina2.bed.bed


 /projects/mjolnir1/apps/conda/plink2-2.00a2.3

module load python
 module load openjdk/17.0.8
 module load gatk 
 
 gatk IndexFeatureFile \
     -F /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Andeanfox.vcf.gz



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

cat /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Andeanfox_ID_final.recode.vcf |tail -n +12 |awk '{FS="\t";OFS="\t";print $1,$2-1,$2,$3, etc}' > /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/your_file.bed






java -Xmx20g -jar java -Xmx20g -jar /projects/mjolnir1/apps/conda/gatk4-4.1.2.0/share/gatk4-4.1.2.0-1/gatk-package-4.1.2.0-local.jar HaplotypeCaller \
   -R ${REF} \
   -I /projects/mjolnir1/people/fck245/proj_c2/AllBams/AndeanFox.CanFam31.realigned.bam \
   -O ${OUTDIR}Andeanfox.vcf.gz \
   --output-mode EMIT_ALL_CONFIDENT_SITES
   -L /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Andeanfox_ID_final.recode.vcf \
   -ip 100 

   gatk-3.6
gatk4-4.1.2.0
gatk4-4.0.12.0
gatk4-4.2.5.0

java -Xmx20g -jar /projects/mjolnir1/apps/conda/gatk4-4.1.2.0/share/gatk4-4.1.2.0-1/gatk-package-4.1.2.0-local.jar HaplotypeCaller

/projects/mjolnir1/apps/conda/gatk4-4.1.2.0/share/gatk4-4.1.2.0-1/gatk-package-4.1.2.0-local.jar
   --all-sites



#!/usr/bin/env bash
#SBATCH --job-name=fsc
#SBATCH -c 1
#SBATCH --time 00:10:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout_fsc/andeanfsc_GATK_Genotype.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout_fsc/andeanfsc_GATK_Genotype.err

module load python
module load openjdk/17.0.8
module load gatk 
 
gatk IndexFeatureFile --java-options '-DGATK_STACKTRACE_ON_USER_EXCEPTION=true' -I /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Andeanfox_ID_final.recode.vcf


Andeanfox_ID_final.recode.vcf

module load python
 module load openjdk/17.0.8
 module load gatk 
 
 gatk IndexFeatureFile \
     -F /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Andeanfox.vcf.gz



java -Xmx20g -jar /projects/mjolnir1/apps/conda/gatk4-4.2.5.0/share/gatk4-4.2.5.0-0/gatk-package-4.2.5.0-local.jar HaplotypeCaller \
   -R ${REF} \
   -I /projects/mjolnir1/people/fck245/proj_c2/AllBams/AndeanFox.CanFam31.realigned.bam \
   -O ${OUTDIR}Andeanfox.vcf.gz \
   -ERC BP_RESOLUTION \
   -L /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Dhole_ID_final.recode.vcf.gz \
   -ip 100vim
   --all-sites


   



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



AndeanFox  /projects/mjolnir1/people/crq857/Geneflow_Dogs/00_Alignment/Haplocaller/AndeanFox.g.vcf.gz
Dhole_BerlinZoo /projects/mjolnir1/people/crq857/Geneflow_Dogs/00_Alignment/Haplocaller/Dhole_BerlinZoo.g.vcf.gz






    
