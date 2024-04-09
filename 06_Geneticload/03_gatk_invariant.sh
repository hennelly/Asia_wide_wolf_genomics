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


#!/usr/bin/env bash
#SBATCH --job-name=Combine_VCF
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --time 06:00:00
#SBATCH --mem=16GB
#SBATCH -p high
#SBATCH -o arrayJob_%A_%a.out
#SBATCH --exclude=c10-96,c10-69,c11-76,c11-93,c11-86

cat <(grep "#" chr1/freebayes/chr1.1000001-2000001.vcf) <(for number in $(seq 1 1 39); do grep -v "#" chr${number}/chr${number}_minQ30_noindels.recode.vcf; done) <(grep -v "#" chrX/chrX_minQ30_noindels.recode.vcf) > All_Combined_minQ30_noindels.vcf

#!/usr/bin/env bash
#SBATCH --job-name=fsc
#SBATCH -c 1
#SBATCH --time 00:30:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout/fsc_GATK_Genotype_3.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout/fsc_GATK_Genotype_3.err

cat <(grep "#" /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_BCFtools_fsc/chr1/samtools/chr1.1000001-2000001.vcf) \
        <(for number in $(seq 1 1 39); do grep -v "#" /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_BCFtools_fsc/chr${number}/chr${number}.samtools.WithIDs.vcf | awk '$5!="." {print}'; done) > /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_BCFtools_fsc/All_Combined.samtools.WithIDs.vcf



#!/usr/bin/env bash
#SBATCH --job-name=d
#SBATCH -c 1
#SBATCH --time 00:30:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o gun2zip.out
#SBATCH -e gunz2ip.err

gunzip *vcf.gz

#!/usr/bin/env bash
#SBATCH --job-name=gload
#SBATCH -c 1
#SBATCH --time 04:00:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/reproductivegenes/slurmout/hapdAndeanfox.out
#SBATCH -e /home/crq857/projects/reproductivegenes/slurmout/hapdAndeanfox.err

## pseudo haploidize vcf files (i had to create a python virtual environment with specific dependencies but might just be our server) ##
gunzip /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK_fsc/Andeanfox.vcf.gz

VCFd=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK_fsc/Andeanfox.vcf.gz
OUTd=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Andeanfox_pseudo_gatk

python3 pseudo_haploidize.py -v ${VCFd} -d 4 -o ${OUTd}


gunzip /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK_fsc/Dhole.vcf.gz

/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK_fsc/Dhole.vcf.gz



## Make bed file from vcf with sites
cat /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Andeanfox_ID_final.recode.vcf |tail -n +12 |awk '{FS="\t";OFS="\t";print $1,$2-1,$2,$3, etc}' > /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/your_file.bed

# dhole

#!/usr/bin/env bash
#SBATCH --job-name=dhole
#SBATCH -c 1
#SBATCH --time 1-00:10:00
#SBATCH --mem-per-cpu 20G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout_fsc/andeanfsc_GATK_Genotype_dhole.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout_fsc/andeanfsc_GATK_Genotype_dhole.err

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


