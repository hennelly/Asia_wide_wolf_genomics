# Asia_wide_wolf_genomics
Scripts for manuscript 

ssh crq857@mjolnirgate.unicph.domain


#!/usr/bin/env bash
#SBATCH --job-name=NGSRelate
#SBATCH -c 1
#SBATCH --time 1-00:00:00
#SBATCH -c 10   ## number cpus
#SBATCH --mem=40gb      ## total RAM
#SBATCH -o /home/crq857/projects/Chapter2/slurmout_Oct/angsd_NGSRelate_%A_%a.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout_Oct/angsd_NGSRelate_%A_%a.err
#SBATCH --array=1-38%10

CHR=$(sed -n "$SLURM_ARRAY_TASK_ID"p /home/crq857/projects/Geneflow_Dogs/files/chrlist_angsd.txt | awk '{print $1}')
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/04_Demographichistory/NSGRelate
LIST=/home/crq857/projects/Chapter2/list_Sept/bamlist_for_PCAangsd_listDec15.txt
REF=/projects/mjolnir1/people/crq857/Chapter2/ref/canFam31.fasta


/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_chrX_July262026_input_July2024_nodogs_withNA_more_noEth/FINAL_listfileschrX.txt_phy.txt



#!/usr/bin/env bash
#SBATCH --job-name=ASTRAL
#SBATCH -c 1
#SBATCH --time 01:40:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Geneflow_Dogs/slurmout/xxxiqtree_Xchr_run_%A_%a.out
#SBATCH -e /home/crq857/projects/Geneflow_Dogs/slurmout/xxxiqtree_Xchr_run_%A_%a.err
#SBATCH --array=1-500%10

#conda activate /projects/mjolnir1/apps/conda/python-3.5.6
#cd /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_chrX_July262026_input_July2024_nodogs_withNA_more_noEth
#ls  *phy > FINAL_listfileschrX.txt_phy.txt

PHY=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_chrX_July262026_phy_July2024_nodogs_withNA_noEth/FINAL_listfileschrX.txt_phy_noEth.txt)

/home/crq857/bin/iqtree-1.6.12-Linux/bin/iqtree -redo  -s  /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_chrX_July262026_phy_July2024_nodogs_withNA_noEth/${PHY} -bb 1000 -nt AUTO


/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_chrX_July262026_phy_July2024_nodogs_withNA_noEth/FINAL_listfileschrX.txt_phy_noEth.txt




#!/usr/bin/env bash
#SBATCH --job-name=lowrec
#SBATCH -c 1
#SBATCH --time 01:30:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout/lowrecombinationXchr.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout/lowrecombinationXchr.err


XSITES=/home/crq857/projects/Chapter2/files/FINISHED_WHOLEGENOMEbelow0.2_FINAL_copy_fixed.bed
XVCF=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.recode.vcf.gz
XOUTVCF=/projects/mjolnir1/people/crq857/Chapter2/06_Datasets/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_lowrecombination

module load perl
module load vcftools

vcftools --gzvcf ${XVCF} --bed ${XSITES} --out ${XOUTVCF} --recode --keep-INFO-all

REMOVE=/home/crq857/projects/Chapter2/files/July26_taxaremove_onlydogs_badwolves.txt
OUTVCF=/projects/mjolnir1/people/crq857/Chapter2/06_Datasets/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_lowrecombination_noEthnodogs

vcftools --vcf ${XOUTVCF}.recode.vcf --remove ${REMOVE} --out ${OUTVCF} --recode --keep-INFO-all












module load angsd

angsd -GL 2 \
  -bam ${LIST} \
   -ref ${REF} \
  -checkBamHeaders 0 \
  -trim 0 -C 50 -baq 1 \
  -nThreads 10 \
  -skipTriallelic 1 \
  -minMapQ 20 -minQ 20 -minInd 88 \
  -uniqueOnly 1 -remove_bads 1 \
  -noTrans 1 -doGlf 3 -doMajorMinor 1 -doMaf 1 \
  -minMaf 0.00001 \
  -SNP_pval 1e-6 \
  -P 10 \
  -out ${OUTDIR}/Asianwolves_NGSRelate_Mar25_${CHR} \
  -r ${CHR}:







