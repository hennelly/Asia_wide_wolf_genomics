#!/usr/bin/env bash
#SBATCH --job-name=astral
#SBATCH -c 1
#SBATCH --time 1-11:10:00
#SBATCH --mem-per-cpu 3G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout/astral_March2024_chrX_nodogs_withNA.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout/astral_March2024_chrX_nodogs_withNA.err

module load perl
module load vcftools

#Autosomes - all samples except dogs

VCF=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.recode.vcf.vcf.gz
REMOVE=/home/crq857/projects/Chapter2/files/July26_taxaremove_onlydogs_badwolves.txt
OUT=/projects/psg/people/crq857/Chapter2/05_Phylogenomics_Jan2025/FINAL_VCFs_2025/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_withNAwolves_Jan2025

vcftools --gzvcf ${VCF} --remove ${REMOVE} --recode --recode-INFO-all --out ${OUT}

## Remove additional wolves and the golden jackal from Israel 

VCF=/projects/psg/people/crq857/Chapter2/05_Phylogenomics_Jan2025/FINAL_VCFs_2025/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_withNAwolves_Jan2025.recode.vcf 
REMOVE=REVISION_remove.txt
OUT=/projects/psg/people/crq857/Chapter2/05_Phylogenomics_Jan2025/FINAL_VCFs_2025/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_withNAwolves_REVISION

vcftools --vcf ${VCF} --remove ${REMOVE} --recode --recode-INFO-all --out ${OUT}



#Autosomes - no Pakistan, Ladakh, Tajikistan, West Asia, no dogs
VCFnoadmix=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.recode.vcf.vcf.gz
REMOVEnoadmix=/home/crq857/projects/Chapter2/files/July26_taxaremove_onlydogs_admixwolves.txt
OUTnoadmix=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_VCFs_July262024/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_noNAwolvesLadakhPakistanTajWestAsia

vcftools --gzvcf ${VCFnoadmix} --remove ${REMOVEnoadmix} --recode --recode-INFO-all --out ${OUTnoadmix}





########################
### REVISION ###########
########################


#!/usr/bin/env bash
sbatch --partition=cpuqueue \
--qos=normal \
--cpus-per-task=4 \
--mem=10G \
-o /home/crq857/projects/Asianwolves_revision/slurmout/Autosomes_remove.out \
-e /home/crq857/projects/Asianwolves_revision/slurmout/Autosomes_remove.err \
--time=1-00:00:00 \
--wrap="vcftools --vcf /projects/psg/people/crq857/Chapter2/05_Phylogenomics_Jan2025/FINAL_VCFs_2025/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_withNAwolves_Jan2025.recode.vcf  --remove /home/crq857/projects/Chapter2/files/REVISION_remove.txt --recode --recode-INFO-all --out /projects/psg/people/crq857/Chapter2/05_Phylogenomics_Jan2025/FINAL_VCFs_2025/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_withNAwolves_REVISION"



