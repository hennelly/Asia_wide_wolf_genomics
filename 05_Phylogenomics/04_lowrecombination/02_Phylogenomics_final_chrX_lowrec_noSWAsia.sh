#!/usr/bin/env bash
#SBATCH --partition=cpuqueue
#SBATCH --qos=normal
#SBATCH --cpus-per-task=4
#SBATCH --mem=100G
#SBATCH --output=/home/crq857/projects/Asianwolves_revision/slurmout/lowrec_Xchr_noSWAsia.out
#SBATCH --error=/home/crq857/projects/Asianwolves_revision/slurmout/lowrec_Xchr_noSWAsia.err
#SBATCH --time=2-10:00:00

SITES=/home/crq857/projects/Chapter2/files/FINISHED_WHOLEGENOMEbelow0.2_FINAL_copy_fixed.bed

VCF=/projects/psg/people/crq857/Chapter2/05_Phylogenomics/VCFs_July2024/chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_withNA.recode.vcf

REMOVE=/home/crq857/projects/Asianwolves_revision/files/remove_Xchr_phylogeny_may20_noSWAsia.txt

OUTVCF=/projects/psg/people/crq857/Asianwolves_revision/03_Phylogenomics/REVISION_May20_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_withNA_lowrecombination_noSWAsia

OUTVCF2=/projects/psg/people/crq857/Asianwolves_revision/03_Phylogenomics/REVISION_May20_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_withNA_lowrecombination_finalsamplelist_noSWAsia

module load perl
module load vcftools

## X chromosome
module load perl
module load vcftools

vcftools --vcf ${VCF} --bed ${SITES} --out ${OUTVCF} --recode --keep-INFO-all
vcftools --vcf ${OUTVCF}.recode.vcf --remove ${REMOVE} --out ${OUTVCF2} --recode --keep-INFO-all

OUTDIR=/projects/psg/people/crq857/Asianwolves_revision/03_Phylogenomics/

python /projects/psg/people/crq857/bin/vcf2phylip/vcf2phylip.py -i ${OUTVCF2}.recode.vcf --output-folder ${OUTDIR} --output-prefix REVISION_May20_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_withNA_lowrecombination_finalsamplelist_noSWAsia -o AndeanFox

PHY=/projects/psg/people/crq857/Asianwolves_revision/03_Phylogenomics/REVISION_May20_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_withNA_lowrecombination_finalsamplelist_noSWAsia.min4.phy

/home/crq857/bin/iqtree-1.6.12-Linux/bin/iqtree -s ${PHY} -bb 1000 -nt AUTO -m MFP
