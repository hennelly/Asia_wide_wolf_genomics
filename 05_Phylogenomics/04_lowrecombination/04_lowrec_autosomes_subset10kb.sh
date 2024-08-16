#!/usr/bin/env bash
#SBATCH --job-name=ASTRAL
#SBATCH -c 1
#SBATCH --time 01:40:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Geneflow_Dogs/slurmout/AWvcf2python_July2024_noadmix_chrX_noadmix_%A_%a.out
#SBATCH -e /home/crq857/projects/Geneflow_Dogs/slurmout/AWvcf2python_July2024_noadmix_chrX_noadmix_%A_%a.err
#SBATCH --array=1-606%10


LINE1=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /home/crq857/projects/Chapter2/scripts_PhylogeneticsJuly/lowrec_Autosomes_ranges.txt  | awk '{print $1}')
LINE2=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /home/crq857/projects/Chapter2/scripts_PhylogeneticsJuly/lowrec_Autosomes_ranges.txt  | awk '{print $2}')
NUMBER=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /home/crq857/projects/Chapter2/scripts_PhylogeneticsJuly/lowrec_Autosomes_ranges.txt  | awk '{print $3}')
FILE=/projects/mjolnir1/people/crq857/Chapter2/06_Datasets/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAL_lowrecombination_AUG15.vcf.recode.vcf
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/Aug14_lowrecautosomes/input

grep "#" ${FILE} > header_autorec.txt
grep -v "#" ${FILE} > /projects/mjolnir1/people/crq857/Chapter2/06_Datasets/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAL_lowrecombination_AUG15_noheader.vcf


FILE2=/projects/mjolnir1/people/crq857/Chapter2/06_Datasets/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAL_lowrecombination_AUG14_noheader.vcf

sed -n "${LINE1},${LINE2}p;${LINE2}q" ${FILE2} > ${OUTDIR}/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAL_lowrecombination_AUG14_${NUMBER}

cat header_autorec.txt ${OUTDIR}/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAL_lowrecombination_AUG14_${NUMBER}_final > ${OUTDIR}/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAL_lowrecombination_AUG14_${NUMBER}_final_header.vcf


# take random 1million SNPs 
FILE2=/projects/mjolnir1/people/crq857/Chapter2/06_Datasets/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAL_lowrecombination_AUG15_noheader.vcf
FILE3=/projects/mjolnir1/people/crq857/Chapter2/06_Datasets/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAL_lowrecombination_AUG15_noheader_1million.vcf
take off header 

shuf -n 1000000 ${FILE2} > ${FILE3}







