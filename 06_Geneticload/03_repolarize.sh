The script is written as a function in R. Once codes are downloaded, go to R and source the script "vcf-repo.R". Then run the function repolarizeVCF(vcf_file="mydata.vcf", outgroup_indv="sample01", out_file="repolarized.vcf").

source(path/tofile/here.R)


vcf-repo.R


awk '($4!="N" && $5=="1.00" && $6==2){print $1":"$3"\t"$4}' combined_outgroups.ancestral.txt > combined_outgroups_agree.ancestral.txt

OUTd=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Dhole
OUTa=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Andeanfox
OUTw=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Geneticload_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_maxmiss1_minD4_onlywolf

#!/usr/bin/env bash
#SBATCH --job-name=snpeff
#SBATCH -c 1
#SBATCH --time 00:10:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/reproductivegenes/slurmout/annotate.out
#SBATCH -e /home/crq857/projects/reproductivegenes/slurmout/annotate.err

module load perl
module load vcftools

SNPS=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/snp.list2
VCFd=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Dhole_ID
VCFa=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Andeanfox_ID
OUTd=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Dhole_ID_final
OUTa=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Andeanfox_ID_final

#keep only snps in focal wolf pop
vcftools --vcf ${VCFd} --snps ${SNPS} --recode --recode-INFO-all --out ${OUTd}
vcftools --vcf ${VCFa} --snps ${SNPS} --recode --recode-INFO-all --out ${OUTa}


/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/snp.list2
/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/snp.list




#!/usr/bin/env bash
#SBATCH --job-name=snpeff
#SBATCH -c 1
#SBATCH --time 00:10:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/reproductivegenes/slurmout/annotate.out
#SBATCH -e /home/crq857/projects/reproductivegenes/slurmout/annotate.err

module load perl
module load gsl/2.5
module load bcftools

VCFd=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Dhole.recode.vcf
VCFa=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Andeanfox.recode.vcf
OUTd=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Dhole_ID
OUTa=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Andeanfox_ID

bcftools annotate --set-id '%CHROM\_%POS' ${VCFd} -o ${OUTd}
bcftools annotate --set-id '%CHROM\_%POS' ${VCFa} -o ${OUTa}


9145957



#create snplist
awk '{ print $3 }' Geneticload_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_maxmiss1_minD4_onlywolf_ID.vcf > snp.list2



#!/usr/bin/env bash
#SBATCH --job-name=gload
#SBATCH -c 1
#SBATCH --time 04:00:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/reproductivegenes/slurmout/hap.out
#SBATCH -e /home/crq857/projects/reproductivegenes/slurmout/hap.err

## pseudo haploidize vcf files (i had to create a python virtual environment with specific dependencies but might just be our server) ##

VCFd=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Dhole_ID_final.recode.vcf
OUTd=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Dhole_pseudo

python3 pseudo_haploidize.py -v ${VCFd} -d 4 -o ${OUTd}


/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Andeanfox_ID_final.recode.vcf
/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Dhole_ID_final.recode.vcf




18026876 SNPs







