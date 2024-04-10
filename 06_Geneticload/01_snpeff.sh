#!/usr/bin/env bash
#SBATCH --job-name=snpeff
#SBATCH -c 1
#SBATCH --time 12:00:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/reproductivegenes/slurmout/08_snpeff.out
#SBATCH -e /home/crq857/projects/reproductivegenes/slurmout/08_snpeff.err

#conda activate /projects/mjolnir1/apps/conda/snpeff-5.2

####### ANNOTATION ANALYSIS #########
VCF=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Geneticload_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_maxmiss1_minD4_onlywolf_Apr10_id.vcf
OUT=/projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/Focalwolves_geneticload.vcf
CONFIG=/home/crq857/projects/reproductivegenes/scripts/snpEff_copy.config

java -Xmx8g -jar /projects/mjolnir1/apps/snpeff-5.1d/snpEff.jar -c ${CONFIG} -v CanFam3.1.99 ${VCF} > ${OUT}

#!/usr/bin/env bash
#SBATCH --job-name=snpeff
#SBATCH -c 1
#SBATCH --time 12:00:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/reproductivegenes/slurmout/08_snpeff2.out
#SBATCH -e /home/crq857/projects/reproductivegenes/slurmout/08_snpeff2.err

module load perl
module load vcftools
#extract SNPs
SNPS=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/snp.list.nomissing
OUTd=/projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/Focalwolves_geneticload.vcf
OUTx=/projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/Focalwolves_geneticload_nomissing
#keep only snps in focal wolf pop
vcftools --vcf ${OUTd} --snps ${SNPS} --recode --recode-INFO-all --out ${OUTx}

/projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/Focalwolves_geneticload.vcf
list: /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/snp.list.nomissing
