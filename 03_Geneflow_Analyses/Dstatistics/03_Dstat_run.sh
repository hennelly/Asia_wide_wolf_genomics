#!/usr/bin/env bash
#SBATCH --job-name=Dstat
#SBATCH -c 1
#SBATCH --time 11:10:00
#SBATCH --mem-per-cpu 100G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout_Oct/Dstat_Indian3run2.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout_Oct/Dstat_Indian3run2.err

/projects/mjolnir1/people/crq857/Geneflow_Dogs/bin/AdmixTools/src/qpDstat -p /home/crq857/projects/Chapter2/parfiles/z_forTibetan_run2.par > /projects/mjolnir1/people/crq857/Chapter2/03_GeneflowAnalyses/Dstat/output/z_forTibetan_run2_logfile

#Example par file: 
genotypename:  /projects/mjolnir1/people/crq857/Chapter2/03_GeneflowAnalyses/Dstat/files/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss1_Dstat.eigenstratgeno
snpname: /projects/mjolnir1/people/crq857/Chapter2/03_GeneflowAnalyses/Dstat/files/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss1_Dstat.snp
indivname: /projects/mjolnir1/people/crq857/Chapter2/03_GeneflowAnalyses/Dstat/files/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss1_Dstat.ind
popfilename:   /home/crq857/projects/Chapter2/parfiles/z_forTibetan_run2.txt
## optional parameter  
f4mode:   YES 
printsd:  YES
## default NO 
## f4 statistics not D-stats are computed
inbreed: YES


#Example popnames file: 
Wolf_Norway_MW005       Wolf_Russia_SRR20326404 Wolf_Tibetan_CAN32      Andeanfox
Wolf_Norway_MW005       Wolf_Russia_SRR20326403 Wolf_Tibetan_CAN32      Andeanfox
Wolf_Norway_MW005       Wolf_Russia_SRR20326401 Wolf_Tibetan_CAN32      Andeanfox
Wolf_Norway_MW005       Wolf_Russia_SRR20326400 Wolf_Tibetan_CAN32      Andeanfox
Wolf_Norway_MW005       Wolf_Russia_SRR20326388 Wolf_Tibetan_CAN32      Andeanfox




