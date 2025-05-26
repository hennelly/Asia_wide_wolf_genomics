#!/usr/bin/env bash
#SBATCH --partition=cpuqueue
#SBATCH --qos=normal
#SBATCH --cpus-per-task=4
#SBATCH --mem=100G
#SBATCH --output=/home/crq857/projects/Asianwolves_revision/slurmout/Xchr_filter2.out
#SBATCH --error=/home/crq857/projects/Asianwolves_revision/slurmout/Xchr_filter2.err
#SBATCH --time=2-10:00:00

module load perl
module load vcftools

VCF=/projects/psg/people/crq857/Chapter2/05_Phylogenomics/VCFs_July2024/chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_withNA.recode.vcf

REMOVE=/home/crq857/projects/Asianwolves_revision/files/remove_Xchr_phylogeny2.txt
OUT=/projects/psg/people/crq857/Asianwolves_revision/03_Phylogenomics/REVISION_May17_2025_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs

vcftools --vcf ${VCF} --remove ${REMOVE} --recode --recode-INFO-all --out ${OUT}

VCFdone=/projects/psg/people/crq857/Asianwolves_revision/03_Phylogenomics/REVISION_May17_2025_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs.recode.vcf

OUTDIR=/projects/psg/people/crq857/Asianwolves_revision/03_Phylogenomics/

python /projects/psg/people/crq857/bin/vcf2phylip/vcf2phylip.py -i ${VCFdone} --output-folder ${OUTDIR} --output-prefix REVISION_MAY_17_2025_Xchr_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl -o AndeanFox

PHY=/projects/psg/people/crq857/Asianwolves_revision/03_Phylogenomics/REVISION_MAY_17_2025_Xchr_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl.min4.phy

/home/crq857/bin/iqtree-1.6.12-Linux/bin/iqtree -s ${PHY} -bb 1000 -nt AUTO -m MFP





