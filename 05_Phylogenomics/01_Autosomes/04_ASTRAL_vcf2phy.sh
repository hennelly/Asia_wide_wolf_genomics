#!/usr/bin/env bash
#SBATCH --job-name=ASTRAL
#SBATCH -c 1
#SBATCH --time 03:40:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Geneflow_Dogs/slurmout/vcf2python_fullgenome_Noadmix_%A_%a.out
#SBATCH -e /home/crq857/projects/Geneflow_Dogs/slurmout/vcf2python_fullgenome_noadmix_%A_%a.err
#SBATCH --array=1-1000%10

#conda activate /projects/mjolnir1/apps/conda/python-3.5.6

## NO DOGS WITH NA WOLVES

#cd /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/x_FINAL_July262024_input_autosomes_nodogswithNA_noEth/
#ls > listfiles_autosomes_nodogswithNA_noEth.txt

FILE=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/x_FINAL_July262024_input_autosomes_nodogswithNA_noEth/listfiles_autosomes_nodogswithNA_noEth.txt)

DIR=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/x_FINAL_July262024_input_autosomes_nodogswithNA_noEth
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/x_FINAL_July262024_phy_autosomes_nodogswithNA_noEth
VCF=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_VCFs_July262024/Autosomes_NO_ETHIOPIAN_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_withNAwolves.recode.vcf

#add header 
grep "#" /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_VCFs_July262024/Autosomes_NO_ETHIOPIAN_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_withNAwolves.recode.vcf > header_noEth_nodogs.txt
cat header_noEth_nodogs.txt ${DIR}/${FILE} > ${DIR}/${FILE}_header.vcf

python /projects/mjolnir1/people/crq857/Geneflow_Dogs/bin/vcf2phylip/vcf2phylip.py -i ${DIR}/${FILE}_header.vcf --output-folder ${OUTDIR} --output-prefix ${FILE}_phy -o Dhole_BerlinZoo

## NO ADMIX 

#cd /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/x_FINAL_July262024_input_autosomes_noadmix_noEth/
#ls > /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/x_FINAL_July262024_input_autosomes_noadmix_noEth/listfiles_autosomes_noadmix_noEth.txt

FILE=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/x_FINAL_July262024_input_autosomes_noadmix_noEth/listfiles_autosomes_noadmix_noEth.txt)

DIR=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/x_FINAL_July262024_input_autosomes_noadmix_noEth
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/x_FINAL_July262024_phy_autosomes_noadmix_noEth
VCF=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_VCFs_July262024/Autosomes_NO_ETHIOPIAN_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_withNAwolves.recode.vcf

#add header 
#grep "#" /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_VCFs_July262024/Autosomes_NO_ETHIOPIAN_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_noNAwolvesLadakhPakistanTajWestAsia.recode.vcf > header_autosomes_noadmix_noEth.txt
cat header_autosomes_noadmix_noEth.txt ${DIR}/${FILE} > ${DIR}/${FILE}_header.vcf

python /projects/mjolnir1/people/crq857/Geneflow_Dogs/bin/vcf2phylip/vcf2phylip.py -i ${DIR}/${FILE}_header.vcf --output-folder ${OUTDIR} --output-prefix ${FILE}_phy -o Dhole_BerlinZoo













