#!/usr/bin/env bash
#SBATCH --job-name=ASTRAL
#SBATCH -c 1
#SBATCH --time 01:40:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Geneflow_Dogs/slurmout/iqtree_Xchr_run_%A_%a.out
#SBATCH -e /home/crq857/projects/Geneflow_Dogs/slurmout/iqtree_Xchr_run_%A_%a.err
#SBATCH --array=1-500%10

#conda activate /projects/mjolnir1/apps/conda/python-3.5.6
#cd /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/phyfiles_chrX_July2024_all
#ls  *phy > listfileschrX.txt_phy.txt

PHY=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/phyfiles_chrX_July2024_all/filelist_chrX_all_phy.txt)

/home/crq857/bin/iqtree-1.6.12-Linux/bin/iqtree -s  /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/phyfiles_chrX_July2024_all/${PHY} -bb 1000 -nt AUTO

### NO ADMIX 

#cd /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/phyfiles_chrX_July2024_noadmix
#ls  *phy > listfileschrX.txt_phy.txt

PHY=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/phyfiles_chrX_July2024_noadmix/filelist_July2024chrX_noadmix_phy.txt)

/home/crq857/bin/iqtree-1.6.12-Linux/bin/iqtree -s  /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/phyfiles_chrX_July2024_all/${PHY} -bb 1000 -nt AUTO




#!/usr/bin/env bash
#SBATCH --job-name=ASTRAL
#SBATCH -c 1
#SBATCH --time 00:40:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Geneflow_Dogs/slurmout/vcf2python_July2024_noadmix_chrX_%A_%a.out
#SBATCH -e /home/crq857/projects/Geneflow_Dogs/slurmout/vcf2python_July2024_noadmix_chrX_%A_%a.err
#SBATCH --array=1-500%10

#conda activate /projects/mjolnir1/apps/conda/python-3.5.6

FILE=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/input_chrX_July2024_noadmix/filelist_July2024_noadmix.txt)

# ALL except dogs
DIR=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/input_chrX_July2024_noadmix
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/phyfiles_chrX_July2024_noadmix
VCFnoadmix=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/VCFs_July2024//projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/VCFs_July2024/chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_noLadakhPakistanTajWestAsia.recode.vcf
#grab and add header
grep "#" ${VCFnoadmix} > /home/crq857/projects/Chapter2/files/header_chrXJuly2024_noadmix.txt
cat /home/crq857/projects/Chapter2/files/header_chrXJuly2024_noadmix.txt ${DIR}/${FILE} > ${DIR}/${FILE}_header.vcf

python /projects/mjolnir1/people/crq857/Geneflow_Dogs/bin/vcf2phylip/vcf2phylip.py -i ${DIR}/${FILE}_header.vcf --output-folder ${OUTDIR} --output-prefix ${FILE}_phy -o Dhole_BerlinZoo












