#!/usr/bin/env bash
#SBATCH --job-name=gload
#SBATCH -c 1
#SBATCH --time 04:00:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/reproductivegenes/slurmout/hapd.out
#SBATCH -e /home/crq857/projects/reproductivegenes/slurmout/hapd.err

## pseudo haploidize vcf files (i had to create a python virtual environment with specific dependencies but might just be our server) ##
gunzip /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK_fsc/Dhole.vcf.gz
gunzip /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK_fsc/Andeanfox.vcf.gz

VCFd=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK_fsc/Dhole.vcf
OUTd=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Dhole_pseudo_gatk
VCFa=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK_fsc/Andeanfox.vcf
OUTa=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Andeanfox_pseudo_gatk

python3 pseudo_haploidize.py -v ${VCFd} -d 4 -o ${OUTd}

python3 pseudo_haploidize.py -v ${VCFa} -d 4 -o ${OUTa}