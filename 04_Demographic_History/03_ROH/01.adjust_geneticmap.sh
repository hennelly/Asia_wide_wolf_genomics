#!/bin/bash -l
#SBATCH --job-name=altergeneticmap
#SBATCH --array=1-38
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --time 3-10:00:00
#SBATCH --mem=8GB
#SBATCH -p high
#SBATCH -o /home/hennelly/Pakistan_Graywolf_Genomics/RunsofHomozygosity/ROH_bcftools/ANALYSIS_DEC152021/slurmout/altergeneticmap__%A_%a.out
#SBATCH -e /home/hennelly/Pakistan_Graywolf_Genomics/RunsofHomozygosity/ROH_bcftools/ANALYSIS_DEC152021/slurmout/altergeneticmap__%A_%a.err

echo "My SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID
chr=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /home/hennelly/Pakistan_Graywolf_Genomics/SNPcalling/scripts_Aug242021_nopriors/chromosomes.txt | cut -f1)
echo ${chr}

 awk '{$1=""}1' /home/hennelly/fastqfiles/dog_recomb/canFam3.1/maps/mark4_cleaned_${chr}.cf3.1.sorted.txt | awk '{$1=$1}1' > /home/hennelly/Pakistan_Graywolf_Genomics/RunsofHomozygosity/ROH_bcftools/ANALYSIS_DEC152021/geneticmaps/mark4_cleaned_${chr}.cf3.1.sorted_adjustedforROH.txt
