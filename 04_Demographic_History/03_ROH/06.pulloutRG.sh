########################################
### Pull out RG flags in the samples ###
########################################
#!/bin/bash -l
#SBATCH --job-name=roh
#SBATCH --array=1-24
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --time 10:00:00
#SBATCH --mem=4GB
#SBATCH -p high
#SBATCH -o /home/hennelly/Pakistan_Graywolf_Genomics/RunsofHomozygosity/ROH_bcftools/ANALYSIS_MARCH282022/slurmout/filteringstrigent_%A_%a.out
#SBATCH -e /home/hennelly/Pakistan_Graywolf_Genomics/RunsofHomozygosity/ROH_bcftools/ANALYSIS_MARCH282022/slurmout/filteringstrigent_%A_%a.err

echo "My SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID
SAMPLE=$(sed "${SLURM_ARRAY_TASK_ID}q;d" allsamplesnames.txt)
DIR=/home/hennelly/Pakistan_Graywolf_Genomics/RunsofHomozygosity/ROH_bcftools/ANALYSIS_MARCH282022/output_strigentdepth
## Combine a single individual
cat ${DIR}/${SAMPLE}_ROH* > ${DIR}/${SAMPLE}_ROH_autosomes.txt
## Pull out the ROHs
grep ^RG ${DIR}/${SAMPLE}_ROH_autosomes.txt > ${DIR}/${SAMPLE}_ROH_autosomes_RG.txt

########################################
### Cat all samples to have one file ###
########################################
cat *_autosomes_RG.txt > Allsamples_autosomes_RG.txt
