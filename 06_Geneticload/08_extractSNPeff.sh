#!/usr/bin/env bash
#SBATCH --job-name=gload
#SBATCH -c 1
#SBATCH --time 04:00:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/reproductivegenes/slurmout/hapd.out
#SBATCH -e /home/crq857/projects/reproductivegenes/slurmout/hapd.err

module load perl
module load vcftools

# add label 

module load perl
module load gsl/2.5
module load bcftools

VCFd=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK_fsc/Dhole.vcf
OUTd=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK_fsc/Dhole_ID.vcf
VCFa=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK_fsc/Andeanfox.vcf
OUTa=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK_fsc/Andeanfox_ID.vcf

bcftools annotate --set-id '%CHROM\_%POS' ${VCFd} -o ${OUTd}
bcftools annotate --set-id '%CHROM\_%POS' ${VCFa} -o ${OUTa}


## Extract locations from no missing wolf vcf 
SNP=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/snp.list.nomissing

VCFdx=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK_fsc/Dhole_ID.vcf
OUTdx=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK_fsc/Dhole_nomissing
VCFax=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK_fsc/Andeanfox.vcf
OUTax=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK_fsc/Andeanfox_nomissing

#keep only snps in focal wolf pop
vcftools --vcf ${VCFdx} --snps ${SNPS} --recode --recode-INFO-all --out ${OUTdx}
vcftools --vcf ${VCFax} --snps ${SNPS} --recode --recode-INFO-all --out ${OUTax}


module load perl
module load vcftools
#extract SNPs
SNPS=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/snp.list.nomissing
OUTd=/projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/Focalwolves_geneticload_ID.vcf
OUTx=/projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/Focalwolves_geneticload_ID_nomissing
#keep only snps in focal wolf pop
vcftools --vcf ${OUTd} --snps ${SNPS} --recode --recode-INFO-all --out ${OUTx}


