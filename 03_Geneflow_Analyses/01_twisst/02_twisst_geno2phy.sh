#!/usr/bin/env bash
#SBATCH --job-name=twisst
#SBATCH -c 1
#SBATCH --time 1-10:30:00
#SBATCH --mem-per-cpu 5G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout/twisst_phy_chrX.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout/twisst_phy_chrX.err


PHY=/projects/mjolnir1/people/crq857/Chapter2/06_Datasets/Asianwolves_gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.geno.gz
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/03_GeneflowAnalyses/twisst/phyml

module load python/2.7.18
module load numpy
module load phyml

python /projects/mjolnir1/people/crq857/bin/genomics_general/phylo/phyml_sliding_windows.py -T 1 -g ${PHY} --outgroup AndeanFox -w 100 --windType sites --prefix ${OUTDIR}/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final.phyml --model GTR
