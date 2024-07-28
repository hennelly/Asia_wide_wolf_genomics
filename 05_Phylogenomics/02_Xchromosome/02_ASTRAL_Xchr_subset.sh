#!/usr/bin/env bash
#SBATCH --job-name=astral
#SBATCH -c 1
#SBATCH --time 01:10:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout_Oct/astral_chrX_extract_nodogsadmix_%A_%a.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout_Oct/astral_chrX_extract_nodogsadmix_%A_%a.err
#SBATCH --array=1-500%10

###########################
# No dogs, with NA wolves
###########################
BEDFILE=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/bedfiles_chrX/listfiles.txt)
DIR=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_chrX_July262026_input_July2024_nodogs_withNA
VCF=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_VCFs_July262024/July26chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs.recode.vcf 

module load bedtools

bedtools intersect -a ${VCF} -b /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/bedfiles_chrX/${BEDFILE} > ${DIR}/Final_July26_ChrX_allwolves_March2024_chrX_${BEDFILE}_allexceptdogs_withNA.vcf

###########################
#No admix wolves and dogs 
###########################
BEDFILE=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/bedfiles_chrX/listfiles.txt)

module load bedtools

VCF_noadmix=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_VCFs_July262024/July26chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_noLadakhPakistanTajWestAsia.recode.vcf
DIR_noadmix=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_chrX_July262026_input_July2024_noadmix

#No admix and dogs 
bedtools intersect -a ${VCF_noadmix} -b /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/bedfiles_chrX/${BEDFILE} > ${DIR_noadmix}/Final_July26_ChrX_allwolves_March2024_chrX_${BEDFILE}_noadmixwolves.vcf




## more bedfiles 


#!/usr/bin/env bash
#SBATCH --job-name=astral
#SBATCH -c 1
#SBATCH --time 01:10:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout_Oct/astral_chrX_extract_nodogsadmix_%A_%a.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout_Oct/astral_chrX_extract_nodogsadmix_%A_%a.err
#SBATCH --array=1-100%10

###########################
# No dogs, with NA wolves
###########################
BEDFILE=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/bedfiles_chrX_more/listfiles.txt)
DIR=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_chrX_July262026_input_July2024_nodogs_withNA_more
VCF=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_VCFs_July262024/July26chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs.recode.vcf 

module load bedtools

bedtools intersect -a ${VCF} -b /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/bedfiles_chrX/${BEDFILE} > ${DIR}/Final_July26_ChrX_allwolves_March2024_chrX_${BEDFILE}_allexceptdogs_withNA.vcf

###########################
#No admix wolves and dogs 
###########################
BEDFILE=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/bedfiles_chrX_more/listfiles.txt)

module load bedtools

VCF_noadmix=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_VCFs_July262024/July26chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_noLadakhPakistanTajWestAsia.recode.vcf
DIR_noadmix=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_chrX_July262026_input_July2024_noadmix_more

#No admix and dogs 
bedtools intersect -a ${VCF_noadmix} -b /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/bedfiles_chrX/${BEDFILE} > ${DIR_noadmix}/Final_July26_ChrX_allwolves_March2024_chrX_${BEDFILE}_noadmixwolves.vcf

