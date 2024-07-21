#!/usr/bin/env bash
#SBATCH --job-name=Dstat
#SBATCH -c 1
#SBATCH --time 12:00:00
#SBATCH --mem-per-cpu 30G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout_Oct/Dstat_ped2par.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout_Oct/Dstat_ped2par.err

#convert to ped file 
VCF=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.recode.vcf.vcf
OUT=/projects/mjolnir1/people/crq857/Chapter2/03_GeneflowAnalyses/Dstat/files/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss1_Dstat
#conda activate /projects/mjolnir1/apps/conda/plink-1.90b6.21

plink --vcf ${VCF} --recode --geno 0 --set-missing-var-ids @:#  --const-fid --dog --out ${OUT} 
