#!/bin/bash -l
#SBATCH --job-name=depthfilter
#SBATCH --nodes 1
#SBATCH --array=1-6
#SBATCH --ntasks 1
#SBATCH --time 12:00:00
#SBATCH --mem=8GB
#SBATCH -p high
#SBATCH -o /home/hennelly/Pakistan_Graywolf_Genomics/RunsofHomozygosity/ROH_bcftools/ANALYSIS_MARCH282022/slurmout/depthfilter_%A_%a.out
#SBATCH -e /home/hennelly/Pakistan_Graywolf_Genomics/RunsofHomozygosity/ROH_bcftools/ANALYSIS_MARCH282022/slurmout/depthfilter_%A_%a.err

echo "My SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID
R1=$(sed "${SLURM_ARRAY_TASK_ID}q;d" maxdepth_lowcoveage.txt)
R2=$(sed "${SLURM_ARRAY_TASK_ID}q;d" samples_lowcoverage.txt)
R3=$(sed "${SLURM_ARRAY_TASK_ID}q;d" mindepth_lowcoverage.txt)

module load vcftools

vcftools --vcf /home/hennelly/Pakistan_Graywolf_Genomics/FinalDatasetMar232022/PCAdataset/Autosomes_gatkfilter_noindels_minQ30_graywolf_mac3_noastricks_adjusted.vcf --minDP ${R3} --maxDP ${R1} --indv ${R2} --min-alleles 2 --max-alleles 2 --out /home/hennelly/Pakistan_Graywolf_Genomics/RunsofHomozygosity/ROH_bcftools/ANALYSIS_MARCH282022/vcffiles_strigentdepth/Autosomes_gatkfilter_noindels_minQ30_goodsamples_maxmissing0.9_noastricks_biallelic_depthfilter_min${R3}_max${R1}_${R2} --recode --recode-INFO-all
