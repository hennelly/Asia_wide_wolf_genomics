#!/usr/bin/env bash
#SBATCH --job-name=twisst
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --time 2:00:00
#SBATCH --mem=1GB
#SBATCH -o /home/hennelly/Asianwolves/slurmout/Bedfile.out
#SBATCH -e /home/hennelly/Asianwolves/slurmout/Bedfile.err
#SBATCH -p high

## Prepare the twisst 
perl -pe 's/^\s*//g;  s/\s/_/; s/^\S+\s+\S+/ID/ if $.==1' anika.txt



#################################
#################################
### LOW RECOMBINATION REGIONS ###
#################################
#################################

# combine all chromosomes files to obtain a single autosomal dataset for bed file. 


# Make a bed file with start and end points
#Take first three columns 
TWIST=/group/ctbrowngrp2/hennelly/hennelly/Asianwolves/phyml/autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final.phyml.data_noheader2.tsv
OUT=/group/ctbrowngrp2/hennelly/hennelly/Asianwolves/phyml/autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final.phyml.data_noheader_bed

 awk '{print $1, $2, $3}' ${TWIST} > ${OUT}

 awk '{print $1, $2, $3}' /group/ctbrowngrp2/hennelly/hennelly/Asianwolves/phyml/autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final.phyml.data_noheader2.tsv > /group/ctbrowngrp2/hennelly/hennelly/Asianwolves/phyml/autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final.phyml.data_noheader_bed
#Make tabbed 
OUT2=/group/ctbrowngrp2/hennelly/hennelly/Asianwolves/phyml/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_July21.phyml_tabbed_bed
tr " " "\t" < ${OUT} > ${OUT2}
tr " " "\t" < /group/ctbrowngrp2/hennelly/hennelly/Asianwolves/phyml/autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final.phyml.data_noheader_bed > /group/ctbrowngrp2/hennelly/hennelly/Asianwolves/phyml/autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final.phyml.data_noheader_tabbed_bed

#fix recombination rate file 
#bedtools should have chrom, start, end in header

REC=/home/hennelly/Redwolf/files/FINISHED_WHOLEGENOMEbelow0.2_FINAL_copy_bedtools.bed
OUTREC=/home/hennelly/Redwolf/files/FINISHED_WHOLEGENOMEbelow0.2_FINAL_copy_bedtools_final.bed
awk 'OFS="\t" {if (NR > 5) $1="chr"$1; print}' ${REC} > ${OUTREC}

#take X chromosome
chrX=/home/hennelly/Redwolf/files/FINISHED_WHOLEGENOMEbelow0.2_FINAL_copy_bedtools_final_chrX.bed
grep -v "chrX" ${OUTREC} > ${chrX}

grep -v "chrX"  /home/hennelly/Redwolf/files/FINISHED_WHOLEGENOMEbelow0.2_FINAL_copy_bedtools_final.bed >   /home/hennelly/Redwolf/files/FINISHED_AUTOSOMESbelow0.2_FINAL_copy_bedtools_final.bed
grep -v "chrX"  /home/hennelly/Redwolf/files/FINISHED_WHOLEGENOMEabove2_May10_2021_new_tabbedfinal_bedtools_tabbed.bed >   /home/hennelly/Redwolf/files/FINISHED_WHOLEGENOMEabove2_May10_2021_new_tabbedfinal_bedtools_tabbed.bed_final



#bedtools intercept 
module load bedtools2/2.30.0
OUTFINAL=/home/hennelly/Redwolf/files/FINISHED_WHOLEGENOMEbelow0.2_FINAL_copy_bedtools_locations_windows_twisst.bed 
bedtools intersect -a ${chrX} -b ${OUT2} >  ${OUTFINAL}

bedtools intersect -a     /home/hennelly/Redwolf/files/FINISHED_WHOLEGENOMEabove2_May10_2021_new_tabbedfinal_bedtools_tabbed.bed_final -b /group/ctbrowngrp2/hennelly/hennelly/Asianwolves/phyml/autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final.phyml.data_noheader_tabbed_bed >  /group/ctbrowngrp2/hennelly/hennelly/Asianwolves/phyml/autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final.phyml.data_noheader_tabbed_bed_intersect_highrec

