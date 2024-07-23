#!/usr/bin/env bash
#SBATCH --job-name=twisst
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --time 2:00:00
#SBATCH --mem=1GB
#SBATCH -o /home/hennelly/Asianwolves/slurmout/Bedfile.out
#SBATCH -e /home/hennelly/Asianwolves/slurmout/Bedfile.err
#SBATCH -p high


DONE FILES 
OUTFINAL_listHIGH=/group/ctbrowngrp2/hennelly/hennelly/Asianwolves/phyml/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_July21.phyml_highrecwindows_FINAL_header.csv
OUTFINAL_listLOW=/group/ctbrowngrp2/hennelly/hennelly/Asianwolves/phyml/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_July21.phyml_lowrecwindows_FINAL_header.csv
OUTFINAL_listMED=/group/ctbrowngrp2/hennelly/hennelly/Asianwolves/phyml/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_July21.phyml_MEDIUMrecwindows_FINAL_header.csv

#################################
#################################
### LOW RECOMBINATION REGIONS ###
#################################
#################################
# Make a bed file with start and end points

#prepare file dataset
DIR=/group/ctbrowngrp2/hennelly/hennelly/Asianwolves/phyml
DIR2=/group/ctbrowngrp2/hennelly/hennelly/Asianwolves/output

paste ${DIR}/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_July21.phyml.data.tsv ${DIR2}/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_July21.phyml_twisst_CentralAsia_July22_withRussia_nohead > /group/ctbrowngrp2/hennelly/hennelly/Asianwolves/output/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_July21.phyml_twisst_CentralAsia_July22_withRussia_noheader_withpositions 

WINDOWSREC=/home/hennelly/Redwolf/files/FINISHED_WHOLEGENOMEbelow0.2_FINAL_copy_bedtools_locations_windows_twisst_forawk.bed 
TWIST=/group/ctbrowngrp2/hennelly/hennelly/Asianwolves/output/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_July21.phyml_twisst_CentralAsia_July22_withRussia_noheader_withpositions 
OUTFINAL_list=/group/ctbrowngrp2/hennelly/hennelly/Asianwolves/phyml/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_July21.phyml_lowrecwindows_FINAL_CENTRALASIA_withRussia

grep -F -f ${WINDOWSREC} ${TWIST}  > ${OUTFINAL_list}

#add header 
grep "topo1" ${DIR2}/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_July21.phyml_twisst_CentralAsia > ${DIR2}/header_CA.txt
cat  ${DIR2}/header_CA.txt ${OUTFINAL_list} > /group/ctbrowngrp2/hennelly/hennelly/Asianwolves/phyml/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_July21.phyml_lowrecwindows_FINAL_CENTRALASIA_header_withRussia.csv 

#################################
#################################
### HIGH RECOMBINATION REGIONS ###
#################################
#################################

#prepare file dataset
WINDOWSRECHIGH=/home/hennelly/Redwolf/files/FINISHED_WHOLEGENOMEabove2_FINAL_copy_bedtools_locations_windows_twisst_forawk.bed 
TWIST=/group/ctbrowngrp2/hennelly/hennelly/Asianwolves/output/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_July21.phyml_twisst_CentralAsia_July22_withRussia_noheader_withpositions 
OUTFINAL_listHIGH=/group/ctbrowngrp2/hennelly/hennelly/Asianwolves/phyml/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_July21.phyml_highrecwindows_FINAL_CENTRALASIA_withRussia

grep -F -f ${WINDOWSRECHIGH} ${TWIST}  > ${OUTFINAL_listHIGH}

#add header 
#grep "topo1" gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_July21.phyml_twisst_EastAsia > /group/ctbrowngrp2/hennelly/hennelly/Asianwolves/output/header.txt

cat ${DIR2}/header_CA.txt ${OUTFINAL_listHIGH} > /group/ctbrowngrp2/hennelly/hennelly/Asianwolves/phyml/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_July21.phyml_highrecwindows_FINAL_CENTRALASIA_header_withRussia.csv
#move to local desktop 

####################################
####################################
### MEDIUM RECOMBINATION REGIONS ###
####################################
####################################
#bedtools should have chrom, chromStart, chromEnd in header


#prepare file dataset
WINDOWSRECMED=/home/hennelly/Redwolf/files/FINISHED_WHOLEGENOMEbetween0.2and2_FINAL_copy_bedtools_locations_windows_twisst_forawk.bed 
TWIST=/group/ctbrowngrp2/hennelly/hennelly/Asianwolves/output/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_July21.phyml_twisst_CentralAsia_July22_withRussia_noheader_withpositions 
OUTFINAL_listMED=/group/ctbrowngrp2/hennelly/hennelly/Asianwolves/phyml/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_July21.phyml_MEDIUMrecwindows_FINAL_CENTRALASIA_withRussia

grep -F -f ${WINDOWSRECMED} ${TWIST}  > ${OUTFINAL_listMED}

#add header 
#grep "topo1" gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_July21.phyml_twisst_EastAsia > /group/ctbrowngrp2/hennelly/hennelly/Asianwolves/output/header.txt

cat ${DIR2}/header_CA.txt ${OUTFINAL_listMED} > /group/ctbrowngrp2/hennelly/hennelly/Asianwolves/phyml/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_July21.phyml_MEDIUMrecwindows_FINAL_CENTRALASIA_header_withRussia.csv

#move to local desktop 
scp -r hennelly@farm.cse.ucdavis.edu:/group/ctbrowngrp2/hennelly/hennelly/Asianwolves/phyml/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_July21.phyml_highrecwindows_FINAL_CENTRALASIA_header_withRussia.csv   ~/Desktop
scp -r hennelly@farm.cse.ucdavis.edu:/group/ctbrowngrp2/hennelly/hennelly/Asianwolves/phyml/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_July21.phyml_MEDIUMrecwindows_FINAL_CENTRALASIA_header_withRussia.csv   ~/Desktop
scp -r hennelly@farm.cse.ucdavis.edu:/group/ctbrowngrp2/hennelly/hennelly/Asianwolves/phyml/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_July21.phyml_lowrecwindows_FINAL_CENTRALASIA_header_withRussia.csv   ~/Desktop


OUTFINAL_listHIGH=/group/ctbrowngrp2/hennelly/hennelly/Asianwolves/phyml/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_July21.phyml_HIGHrecwindows_FINAL_header.csv
OUTFINAL_listLOW=/group/ctbrowngrp2/hennelly/hennelly/Asianwolves/phyml/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_July21.phyml_lowrecwindows_FINAL_header.csv
OUTFINAL_listMED=/group/ctbrowngrp2/hennelly/hennelly/Asianwolves/phyml/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_July21.phyml_MEDIUMrecwindows_FINAL_header.csv
