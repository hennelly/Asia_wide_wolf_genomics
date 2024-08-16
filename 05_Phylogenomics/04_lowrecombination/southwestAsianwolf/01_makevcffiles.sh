#!/usr/bin/env bash
#SBATCH --job-name=lowrec
#SBATCH -c 1
#SBATCH --time 11:30:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout/xlowrecombinationXchrPaknoIndian.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout/xlowrecombinationXchrPaknoIndian.err

XOUTVCF=/projects/mjolnir1/people/crq857/Chapter2/06_Datasets/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_lowrecombination
REMOVE=/home/crq857/projects/Chapter2/files/July26_taxaremove_onlydogs_badwolves_Pakistan.txt
OUTVCF=/projects/mjolnir1/people/crq857/Chapter2/06_Datasets/2gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_lowrecombination_noEthnodogs_noPakistan
DIR=/projects/mjolnir1/people/crq857/Chapter2/06_Datasets/

module load perl
module load vcftools

#Remove Pakistan wolves 

vcftools --vcf ${XOUTVCF}.recode.vcf --remove ${REMOVE} --out ${OUTVCF} --recode --keep-INFO-all

python /projects/mjolnir1/people/crq857/Geneflow_Dogs/bin/vcf2phylip/vcf2phylip.py -i ${OUTVCF}.recode.vcf --output-folder ${OUTDIR} --output-prefix 2gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_lowrecombination_noEthnodogs_noPakistan
 -o AndeanFox

PHY=2gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_lowrecombination_noEthnodogs_noPakistan.min4.phy
/home/crq857/bin/iqtree-1.6.12-Linux/bin/iqtree -s ${DIR}/${PHY} -bb 1000 -nt AUTO -m MFP

#########################################
#########################################
#Remove Pakistan and SW Asian wolves   ##
#########################################
#########################################
XOUTVCF=/projects/mjolnir1/people/crq857/Chapter2/06_Datasets/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_lowrecombination
REMOVE=/home/crq857/projects/Chapter2/files/July26_taxaremove_onlydogs_badwolves_Pakistan_SWAsia.txt
OUTVCF=/projects/mjolnir1/people/crq857/Chapter2/06_Datasets/2gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_lowrecombination_noEthnodogs_noPakistan_noSWAsia
DIR=/projects/mjolnir1/people/crq857/Chapter2/06_Datasets/

module load perl
module load vcftools

#Remove Pakistan wolves 

vcftools --vcf ${XOUTVCF}.recode.vcf --remove ${REMOVE} --out ${OUTVCF} --recode --keep-INFO-all

python /projects/mjolnir1/people/crq857/Geneflow_Dogs/bin/vcf2phylip/vcf2phylip.py -i ${OUTVCF}.recode.vcf --output-folder ${DIR} --output-prefix 2gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_lowrecombination_noEthnodogs_noPakistan_noSWAsia
 -o AndeanFox

PHY=2gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_lowrecombination_noEthnodogs_noPakistan_noSWAsia.min4.phy
/home/crq857/bin/iqtree-1.6.12-Linux/bin/iqtree -s ${DIR}/${PHY} -bb 1000 -nt AUTO -m MFP


#########################################
#########################################
#Remove Pakistan and two SWAsia wolves   ##
#########################################
#########################################
XOUTVCF=/projects/mjolnir1/people/crq857/Chapter2/06_Datasets/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_lowrecombination
REMOVE=/home/crq857/projects/Chapter2/files/July26_taxaremove_onlydogs_badwolves_Pakistan_2closeSWAsia.txt
OUTVCF=/projects/mjolnir1/people/crq857/Chapter2/06_Datasets/2gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_lowrecombination_noEthnodogs_noPakistan_no2closeSWAsia
DIR=/projects/mjolnir1/people/crq857/Chapter2/06_Datasets/

module load perl
module load vcftools

#Remove Pakistan wolves 

vcftools --vcf ${XOUTVCF}.recode.vcf --remove ${REMOVE} --out ${OUTVCF} --recode --keep-INFO-all