#################################################################
# add row for combining chr and start so I can better interest #
#################################################################

#recombination rate file
perl -pe 's/^\s*//g;  s/\s/_/; s/^\S+\s+\S+/ID/ if $.==1' /home/hennelly/Redwolf/files/FINISHED_AUTOSOMESbelow0.2_FINAL_copy_bedtools_final.bed2 > /home/hennelly/Redwolf/files/FINISHED_AUTOSOMESbelow0.2_FINAL_copy_bedtools_final.bed2_intersect
#autosomalfile

No HEADER TWISST: Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_twisst_CentralAsia_July22_withRussia_noheader2
No HEADER PHYML: Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final.phyml.data_noheader.tsv

paste /group/ctbrowngrp2/hennelly/hennelly/Asianwolves/phyml/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final.phyml.data_noheader.tsv /group/ctbrowngrp2/hennelly/hennelly/Asianwolves/output/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_twisst_CentralAsia_July22_withRussia_noheader2 > /group/ctbrowngrp2/hennelly/hennelly/Asianwolves/output/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_twisst_CentralAsia_July22_withRussia_noheader2_combined

perl -pe 's/^\s*//g;  s/\s/_/; s/^\S+\s+\S+/ID/ if $.==1' /group/ctbrowngrp2/hennelly/hennelly/Asianwolves/output/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_twisst_CentralAsia_July22_withRussia_noheader2_combined > /group/ctbrowngrp2/hennelly/hennelly/Asianwolves/output/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_twisst_CentralAsia_July22_withRussia_noheader2_combined_forintersect


#match columns in the bedtools intersect file to the total file from twisst chrX
OUTFINAL=/home/hennelly/Redwolf/files/FINISHED_AUTOSOMESbelow0.2_FINAL_copy_bedtools_final.bed2_intersect 
WINDOWSREC=/home/hennelly/Redwolf/files/FINISHED_AUTOSOMESbelow0.2_FINAL_copy_bedtools_final.bed2_intersect_forawk
OUTFINAL_list=/group/ctbrowngrp2/hennelly/hennelly/Asianwolves/phyml/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_July21.phyml_lowrecwindows_FINAL

awk '{print $2}' ${OUTFINAL} > ${WINDOWSREC}
awk '{print $1}' /home/hennelly/Redwolf/files/FINISHED_AUTOSOMESbelow0.2_FINAL_copy_bedtools_final.bed2_intersect > /home/hennelly/Redwolf/files/FINISHED_AUTOSOMESbelow0.2_FINAL_copy_bedtools_final.bed2_intersect_forawk
#prepare file dataset
DIR=/group/ctbrowngrp2/hennelly/hennelly/Asianwolves/phyml
DIR2=/group/ctbrowngrp2/hennelly/hennelly/Asianwolves/output

paste ${DIR}/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_July21.phyml.data.tsv ${DIR2}/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_July21.phyml_twisst_EastAsia_noeheader > /group/ctbrowngrp2/hennelly/hennelly/Asianwolves/output/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_July21.phyml_twisst_EastAsia_withpositions 

TWIST=/group/ctbrowngrp2/hennelly/hennelly/Asianwolves/output/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_twisst_CentralAsia_July22_withRussia_noheader2_combined_forintersect
OUTFINAL_list=/group/ctbrowngrp2/hennelly/hennelly/Asianwolves/phyml/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_July21.phyml_lowrecwindows_FINAL

grep -F -f ${WINDOWSREC} ${TWIST}  > ${OUTFINAL_list}

grep -F -f /home/hennelly/Redwolf/files/FINISHED_AUTOSOMESbelow0.2_FINAL_copy_bedtools_final.bed2_intersect_forawk /group/ctbrowngrp2/hennelly/hennelly/Asianwolves/output/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_twisst_CentralAsia_July22_withRussia_noheader2_combined_forintersect > /group/ctbrowngrp2/hennelly/hennelly/Asianwolves/output/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_twisst_CentralAsia_July22_withRussia_noheader2_combined_forintersectfinal_LOWREC

