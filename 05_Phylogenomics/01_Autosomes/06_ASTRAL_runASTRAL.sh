#!/usr/bin/env bash
#SBATCH --job-name=spastral
#SBATCH -c 1
#SBATCH --time 10:10:00
#SBATCH --mem-per-cpu 5G
#SBATCH -o /home/crq857/projects/Geneflow_Dogs/slurmout/astral_auto_byspecies_atry2ll_feb9_annotate.out
#SBATCH -e /home/crq857/projects/Geneflow_Dogs/slurmout/astral_auto_byspecies_atry2ll_feb9_annotate.err

#991 trees
#cd /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/x_FINAL_July262024_phy_autosomes_nodogswithNA_noEth
#cat *treefile > listtreefiles_nodogswithNA_more_noEth_autosomes.txt

#cd /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/x_FINAL_July262024_input_autosomes_nodogswithNA_noEth_more
#cat *treefile > listtreefiles_nodogswithNA_more_noEth_autosomes_more.txt
#cat listtreefiles_nodogswithNA_more_noEth_autosomes_more.txt /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/x_FINAL_July262024_phy_autosomes_nodogswithNA_noEth/listtreefiles_nodogswithNA_more_noEth_autosomes.txt > listtreefiles_nodogswithNA_more_noEth_autosomes_all.txt 

TREE=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/x_FINAL_July262024_input_autosomes_nodogswithNA_noEth_more/listtreefiles_nodogswithNA_more_noEth_autosomes_all_1000.txt
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/x_FINAL_July262024_input_autosomes_nodogswithNA_noEth_more_results
java -jar /projects/mjolnir1/people/crq857/Chapter2/bin/ASTER/ASTRAL/astral.5.7.8.jar --branch-annotate 1 -i ${TREE} -o ${OUTDIR}/full_Aug1_autosomes_branchannotate.tre



#!/usr/bin/env bash
#SBATCH --job-name=xastral
#SBATCH -c 1
#SBATCH --time 10:10:00
#SBATCH --mem-per-cpu 5G
#SBATCH -o /home/crq857/projects/Geneflow_Dogs/slurmout/astral_auto_byspecies_atry2ll_feb9_annotateXchrall.out
#SBATCH -e /home/crq857/projects/Geneflow_Dogs/slurmout/astral_auto_byspecies_atry2ll_feb9_annotateXchrall.err

TREE=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/phyfiles_chrX_March2024/alltreefiles.txt

java -jar /projects/mjolnir1/people/crq857/Chapter2/bin/ASTER/ASTRAL/astral.5.7.8.jar --branch-annotate 1 -i ${TREE} -o full_Mar28_Xchrom_allindv_branchannotate.tre



alltreefiles.txt

