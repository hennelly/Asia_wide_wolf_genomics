#!/usr/bin/env bash
#SBATCH --job-name=gload
#SBATCH -c 1
#SBATCH --time 04:00:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/reproductivegenes/slurmout/hap.out
#SBATCH -e /home/crq857/projects/reproductivegenes/slurmout/hap.err

## pseudo haploidize vcf files (i had to create a python virtual environment with specific dependencies but might just be our server) ##

VCFd=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Dhole.recode.vcf
VCFa=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Andeanfox.recode.vcf
OUTd=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Dhole_pseudo
OUTa=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Andeanfox_pseudo

python3 pseudo_haploidize.py -v ${VCFd} -o ${OUTd}


