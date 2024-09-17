#!/usr/bin/env bash
#SBATCH --job-name=astral
#SBATCH -c 1
#SBATCH --time 1-11:10:00
#SBATCH --mem-per-cpu 3G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout_Oct/astral_March2024_chrX_nodogsLadakj_withNA3w.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout_Oct/astral_March2024_chrX_nodogsLadakj_withNA3w.err

VCFlowrec=/projects/mjolnir1/people/crq857/Chapter2/06_Datasets/2gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_lowrecombination_noEthnodogs_header_Aug15.recode.vcf
REMOVE_noPakistan=/home/crq857/projects/Chapter2/files/July26_taxaremove_onlydogs_badwolves_Pakistan.txt
OUT=/projects/mjolnir1/people/crq857/Chapter2/06_Datasets/2gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_lowrecombination_noEthnodogs_header_Aug15_noPakistan

module load perl
module load vcftools

vcftools --vcf ${VCFlowrec} --remove ${REMOVE_noPakistan} --out ${OUT} --recode --keep-INFO-all

OUT=/projects/mjolnir1/people/crq857/Chapter2/06_Datasets/2gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_lowrecombination_noEthnodogs_header_Aug15_noPakistan
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/06_Datasets/
python /projects/mjolnir1/people/crq857/Geneflow_Dogs/bin/vcf2phylip/vcf2phylip.py -i ${OUT}.recode.vcf --output-folder ${OUTDIR} --output-prefix 2gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_lowrecombination_noEthnodogs_header_Sep17_noPakistan_1million_phy -o AndeanFox

FILE=/projects/mjolnir1/people/crq857/Chapter2/06_Datasets/2gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_lowrecombination_noEthnodogs_header_Sep17_noPakistan_1million_phy.min4.phy

/home/crq857/bin/iqtree-1.6.12-Linux/bin/iqtree -s ${FILE} -bb 1000 -nt AUTO -m MFP

# No India - remove Portugal wolf
# 01_Autosomes_1million_noPak_noSWAsia_IQtree.sh RUNNING
# 02_Lowrec_Xchr_noPak.sh RUNNING

# No portugal 
#!/usr/bin/env bash
#SBATCH --job-name=astral
#SBATCH -c 1
#SBATCH --time 1-11:10:00
#SBATCH --mem-per-cpu 3G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout_Oct/removePort.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout_Oct/removePort.err

module load perl
module load vcftools

OUTFILE_noIndia=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_VCFs_July262024/Autosomes_NO_ETHIOPIAN_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_withNAwolves_noPakistan_noIndia_Auug17
REMOVE=/home/crq857/projects/Chapter2/files/July26_taxaremove_onlydogs_badwolves_Pakistan_Indian.txt
OUT=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_VCFs_July262024/Autosomes_NO_ETHIOPIAN_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_withNAwolves_noPakistan_noIndia_Auug17_noPakistan_Sept17

vcftools --vcf ${OUTFILE_noIndia}_1millionrandom_header.vcf --remove ${REMOVE} --out ${OUTFILE_noIndia} --recode --keep-INFO-all


${OUTFILE_noIndia}_1millionrandom_header.vcf
