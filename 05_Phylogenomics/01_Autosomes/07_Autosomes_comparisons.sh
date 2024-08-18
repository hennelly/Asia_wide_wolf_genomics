#!/usr/bin/env bash
#SBATCH --job-name=astral
#SBATCH -c 1
#SBATCH --time 1-11:10:00
#SBATCH --mem-per-cpu 3G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout_Oct/astral_March2024_chrX_nodogsLadakj_withNA3.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout_Oct/astral_March2024_chrX_nodogsLadakj_withNA3.err

module load perl
module load vcftools

#Autosomes - no Pakistan, no India
#Autosomes - no Pakistan, no SW Asia
#Autosomes - no Pakistan and two individuals from low rec 2 SW Asia

#Autosomes - no Pakistan, no SW Asia
FILE=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_VCFs_July262024/Autosomes_NO_ETHIOPIAN_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_withNAwolves.recode.vcf
REMOVE_noSWAsia=/home/crq857/projects/Chapter2/files/July26_taxaremove_onlydogs_badwolves_Pakistan_SWAsia.txt
OUTFILE_noSWAsia=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_VCFs_July262024/Autosomes_NO_ETHIOPIAN_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_withNAwolves_noPakistan_noSWAsia_Auug17

vcftools --vcf ${FILE} --remove ${REMOVE} --out ${OUTFILE_noSWAsia} --recode --keep-INFO-all


REMOVE_noIndia=/home/crq857/projects/Chapter2/files/July26_taxaremove_onlydogs_badwolves_Pakistan_Indian.txt
OUTFILE_noIndia=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_VCFs_July262024/Autosomes_NO_ETHIOPIAN_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_withNAwolves_noPakistan_noIndia_Auug17

vcftools --vcf ${FILE} --remove ${REMOVE_noIndia} --out ${OUTFILE_noIndia} --recode --keep-INFO-all


REMOVE_noPakand2cose=/home/crq857/projects/Chapter2/files/July26_taxaremove_onlydogs_badwolves_Pakistan_2closeSWAsia.txt
OUTFILE_noPakandclose=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_VCFs_July262024/Autosomes_NO_ETHIOPIAN_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_withNAwolves_noPakistan_nocloseSW_Auug17

vcftools --vcf ${FILE} --remove ${REMOVE_noPakand2cose} --out ${OUTFILE_noPakandclose} --recode --keep-INFO-all



## Subset 

 
#!/usr/bin/env bash
#SBATCH --job-name=astral
#SBATCH -c 1
#SBATCH --time 01:10:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout_Oct/astral_extract_%A_%a.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout_Oct/astral_extract_%A_%a.err
#SBATCH --array=10-1000%10

BEDFILE=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/bedfiles/listfiles.txt)
DIR=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/Aug17
VCF=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_VCFs_July262024/Autosomes_NO_ETHIOPIAN_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_withNAwolves_noPakistan_noSWAsia_Auug17.recode.vcf

module load bedtools

# no dogs with NA wolves
bedtools intersect -a ${VCF} -b /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/bedfiles/${BEDFILE} > ${DIR}/July262024_Autosomes_nodogs_withNAwolves_noEthiopian_noPakistan_noSWAsia_Auug17_${BEDFILE}.vcf
