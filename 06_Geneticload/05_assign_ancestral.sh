#!/usr/bin/env bash
#SBATCH --job-name=gload
#SBATCH -c 1
#SBATCH --time 00:10:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout_fsc/fsc_GATK_Genotype_4.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout_fsc/fsc_GATK_Genotype_4.err

python3 assign_ancestral.py -i /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/combined_outgroups.txt -c 5 -o /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/combined_outgroups
