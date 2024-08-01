#!/usr/bin/env bash
#SBATCH --job-name=astral
#SBATCH -c 1
#SBATCH --time 1:10:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Geneflow_Dogs/slurmout/bedtoolsrandom_again2.out
#SBATCH -e /home/crq857/projects/Geneflow_Dogs/slurmout/bedtoolsrandom.err

GENOME=/projects/mjolnir1/people/crq857/Chapter2/ref/canFam31.fasta.fai

module load bedtools 

bedtools random -g ${GENOME} -l 20000 -n 5000 

#Grab X chromosome regions
grep "chrX" /home/crq857/projects/Geneflow_Dogs/slurmout/bedtoolsrandom_again.out >  /home/crq857/projects/Geneflow_Dogs/slurmout/bedtoolsrandom_again_chrX.out #44 regions
grep "chrX" /home/crq857/projects/Geneflow_Dogs/slurmout/bedtoolsrandom_again2.out >  /home/crq857/projects/Geneflow_Dogs/slurmout/bedtoolsrandom_again_chrX2.out #42 regions
cat   /home/crq857/projects/Geneflow_Dogs/slurmout/bedtoolsrandom_again_chrX.out  /home/crq857/projects/Geneflow_Dogs/slurmout/bedtoolsrandom_again_chrX2.out > more_randomregions_chrX.txt

#clean up output - take only first three columns

awk '{print $1,$2,$3}' randomregion_list_auto.bed > randomregion_list_auto2.bed
tr ' ' \\t < randomregion_list_auto2.bed > randomregion_list_auto2_tabbed.bed

#write each line of bed file as its own file

FILE=/home/crq857/projects/Chapter2/scripts_PhylogeneticsJuly/more_randomregions_chrX_tabbed.bed

awk '!/^$/{print  > "File_"NR".txt" }' ${FILE}


awk '!/^$/{print  > "File_"NR".txt" }' randomregion_list_auto2_tabbed.bed