#add header 
grep "topo1" gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_July21.phyml_twisst_EastAsia > header.txt
/group/ctbrowngrp2/hennelly/hennelly/Asianwolves/phyml/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_July21.phyml_lowrecwindows_FINAL_header.csv
#move to local desktop 


#################################
#################################
### HIGH RECOMBINATION REGIONS ###
#################################
#################################

#above 2 cM/Mb 
/group/ctbrowngrp2/hennelly/hennelly/projects/fd_statistic/recombination_datasets/FINISHED_WHOLEGENOMEabove2_May10_2021_new_tabbedfinal.bed
/group/ctbrowngrp2/hennelly/hennelly/projects/fd_statistic/recombination_datasets/FINISHED_WHOLEGENOMEbetween0.2and2_May10_2021_new_finaltabbed.bed

#fix recombination rate file 
#bedtools should have chrom, chromStart, chromEnd in header

HIGHREC=/group/ctbrowngrp2/hennelly/hennelly/projects/fd_statistic/recombination_datasets/FINISHED_WHOLEGENOMEabove2_May10_2021_new_tabbedfinal.bed
OUTRECHIGH=/home/hennelly/Redwolf/files/FINISHED_WHOLEGENOMEabove2_May10_2021_new_tabbedfinal_bedtools.bed
awk 'OFS="\t" {if (NR > 5) $1="chr"$1; print}' ${HIGHREC} > ${OUTRECHIGH}

OUTRECHIGHtab=/home/hennelly/Redwolf/files/FINISHED_WHOLEGENOMEabove2_May10_2021_new_tabbedfinal_bedtools_tabbed.bed
tr " " "\t" < ${OUTRECHIGH} > ${OUTRECHIGHtab}

#take X chromosome
chrXHIGH=/home/hennelly/Redwolf/files/FINISHED_WHOLEGENOMEabove2_May10_2021_new_tabbedfinal_bedtools_tabbed_chrX.bed
grep "chrX" ${OUTRECHIGHtab} > ${chrXHIGH}

#bedtools intercept 
module load bedtools2/2.30.0
OUT2=/group/ctbrowngrp2/hennelly/hennelly/Asianwolves/phyml/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_July21.phyml_tabbed_bed
OUTFINALHIGH=/home/hennelly/Redwolf/files/FINISHED_WHOLEGENOMEabove2_FINAL_copy_bedtools_locations_windows_twisst.bed 
bedtools intersect -a ${chrXHIGH} -b ${OUT2} >  ${OUTFINALHIGH}

#match columns in the bedtools intersect file to the total file from twisst chrX
WINDOWSRECHIGH=/home/hennelly/Redwolf/files/FINISHED_WHOLEGENOMEabove2_FINAL_copy_bedtools_locations_windows_twisst_forawk.bed 

awk '{print $2}' ${OUTFINALHIGH} > ${WINDOWSRECHIGH}

#prepare file dataset
TWIST=/group/ctbrowngrp2/hennelly/hennelly/Asianwolves/output/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_July21.phyml_twisst_EastAsia_withpositions
OUTFINAL_listHIGH=/group/ctbrowngrp2/hennelly/hennelly/Asianwolves/phyml/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_July21.phyml_highrecwindows_FINAL

grep -F -f ${WINDOWSRECHIGH} ${TWIST}  > ${OUTFINAL_listHIGH}

#add header 
#grep "topo1" gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_July21.phyml_twisst_EastAsia > /group/ctbrowngrp2/hennelly/hennelly/Asianwolves/output/header.txt

cat /group/ctbrowngrp2/hennelly/hennelly/Asianwolves/output/header.txt /group/ctbrowngrp2/hennelly/hennelly/Asianwolves/phyml/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_July21.phyml_highrecwindows_FINAL > /group/ctbrowngrp2/hennelly/hennelly/Asianwolves/phyml/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_July21.phyml_HIGHrecwindows_FINAL_header.csv
#move to local desktop 

####################################
####################################
### MEDIUM RECOMBINATION REGIONS ###
####################################
####################################
#bedtools should have chrom, chromStart, chromEnd in header

