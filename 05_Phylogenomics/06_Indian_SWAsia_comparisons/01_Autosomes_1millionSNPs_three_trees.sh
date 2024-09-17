#!/usr/bin/env bash
#SBATCH --job-name=astral
#SBATCH -c 1
#SBATCH --time 1-1:10:00
#SBATCH --mem-per-cpu 30G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout/astral_March2024_chrX_nodogsLadakj_withNA3_noIndiaiqtree.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout/astral_March2024_chrX_nodogsLadakj_withNA3_noIndiaiqtree.err

#################################
## NO PAKISTAN AND NO SW ASIA ###
#################################

#Grab 1 million SNPs

module load perl
module load vcftools

OUTFILE_noSWAsia=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_VCFs_July262024/Autosomes_NO_ETHIOPIAN_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_withNAwolves_noPakistan_noSWAsia_Auug17

grep -v "#" ${OUTFILE_noSWAsia}.recode.vcf > ${OUTFILE_noSWAsia}_noheader.recode.vcf
grep "#" ${OUTFILE_noSWAsia}.recode.vcf > header_noSWAsia.txt
shuf -n 1000000 ${OUTFILE_noSWAsia}_noheader.recode.vcf > ${OUTFILE_noSWAsia}_1millionrandom.vcf
cat header_noSWAsia.txt ${OUTFILE_noSWAsia}_1millionrandom.vcf > ${OUTFILE_noSWAsia}_1millionrandom_header.vcf

OUTFILE_noSWAsia=Autosomes_NO_ETHIOPIAN_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_withNAwolves_noPakistan_noSWAsia_Auug17
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_VCFs_July262024/
#Convert to Phylip format
python /projects/mjolnir1/people/crq857/Geneflow_Dogs/bin/vcf2phylip/vcf2phylip.py -i ${OUTDIR}/${OUTFILE_noSWAsia}_1millionrandom_header.vcf --output-folder ${OUTDIR} --output-prefix ${OUTFILE_noSWAsia}_1million_phy -o AndeanFox

FILE=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_VCFs_July262024/Autosomes_NO_ETHIOPIAN_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_withNAwolves_noPakistan_noSWAsia_Auug17_1million_phy.min4.phy
#run IQtree 
/home/crq857/bin/iqtree-1.6.12-Linux/bin/iqtree -s ${FILE} -bb 1000 -nt AUTO -m MFP


#################################
## NO PAKISTAN AND NO INDIA ###
#################################
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_VCFs_July262024/
OUTFILE_noIndia=Autosomes_NO_ETHIOPIAN_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_withNAwolves_noPakistan_noIndia_Auug17_1million_phy.min4.phy

#remove Wolf_Portugal

/home/crq857/bin/iqtree-1.6.12-Linux/bin/iqtree -s ${OUTDIR}/${OUTFILE_noIndia} -bb 1000 -nt AUTO -m MFP


