#!/usr/bin/env bash
#SBATCH --job-name=ASTRAL
#SBATCH -c 1
#SBATCH --time 00:40:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Geneflow_Dogs/slurmout/vcf2python_July2024_noadmix_chrX_%A_%a.out
#SBATCH -e /home/crq857/projects/Geneflow_Dogs/slurmout/vcf2python_July2024_noadmix_chrX_%A_%a.err
#SBATCH --array=1-500%10

#conda activate /projects/mjolnir1/apps/conda/python-3.5.6

#cd /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/input_chrX_July2024_all
# ls > filelist_July2024_all.txt

FILE=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/input_chrX_July2024_all/filelist_July2024_all.txt)

# ALL except dogs 
DIR=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/input_chrX_July2024_all
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/phyfiles_chrX_July2024_all
VCF=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/VCFs_July2024/chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs.recode.vcf 

#grab and add header 
grep "#" ${VCF} > /home/crq857/projects/Chapter2/files/header_chrXJuly2024_all.txt
cat /home/crq857/projects/Chapter2/files/header_chrXJuly2024_all.txt ${DIR}/${FILE} > ${DIR}/${FILE}_header.vcf
rm ${DIR}/${FILE}

python /projects/mjolnir1/people/crq857/Geneflow_Dogs/bin/vcf2phylip/vcf2phylip.py -i ${DIR}/${FILE}_header.vcf --output-folder ${OUTDIR} --output-prefix ${FILE}_phy -o Dhole_BerlinZoo

#########################
#########################
# No admix and dogs 
#########################
#########################
#cd /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/input_chrX_July2024_noadmix
# ls > filelist_July2024_noadmix.txt

FILE=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/input_chrX_July2024_noadmix/filelist_July2024_noadmix.txt)

# ALL except dogs 
DIR=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/input_chrX_July2024_noadmix
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/phyfiles_chrX_July2024_noadmix
VCFnoadmix=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/VCFs_July2024//projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/VCFs_July2024/chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_noLadakhPakistanTajWestAsia
.recode.vcf
#grab and add header 
grep "#" ${VCFnoadmix} > /home/crq857/projects/Chapter2/files/header_chrXJuly2024_noadmix.txt
cat /home/crq857/projects/Chapter2/files/header_chrXJuly2024_noadmix.txt ${DIR}/${FILE} > ${DIR}/${FILE}_header.vcf
rm ${DIR}/${FILE}

python /projects/mjolnir1/people/crq857/Geneflow_Dogs/bin/vcf2phylip/vcf2phylip.py -i ${DIR}/${FILE}_header.vcf --output-folder ${OUTDIR} --output-prefix ${FILE}_phy -o Dhole_BerlinZoo