python /projects/mjolnir1/people/crq857/Geneflow_Dogs/bin/vcf2phylip/vcf2phylip.py -i ${OUTVCF}.recode.vcf --output-folder ${DIR} --output-prefix 2gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_lowrecombination_noEthnodogs_noPakistan_no2closeSWAsia
 -o AndeanFox

PHY=2gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_lowrecombination_noEthnodogs_noPakistan_no2closeSWAsia.min4.phy
/home/crq857/bin/iqtree-1.6.12-Linux/bin/iqtree -s ${DIR}/${PHY} -bb 1000 -nt AUTO -m MFP

#########################################
#########################################
#Remove Pakistan and Indian wolves   ##
#########################################
#########################################
XOUTVCF=/projects/mjolnir1/people/crq857/Chapter2/06_Datasets/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_lowrecombination
REMOVE=/home/crq857/projects/Chapter2/files/July26_taxaremove_onlydogs_badwolves_Pakistan_Indian.txt
OUTVCF=/projects/mjolnir1/people/crq857/Chapter2/06_Datasets/2gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_lowrecombination_noEthnodogs_noPakistan_noIndian
DIR=/projects/mjolnir1/people/crq857/Chapter2/06_Datasets/

module load perl
module load vcftools

#Remove Pakistan wolves 

vcftools --vcf ${XOUTVCF}.recode.vcf --remove ${REMOVE} --out ${OUTVCF} --recode --keep-INFO-all

python /projects/mjolnir1/people/crq857/Geneflow_Dogs/bin/vcf2phylip/vcf2phylip.py -i ${OUTVCF}.recode.vcf --output-folder ${DIR} --output-prefix 2gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_lowrecombination_noEthnodogs_noPakistan_noIndian
 -o AndeanFox

PHY=2gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_lowrecombination_noEthnodogs_noPakistan_noIndian.min4.phy
/home/crq857/bin/iqtree-1.6.12-Linux/bin/iqtree -s ${DIR}/${PHY} -bb 1000 -nt AUTO -m MFP



#!/usr/bin/env bash
#SBATCH --job-name=lowrec
#SBATCH -c 1
#SBATCH --time 11:30:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout/auto.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout/auto.err

VCF=/projects/mjolnir1/people/crq857/Chapter2/06_Datasets/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAL_lowrecombination_AUG15_header_1million.vcf
DIR=/projects/mjolnir1/people/crq857/Chapter2/06_Datasets/

module load perl
module load vcftools

#Remove Pakistan wolves 

python /projects/mjolnir1/people/crq857/Geneflow_Dogs/bin/vcf2phylip/vcf2phylip.py -i ${VCF} --output-folder ${DIR} --output-prefix Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAL_lowrecombination_AUG15_header_1million
 -o AndeanFox

PHY=Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAL_lowrecombination_AUG15_header_1million.min4.phy
/home/crq857/bin/iqtree-1.6.12-Linux/bin/iqtree -s ${DIR}/${PHY} -bb 1000 -nt AUTO -m MFP








July26_taxaremove_onlydogs_badwolves_Pakistan_SWAsia.txt


- Indian and SW Asian wolves - experiment on removing some, remove Pakistan wolves
- only Indian
- only SW Asia

/projects/mjolnir1/people/crq857/Chapter2/twisstresults

First List 

Ethiopian_wolf_B3
Wolf_Iran_Kurdistan
Wolf_Croatia_Novembre
Dog_Beagle_SRR7107976
Dog_Dauchound_SRR7107971
Dog_Jackrussell_SRR7107924
Dog_GoldenRetriever_MW207
Dog_SharPei02
Wolf_Karakoram_S19_10678
Wolf_Karakoram_S19_10679
Wolf_DGKhan_S19_10680
Wolf_Kolhu_S21_1037
Wolf_Chitral_S21_1038
Wolf_Punjab_S21_1039
Wolf_Waziristan_S21_1041
Wolf_Chitral_S21_1042
Tibetanwolf_BH1
Tibetanwolf_BH4
Indianwolf_BH6
Indianwolf_BH126
Indianwolf_SRR13985171
Indianwolf_BH124
Indianwolf_BH123


