#!/usr/bin/env bash
#SBATCH --job-name=spastral
#SBATCH -c 1
#SBATCH --time 3:10:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Geneflow_Dogs/slurmout/astral_autosomes_byspecies_all_chrX.out
#SBATCH -e /home/crq857/projects/Geneflow_Dogs/slurmout/astral_autosomes_byspecies_all_chrX.err

#make a list of the treefiles 
#cd /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/phyfiles_chrX_July2024_all
# cat *treefile > listtreefiles.txt

conda activate /projects/mjolnir1/apps/conda/astral-2.2
module load jdk

TREE=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/phyfiles_chrX_July2024_all/listtreefiles.txt
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/chrX_ASTRAL_results_July2024

java -jar /projects/mjolnir1/people/crq857/Chapter2/bin/ASTER/ASTRAL/astral.5.7.8.jar -i ${TREE} -o ${OUTDIR}/chrX_July2024_allsamples_exceptdogs.tre


/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/phyfiles_chrX_July2024_all/ChrX_allwolves_March2024_chrX_File_104.txt_allexceptdogsJuly2024.vcf_phy.min4.phy.treefile
