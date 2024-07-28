#!/usr/bin/env bash
#SBATCH --job-name=spastral
#SBATCH -c 1
#SBATCH --time 3:10:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Geneflow_Dogs/slurmout/astral_autosomes_byspecies_all_chrX.out
#SBATCH -e /home/crq857/projects/Geneflow_Dogs/slurmout/astral_autosomes_byspecies_all_chrX.err

#make a list of the treefiles 
#cd /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/phyfiles_chrX_July2024_all
# cat *treefile > listtreefiles_nodogswithNA.txt

conda activate /projects/mjolnir1/apps/conda/astral-2.2
module load jdk

## NO DOGS WITH NA 
TREE=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_chrX_July262026_phyfiles_nodogs_withNA/listtreefiles_nodogswithNA.txt
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_chrX_July262026_phyfiles_nodogs_withNA_results

java -jar /projects/mjolnir1/people/crq857/Chapter2/bin/ASTER/ASTRAL/astral.5.7.8.jar -i ${TREE} -o ${OUTDIR}/July28_2024_chrX_nodogs_withNA.tre



## NO ADMIX
TREE=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_chrX_July262026_phyfiles_noadmix/listtreefiles_Xchr_noadmix.txt
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_chrX_July262026_phyfiles_noadmix_results

java -jar /projects/mjolnir1/people/crq857/Chapter2/bin/ASTER/ASTRAL/astral.5.7.8.jar -i ${TREE} -o ${OUTDIR}/July28_2024_chrX_noadmix.tre