MEDREC=/group/ctbrowngrp2/hennelly/hennelly/projects/fd_statistic/recombination_datasets/FINISHED_WHOLEGENOMEbetween0.2and2_May10_2021_new_finaltabbed.bed
OUTRECMED=/home/hennelly/Redwolf/files/FINISHED_WHOLEGENOMEbetween0.2and2_May10_2021_new_tabbedfinal_bedtools.bed
awk 'OFS="\t" {if (NR > 5) $1="chr"$1; print}' ${MEDREC} > ${OUTRECMED}

OUTRECMEDtab=/home/hennelly/Redwolf/files/FINISHED_WHOLEGENOMEbetween0.2and2_May10_2021_new_tabbedfinal_bedtools_tabbed.bed
tr " " "\t" < ${OUTRECMED} > ${OUTRECMEDtab}

#take X chromosome
chrXMED=/home/hennelly/Redwolf/files/FINISHED_WHOLEGENOMEbetween0.2and2_May10_2021_new_tabbedfinal_bedtools_tabbed_chrX.bed
grep "chrX" ${OUTRECMEDtab} > ${chrXMED}

#bedtools intercept 
module load bedtools2/2.30.0
OUT2=/group/ctbrowngrp2/hennelly/hennelly/Asianwolves/phyml/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_July21.phyml_tabbed_bed
OUTFINALMED=/home/hennelly/Redwolf/files/FINISHED_WHOLEGENOMEbetween0.2and2_FINAL_copy_bedtools_locations_windows_twisst.bed 
bedtools intersect -a ${chrXMED} -b ${OUT2} >  ${OUTFINALMED}

#match columns in the bedtools intersect file to the total file from twisst chrX
WINDOWSRECMED=/home/hennelly/Redwolf/files/FINISHED_WHOLEGENOMEbetween0.2and2_FINAL_copy_bedtools_locations_windows_twisst_forawk.bed 

awk '{print $2}' ${OUTFINALMED} > ${WINDOWSRECMED}

#prepare file dataset
TWIST=/group/ctbrowngrp2/hennelly/hennelly/Asianwolves/output/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_July21.phyml_twisst_EastAsia_withpositions
OUTFINAL_listMED=/group/ctbrowngrp2/hennelly/hennelly/Asianwolves/phyml/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_July21.phyml_MEDIUMrecwindows_FINAL

grep -F -f ${WINDOWSRECMED} ${TWIST}  > ${OUTFINAL_listMED}

#add header 
#grep "topo1" gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_July21.phyml_twisst_EastAsia > /group/ctbrowngrp2/hennelly/hennelly/Asianwolves/output/header.txt

cat /group/ctbrowngrp2/hennelly/hennelly/Asianwolves/output/header.txt /group/ctbrowngrp2/hennelly/hennelly/Asianwolves/phyml/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_July21.phyml_MEDIUMrecwindows_FINAL > /group/ctbrowngrp2/hennelly/hennelly/Asianwolves/phyml/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_July21.phyml_MEDIUMrecwindows_FINAL_header.csv

#move to local desktop 
scp -r hennelly@farm.cse.ucdavis.edu:/group/ctbrowngrp2/hennelly/hennelly/Asianwolves/output/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_twisst_CentralAsia_July22_withRussia_noheader2_combined_forintersectfinal_LOWREC   ~/Desktop
scp -r hennelly@farm.cse.ucdavis.edu:/group/ctbrowngrp2/hennelly/hennelly/Asianwolves/phyml/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_July21.phyml_MEDIUMrecwindows_FINAL_header.csv   ~/Desktop


OUTFINAL_listHIGH=/group/ctbrowngrp2/hennelly/hennelly/Asianwolves/phyml/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_July21.phyml_HIGHrecwindows_FINAL_header.csv
OUTFINAL_listLOW=/group/ctbrowngrp2/hennelly/hennelly/Asianwolves/phyml/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_July21.phyml_lowrecwindows_FINAL_header.csv
OUTFINAL_listMED=/group/ctbrowngrp2/hennelly/hennelly/Asianwolves/phyml/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_July21.phyml_MEDIUMrecwindows_FINAL_header.csv
