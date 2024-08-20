#!/usr/bin/env bash
#SBATCH --job-name=astral
#SBATCH -c 1
#SBATCH --time 1-11:10:00
#SBATCH --mem-per-cpu 30G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout_Oct/astral_March2024_chrX_nodogsLadakj_withNA33323.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout_Oct/astral_March2024_chrX_nodogsLadakj_withNA33332.err

module load perl
module load vcftools

#Autosomes - no Pakistan, no India
#Autosomes - no Pakistan, no SW Asia
#Autosomes - no Pakistan and two individuals from low rec 2 SW Asia

#Autosomes - no Pakistan, no SW Asia
FILE=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_VCFs_July262024/Autosomes_NO_ETHIOPIAN_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_withNAwolves.recode.vcf
REMOVE_noSWAsia=/home/crq857/projects/Chapter2/files/July26_taxaremove_onlydogs_badwolves_Pakistan_SWAsia.txt
OUTFILE_noSWAsia=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_VCFs_July262024/Autosomes_NO_ETHIOPIAN_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_withNAwolves_noPakistan_noSWAsia_Auug17

vcftools --vcf ${FILE} --remove ${REMOVE} --out ${OUTFILE_noSWAsia} --recode --keep-INFO-all
grep -v "#" ${OUTFILE_noSWAsia}.recode.vcf > ${OUTFILE_noSWAsia}_noheader.recode.vcf
grep "#" ${OUTFILE_noSWAsia}.recode.vcf > header_noSWAsia.txt
shuf -n 1000000 ${OUTFILE_noSWAsia}_noheader.recode.vcf > ${OUTFILE_noSWAsia}_1millionrandom.vcf
cat header_noSWAsia.txt ${OUTFILE_noSWAsia}_1millionrandom.vcf > ${OUTFILE_noSWAsia}_1millionrandom_header.vcf

OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_VCFs_July262024
python /projects/mjolnir1/people/crq857/Geneflow_Dogs/bin/vcf2phylip/vcf2phylip.py -i ${OUTFILE_noSWAsia}_1millionrandom_header.vcf --output-folder ${OUTDIR} --output-prefix ${OUTFILE_noSWAsia}_1million_phy -o AndeanFox

/home/crq857/bin/iqtree-1.6.12-Linux/bin/iqtree -s ${OUTFILE_noSWAsia}_1million_phy.min4.phy -bb 1000 -nt AUTO -m MFP



# remove Indian
REMOVE_noIndia=/home/crq857/projects/Chapter2/files/July26_taxaremove_onlydogs_badwolves_Pakistan_Indian.txt
OUTFILE_noIndia=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_VCFs_July262024/Autosomes_NO_ETHIOPIAN_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_withNAwolves_noPakistan_noIndia_Auug17

vcftools --vcf ${FILE} --remove ${REMOVE_noIndia} --out ${OUTFILE_noIndia} --recode --keep-INFO-all
grep -v "#" ${OUTFILE_noIndia}.recode.vcf > ${OUTFILE_noIndia}_noheader.recode.vcf
grep "#" ${OUTFILE_noIndia}.recode.vcf > header_nonoIndia.txt
shuf -n 1000000 ${OUTFILE_noIndia}_noheader.recode.vcf > ${OUTFILE_noIndia}_1millionrandom.vcf
cat header_nonoIndia.txt ${OUTFILE_noIndia}_1millionrandom.vcf > ${OUTFILE_noIndia}_1millionrandom_header.vcf
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_VCFs_July262024
python /projects/mjolnir1/people/crq857/Geneflow_Dogs/bin/vcf2phylip/vcf2phylip.py -i ${OUTFILE_noIndia}_1millionrandom_header.vcf --output-folder ${OUTDIR} --output-prefix ${OUTFILE_noIndia}_1million_phy -o AndeanFox


/home/crq857/bin/iqtree-1.6.12-Linux/bin/iqtree -s ${OUTFILE_noIndia}_1million_phy.min4.phy -bb 1000 -nt AUTO -m MFP


#!/usr/bin/env bash
#SBATCH --job-name=twisst
#SBATCH -c 1
#SBATCH --time 04:10:00
#SBATCH --mem-per-cpu 15G
#SBATCH -o /home/crq857/projects/Chapter2/scripts_PhylogeneticsJuly/astral_extract3.out
#SBATCH -e /home/crq857/projects/Chapter2/scripts_PhylogeneticsJuly/astral_extract3.err

PHY=/projects/mjolnir1/people/crq857/Chapter2/twisstresults/Autosomes_regions_above0.2_IndianandSWAsia_header_phy.min4.phy

/home/crq857/bin/iqtree-1.6.12-Linux/bin/iqtree -s ${PHY} -bb 1000 -nt AUTO -m MFP


/projects/mjolnir1/people/crq857/Chapter2/twisstresults/Autosomes_regions_above0.2_IndianandSWAsia_header_phy.min4.phy.treefile

scp -r crq857@mjolnirgate.unicph.domain:/projects/mjolnir1/people/crq857/Chapter2/twisstresults/Autosomes_regions_above0.2_IndianandSWAsia_header_phy.min4.phy.treefile ~/Desktop


# remove pakistan and 2 close individuals
REMOVE_noPakand2cose=/home/crq857/projects/Chapter2/files/July26_taxaremove_onlydogs_badwolves_Pakistan_2closeSWAsia.txt
OUTFILE_noPakandclose=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_VCFs_July262024/Autosomes_NO_ETHIOPIAN_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_withNAwolves_noPakistan_nocloseSW_Auug17

vcftools --vcf ${FILE} --remove ${REMOVE_noPakand2cose} --out ${OUTFILE_noPakandclose} --recode --keep-INFO-all
grep -v "#" ${OUTFILE_noPakandclose}.recode.vcf > ${OUTFILE_noPakandclose}_noheader.recode.vcf
grep "#" ${OUTFILE_noPakandclose}.recode.vcf > header_noPak.txt
shuf -n 1000000 ${OUTFILE_noPakandclose}_noheader.recode.vcf > ${OUTFILE_noPakandclose}_1millionrandom.vcf
cat header_noPak.txt ${OUTFILE_noPakandclose}_1millionrandom.vcf > ${OUTFILE_noPakandclose}_1millionrandom_header.vcf
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_VCFs_July262024
python /projects/mjolnir1/people/crq857/Geneflow_Dogs/bin/vcf2phylip/vcf2phylip.py -i ${OUTFILE_noPakandclose}_1millionrandom_header.vcf --output-folder ${OUTDIR} --output-prefix ${OUTFILE_noPakandclose}_1million_phy -o AndeanFox


PHY=
/home/crq857/bin/iqtree-1.6.12-Linux/bin/iqtree -s ${OUTFILE_noPakandclose}_1million_phy.min4.phy -bb 1000 -nt AUTO -m MFP



