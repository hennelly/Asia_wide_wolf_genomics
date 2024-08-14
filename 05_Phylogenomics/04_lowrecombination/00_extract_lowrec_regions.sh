#!/usr/bin/env bash
#SBATCH --job-name=lowrec
#SBATCH -c 1
#SBATCH --time 00:30:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout/lowrecombination.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout/lowrecombination.err

SITES=/home/crq857/projects/Chapter2/files/FINISHED_WHOLEGENOMEbelow0.2_FINAL_copy_fixed.bed
VCF=/projects/mjolnir1/people/crq857/Chapter2/06_Datasets/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl.recode.vcf
OUTVCF=/projects/mjolnir1/people/crq857/Chapter2/06_Datasets/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAL_lowrecombination.vcf
REMOVE=/home/crq857/projects/Chapter2/files/July26_taxaremove_onlydogs_badwolves.txt
OUTVCF2=/projects/mjolnir1/people/crq857/Chapter2/06_Datasets/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_lowrecombination_noEthnodogs

module load perl
module load vcftools

## X chromosome
module load perl
module load vcftools

vcftools --gzvcf ${XVCF} --bed ${XSITES} --out ${XOUTVCF} --recode --keep-INFO-all

REMOVE=/home/crq857/projects/Chapter2/files/July26_taxaremove_onlydogs_badwolves.txt
OUTVCF=/projects/mjolnir1/people/crq857/Chapter2/06_Datasets/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_lowrecombination_noEthnodogs

vcftools --vcf ${XOUTVCF}.recode.vcf --remove ${REMOVE} --out ${OUTVCF} --recode --keep-INFO-all

#Autosomes

AUTO=/projects/mjolnir1/people/crq857/Chapter2/06_Datasets/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAL_lowrecombination.vcf.recode.vcf
REMOVE=/home/crq857/projects/Chapter2/files/July26_taxaremove_onlydogs_badwolves.txt
OUTVCF_AUTO=/projects/mjolnir1/people/crq857/Chapter2/06_Datasets/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAL_lowrecombination_AUG14

#vcftools --vcf ${VCF} --bed ${SITES} --out ${OUTVCF} --recode --keep-INFO-all
vcftools --vcf ${AUTO} --remove ${REMOVE} --out ${OUTVCF_AUTO} --recode --keep-INFO-all

###take 1 million random samples 
#remove header
grep "#" ${OUTVCF_AUTO}.recode.vcf > header_AUG14.txt
grep -v "#" ${OUTVCF_AUTO}.recode.vcf > ${OUTVCF_AUTO}_noheader.recode.vcf
shuf -n 1000000 ${OUTVCF_AUTO}_noheader.recode.vcf > ${OUTVCF_AUTO}_noheader_1millionsites.recode.vcf
cat header_AUG14.txt ${OUTVCF_AUTO}_noheader_1millionsites.recode.vcf > ${OUTVCF_AUTO}_FINAL_AUG14_1millionsites.recode.vcf






#!/usr/bin/env bash
#SBATCH --job-name=lowrec
#SBATCH -c 1
#SBATCH --time 00:30:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout/lowrecombination.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout/lowrecombination.err

SITES=/home/crq857/projects/Chapter2/files/FINISHED_WHOLEGENOMEbelow0.2_FINAL_copy_fixed.bed
VCF=/projects/mjolnir1/people/crq857/Chapter2/06_Datasets/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl.recode.vcf
OUTVCF=/projects/mjolnir1/people/crq857/Chapter2/06_Datasets/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAL_lowrecombination.vcf
REMOVE=/home/crq857/projects/Chapter2/files/July26_taxaremove_onlydogs_badwolves.txt
OUTVCF2=/projects/mjolnir1/people/crq857/Chapter2/06_Datasets/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_lowrecombination_noEthnodogs

module load perl
module load vcftools

#Autosomes
#vcftools --vcf ${VCF} --bed ${SITES} --out ${OUTVCF} --recode --keep-INFO-all
vcftools --vcf ${OUTVCF}.recode.vcf --remove ${REMOVE} --out ${OUTVCF2} --recode --keep-INFO-all




