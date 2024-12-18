#!/bin/bash -l
#SBATCH --job-name=roh
#SBATCH --array=1-38
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --time 10:00:00
#SBATCH --mem=4GB
#SBATCH -p high
#SBATCH -o /home/hennelly/Pakistan_Graywolf_Genomics/RunsofHomozygosity/ROH_bcftools/ANALYSIS_MARCH282022/slurmout/filteringstrigent_%A_%a.out
#SBATCH -e /home/hennelly/Pakistan_Graywolf_Genomics/RunsofHomozygosity/ROH_bcftools/ANALYSIS_MARCH282022/slurmout/filteringstrigent_%A_%a.err

echo "My SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID
CHR=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /home/hennelly/projects/GATK/scripts/chromosome_lengths.txt | cut -f1)
echo ${chr}

DIR=/home/hennelly/Pakistan_Graywolf_Genomics/RunsofHomozygosity/ROH_bcftools/ANALYSIS_MARCH282022/vcffiles_strigentdepth
GENEMAPDIR=/home/hennelly/Pakistan_Graywolf_Genomics/RunsofHomozygosity/ROH_bcftools/ANALYSIS_DEC152021/geneticmaps
OUTDIR=/home/hennelly/Pakistan_Graywolf_Genomics/RunsofHomozygosity/ROH_bcftools/ANALYSIS_MARCH282022/output_strigentdepth

module load bcftools

bcftools roh -G30 --AF-dflt 0.4 ${DIR}/Autosomes_gatkfilter_noindels_minQ30_goodsamples_maxmissing0.9_noastricks_biallelic_depthfilter_min5.3_max32_SRR12009568_Tehran_${CHR}.recode.vcf -I --genetic-map ${GENEMAPDIR}/mark4_cleaned_${CHR}.cf3.1.sorted_adjustedforROH.txt -o ${OUTDIR}/SRR12009568_Tehran_ROH_strigentdepth_${CHR}.txt 
