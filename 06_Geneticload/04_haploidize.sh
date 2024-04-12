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
scp -r crq857@mjolnirhead01fl.unicph.domain:/projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/load_final.txt ~/Desktop

/projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/load_final.txt

module load perl
module load gsl/2.5
module load bcftools

fst_statistic_gweu_gwme_agw_ahuntdog_minDP3_maxmiss0.8_minQ20_w100kb_s25kb.csv
fst_statistic_gweu_gwme_agw_ahuntdog_minDP3_maxmiss0.8_minQ20_w25kb_s5kb.csv

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


## pseudo haploidize vcf files (i had to create a python virtual environment with specific dependencies but might just be our server) ##
gunzip /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK_fsc/Dhole.vcf.gz
gunzip /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK_fsc/Andeanfox.vcf.gz

VCFd=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK_fsc/Dhole_nomissing.recode.vcf
OUTd=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Dhole_pseudo_gatk_nomissing
VCFa=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK_fsc/Andeanfox.recode.vcf
OUTa=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Andeanfox_pseudo_gatk_nomissing

python3 pseudo_haploidize.py -v ${VCFd} -d 4 -o ${OUTd}
python3 pseudo_haploidize.py -v ${VCFa} -d 4 -o ${OUTa}




