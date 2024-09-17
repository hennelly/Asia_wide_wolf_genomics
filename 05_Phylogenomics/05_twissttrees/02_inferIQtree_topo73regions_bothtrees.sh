#!/usr/bin/env bash
#SBATCH --job-name=ASTRAL
#SBATCH -c 1
#SBATCH --time 03:40:00
#SBATCH --mem-per-cpu 40G
#SBATCH -o /home/crq857/projects/Geneflow_Dogs/slurmout/vcf2python_fullgenome_Noadmixd_.out
#SBATCH -e /home/crq857/projects/Geneflow_Dogs/slurmout/vcf2python_fullgenome_noadmixd_.err
#SBATCH --array=1

##############
#add header ##
##############
OUTVCF=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_VCFs_July262024/Autosomes_NO_ETHIOPIAN_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_withNAwolves.recode.vcf

grep "#" ${OUTVCF} > header_fortwisst.txt

VCF=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_VCFs_July262024/Autosomes_NO_ETHIOPIAN_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_withNAwolves_twisst0.3
cat header_fortwisst.txt ${VCF} > /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_VCFs_July262024/Autosomes_NO_ETHIOPIAN_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_withNAwolves_twisst0.3_witheader.vcf

####################################
# Make a dataset without pakistan ##
####################################
VCF2=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_VCFs_July262024/Autosomes_NO_ETHIOPIAN_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_withNAwolves_twisst0.3_witheader.vcf
REMOVE=/home/crq857/projects/Chapter2/files/July26_taxaremove_onlydogs_badwolves_Pakistan.txt
OUTVCF2=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_VCFs_July262024/Autosomes_NO_ETHIOPIAN_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_withNAwolves_twisst0.3_witheader_noPakistan.vcf

module load perl
module load vcftools

vcftools --vcf ${VCF2} --remove ${REMOVE} --out ${OUTVCF2} --recode --keep-INFO-all

#####################
### convert to phy ##
######################
VCF2=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_VCFs_July262024/Autosomes_NO_ETHIOPIAN_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_withNAwolves_twisst0.3_witheader.vcf
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/twisstresults
OUTVCF2=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_VCFs_July262024/Autosomes_NO_ETHIOPIAN_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_withNAwolves_twisst0.3_witheader_noPakistan.vcf.recode.vcf

python /projects/mjolnir1/people/crq857/Geneflow_Dogs/bin/vcf2phylip/vcf2phylip.py -i ${VCF2} --output-folder ${OUTDIR} --output-prefix Autosomes_regions_above0.3_IndianandSWAsia_header_phy -o AndeanFox
python /projects/mjolnir1/people/crq857/Geneflow_Dogs/bin/vcf2phylip/vcf2phylip.py -i ${VCFnoPak} --output-folder ${OUTDIR} --output-prefix Autosomes_regions_above0.3_IndianandSWAsia_header_noPak_phy -o AndeanFox

##################
### run Iqtree ###
##################
PHY=/projects/mjolnir1/people/crq857/Chapter2/twisstresults/Autosomes_regions_above0.3_IndianandSWAsia_header_phy.min4.phy

/home/crq857/bin/iqtree-1.6.12-Linux/bin/iqtree -s ${PHY} -bb 1000 -nt AUTO -m MFP

PHY=/projects/mjolnir1/people/crq857/Chapter2/twisstresults/Autosomes_regions_above0.3_IndianandSWAsia_header_noPak_phy.min4.phy

/home/crq857/bin/iqtree-1.6.12-Linux/bin/iqtree -s ${PHY} -bb 1000 -nt AUTO -m MFP


scp -r crq857@mjolnirgate.unicph.domain:/projects/mjolnir1/people/crq857/Chapter2/twisstresults/Autosomes_regions_above0.3_IndianandSWAsia_header_noPak_phy.min4.phy.treefile ~/Desktop
scp -r crq857@mjolnirgate.unicph.domain:/projects/mjolnir1/people/crq857/Chapter2/twisstresults/Autosomes_regions_above0.3_IndianandSWAsia_header_phy.min4.phy.treefile ~/Desktop


/projects/mjolnir1/people/crq857/Chapter2/twisstresults/Autosomes_regions_above0.3_IndianandSWAsia_header_noPak_phy.min4.phy.treefile
/projects/mjolnir1/people/crq857/Chapter2/twisstresults/Autosomes_regions_above0.3_IndianandSWAsia_header_phy.min4.phy.treefile
