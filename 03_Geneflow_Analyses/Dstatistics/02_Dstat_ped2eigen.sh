#!/usr/bin/env bash
#SBATCH --job-name=Dstat
#SBATCH -c 1
#SBATCH --time 2-00:00:00
#SBATCH --mem-per-cpu 30G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout_Oct/Dstat_ped2par.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout_Oct/Dstat_ped2par.err

PAR=/home/crq857/projects/Chapter2/list_Dec/parfile_ped2eigen.par
LOGFILE=/home/crq857/projects/Chapter2/list_Dec/log.txt
/projects/mjolnir1/people/crq857/Geneflow_Dogs/bin/AdmixTools/src/convertf -p ${PAR}  > ${LOGFILE}


## Parfile
genotypename:    /projects/mjolnir1/people/crq857/Chapter2/03_GeneflowAnalyses/Dstat/files/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss1_Dstat.ped
snpname:         /projects/mjolnir1/people/crq857/Chapter2/03_GeneflowAnalyses/Dstat/files/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss1_Dstat.map 
indivname:       /projects/mjolnir1/people/crq857/Chapter2/03_GeneflowAnalyses/Dstat/files/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss1_Dstat.ped
outputformat:    EIGENSTRAT
genotypeoutname: /projects/mjolnir1/people/crq857/Chapter2/03_GeneflowAnalyses/Dstat/files/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss1_Dstat.eigenstratgeno
snpoutname:      /projects/mjolnir1/people/crq857/Chapter2/03_GeneflowAnalyses/Dstat/files/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss1_Dstat.snp
indivoutname:    /projects/mjolnir1/people/crq857/Chapter2/03_GeneflowAnalyses/Dstat/files/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss1_Dstat.ind
familynames:     NO
