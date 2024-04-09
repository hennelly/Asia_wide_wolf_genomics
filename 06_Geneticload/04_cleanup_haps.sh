#!/usr/bin/env bash
#SBATCH --job-name=gload
#SBATCH -c 1
#SBATCH --time 00:10:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout_fsc/fsc_GATK_Genotype_4.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout_fsc/fsc_GATK_Genotype_4.err

sed s/\t$// your_file.bed

sed 's/\t$//' somefile.tsv

GATKBEDdho=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Dhole_pseudo_gatk.bed
GATKBEDand=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Andeanfox_pseudo_gatk.bed
Wolfbed=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/your_file.bed

module load bedtools

#replace * with N
sed -i -e 's/*/N/g' Andeanfox_pseudo_gatk2.bed
sed -i -e 's/*/N/g' Dhole_pseudo_gatk.bed

#select only the 4th column
cut -f 4 Andeanfox_pseudo_gatk2.bed > Andeanfox_pseudo_gatk_addN.bed
cut -f 4 Dhole_pseudo_gatk.bed > Dhole_pseudo_gatk_addN.bed

## the vcfs I have sometimes contain <NON_REF> for uncalled alleles that gatk thinks are non reference, but this messses up a later script, so I change them to N here, while also setting indels to N ##
awk '{if (/^</) {print "N"} else {if (length($1) != 1) {print "N"} else {if ($1 == "*") {print "N"} else {print}}}}'  Andeanfox_pseudo_gatk_addN.bed > Andeanfox_pseudo_gatk_addNfixed.txt
awk '{if (/^</) {print "N"} else {if (length($1) != 1) {print "N"} else {if ($1 == "*") {print "N"} else {print}}}}'  Dhole_pseudo_gatk_addN.bed > Dhole_pseudo_gatk_addNfixed.txt

## combine the filtered vcf .bed with the pseudohaploidized calls ##
paste your_file2.bed Andeanfox_pseudo_gatk_addNfixed.txt Dhole_pseudo_gatk_addNfixed.txt > combined_outgroups.txt

## assign the ancestral allele at each locus, and extract only the ones where both outgroups agree ##
python3 assign_ancestral.py -i /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/combined_outgroups.txt -c 5 -o /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/combined_outgroups

awk '($5!="N" && $6=="1.00" && $7==2){print $1":"$3"\t"$5}' /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/combined_outgroups.ancestral.txt > /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/combined_outgroups_agree.ancestral.txt

## add ancestral allele as an annotation ('AA=[base]') to the output vcf from snpeff (make sure chromosome names are the same in the vcf and .txt files) ##
perl addAA.pl /projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/Focalwolves_geneticload.vcf /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/combined_outgroups_agree.ancestral.txt /projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/Focalwolves_geneticload_anc.vcf




