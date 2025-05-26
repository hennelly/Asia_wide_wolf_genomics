#!/usr/bin/env bash
#SBATCH --partition=cpuqueue
#SBATCH --qos=normal
#SBATCH --cpus-per-task=4
#SBATCH --mem=200G
#SBATCH --output=/home/crq857/projects/Asianwolves_revision/slurmout/2lowrec_autosomes.out
#SBATCH --error=/home/crq857/projects/Asianwolves_revision/slurmout/2lowrec_autosomes.err
#SBATCH --time=5-10:00:00

SITES=/home/crq857/projects/Chapter2/files/FINISHED_WHOLEGENOMEbelow0.2_FINAL_copy_fixed.bed

VCF=/projects/psg/people/crq857/Chapter2/05_Phylogenomics/xFINAL_VCFs_July262024/Autosomes_NO_ETHIOPIAN_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_withNAwolves.recode.vcf

REMOVE=/home/crq857/projects/Asianwolves_revision/files/remove_lowrec_auto_phylogeny.txt

OUTVCF=/projects/psg/people/crq857/Asianwolves_revision/03_Phylogenomics/REVISION_May21_autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_withNA_lowrecombination

OUTVCF2=/projects/psg/people/crq857/Asianwolves_revision/03_Phylogenomics/REVISION_May21_autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_withNA_lowrecombination_finalsamplelist

module load perl
module load vcftools

## X chromosome
module load perl
module load vcftools

#vcftools --vcf ${VCF} --bed ${SITES} --out ${OUTVCF} --recode --keep-INFO-all
#vcftools --vcf ${OUTVCF}.recode.vcf --remove ${REMOVE} --out ${OUTVCF2} --recode --keep-INFO-all

OUTDIR=/projects/psg/people/crq857/Asianwolves_revision/03_Phylogenomics/

#python /projects/psg/people/crq857/bin/vcf2phylip/vcf2phylip.py -i ${OUTVCF2}.recode.vcf --output-folder ${OUTDIR} --output-prefix REVISION_May21_autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_withNA_lowrecombination_finalsamplelist -o AndeanFox

PHY=/projects/psg/people/crq857/Asianwolves_revision/03_Phylogenomics/REVISION_May21_autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_withNA_lowrecombination_finalsamplelist.min4.phy

/home/crq857/bin/iqtree-1.6.12-Linux/bin/iqtree -s ${PHY} -bb 1000 -nt AUTO -m MFP
