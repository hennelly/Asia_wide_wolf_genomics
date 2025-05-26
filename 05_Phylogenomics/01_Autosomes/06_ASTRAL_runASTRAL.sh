#!/usr/bin/env bash
#SBATCH --job-name=astral
#SBATCH -c 1
#SBATCH --time 10:10:00
#SBATCH --mem-per-cpu 5G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout/astral.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout/astral.err

#991 trees
#cd /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics_Jan2025/Astral_Autosomes/VCFs_final/
#cat *treefile > listtreefiles_Feb4_2024_autosomes.txt

#cd /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/x_FINAL_July262024_input_autosomes_nodogswithNA_noEth_more
#cat *treefile > listtreefiles_nodogswithNA_more_noEth_autosomes_more.txt
#cat listtreefiles_nodogswithNA_more_noEth_autosomes_more.txt /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/x_FINAL_July262024_phy_autosomes_nodogswithNA_noEth/listtreefiles_nodogswithNA_more_noEth_autosomes.txt > listtreefiles_nodogswithNA_more_noEth_autosomes_all.txt 

TREE=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics_Jan2025/Astral_Autosomes/VCFs_final/listtreefiles_Feb4_2024_autosomes.txt
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics_Jan2025/Astral_Autosomes/VCFs_final_autosomes

java -jar /projects/mjolnir1/people/crq857/Chapter2/bin/ASTER/ASTRAL/astral.5.7.8.jar --branch-annotate 1 -i ${TREE} -o ${OUTDIR}/full_Feb4_2024_autosomes_branchannotate.tre






