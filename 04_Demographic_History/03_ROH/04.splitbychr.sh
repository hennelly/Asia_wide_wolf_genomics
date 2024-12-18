#!/bin/bash -l
#SBATCH --job-name=splitchr
#SBATCH --array=1-38
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --time 1-5:00:00
#SBATCH --mem=2GB
#SBATCH -p high
#SBATCH -o /home/hennelly/Pakistan_Graywolf_Genomics/RunsofHomozygosity/ROH_bcftools/ANALYSIS_MARCH282022/slurmout/splitchr_%A_%a.out
#SBATCH -e /home/hennelly/Pakistan_Graywolf_Genomics/RunsofHomozygosity/ROH_bcftools/ANALYSIS_MARCH282022/slurmout/splitchr_%A_%a.err

echo "My SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID

CHR=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /home/hennelly/projects/GATK/scripts/chromosome_lengths.txt | cut -f1)
VCF=/home/hennelly/Pakistan_Graywolf_Genomics/RunsofHomozygosity/ROH_bcftools/ANALYSIS_MARCH282022/vcffiles_strigentdepth/Autosomes_gatkfilter_noindels_minQ30_goodsamples_maxmissing0.9_noastricks_biallelic_depthfilter_min5.3_max32_SRR12009568_Tehran.recode.vcf
OURDIR=/home/hennelly/Pakistan_Graywolf_Genomics/RunsofHomozygosity/ROH_bcftools/ANALYSIS_MARCH282022/bychr_strigentdepth
module load vcftools

vcftools --vcf ${VCF} --chr ${CHR} --out ${DIR}/Autosomes_gatkfilter_noindels_minQ30_goodsamples_maxmissing0.9_noastricks_biallelic_depthfilter_min5.3_max32_SRR12009568_Tehran_${CHR} --recode --recode-INFO-all 
