#!/usr/bin/env bash
#SBATCH --job-name=ASTRAL
#SBATCH -c 1
#SBATCH --time 01:40:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Geneflow_Dogs/slurmout/AWvcf2python_July2024_noadmix_chrX_noadmix.out
#SBATCH -e /home/crq857/projects/Geneflow_Dogs/slurmout/AWvcf2python_July2024_noadmix_chrX_noadmix.err
#SBATCH --array=1


LINE1=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /home/crq857/projects/Chapter2/scripts_PhylogeneticsJuly/lowrec_Autosomes_ranges.txt  | awk '{print $1}')
LINE2=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /home/crq857/projects/Chapter2/scripts_PhylogeneticsJuly/lowrec_Autosomes_ranges.txt  | awk '{print $2}')
NUMBER=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /home/crq857/projects/Chapter2/scripts_PhylogeneticsJuly/lowrec_Autosomes_ranges.txt  | awk '{print $3}')
FILE=/projects/mjolnir1/people/crq857/Chapter2/06_Datasets/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAL_lowrecombination_AUG14.recode.vcf
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/Aug14_lowrecautosomes/input

awk 'NR >= $LINE1 && NR <= $LINE2' ${FILE} > ${OUTDIR}/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAL_lowrecombination_AUG14_${NUMBER}

head -n ${LINE1} ${FILE} > ${OUTDIR}/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAL_lowrecombination_AUG14_${NUMBER}
tail -n ${LINE2} ${OUTDIR}/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAL_lowrecombination_AUG14_${NUMBER} > ${OUTDIR}/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAL_lowrecombination_AUG14_${NUMBER}_final
