#!/usr/bin/env bash

sbatch --partition=cpuqueue \
--qos=normal \
--cpus-per-task=4 \
--mem=100G \
-o /home/crq857/projects/Asianwolves_revision/slurmout/Dstat_Goldenjackal_part9.out \
-e /home/crq857/projects/Asianwolves_revision/slurmout/Dstat_Goldenjackal_part9.err \
--time=1-00:00:00 \
--wrap="/projects/psg/people/crq857/bin2/AdmixTools/src/qpDstat -p /home/crq857/projects/Asianwolves_revision/parfiles/01_GJ_parfile9.par > /projects/psg/people/crq857/Asianwolves_revision/02_Geneflow/01_Dstat/Dstat_Goldenjackal_part9_logfile"


#Example par file: 
genotypename:  /projects/psg/people/crq857/Chapter2/03_GeneflowAnalyses/Dstat/files/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss1_Dstat.eigenstratgeno
snpname: /projects/psg/people/crq857/Chapter2/03_GeneflowAnalyses/Dstat/files/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss1_Dstat.snp
indivname: /projects/psg/people/crq857/Chapter2/03_GeneflowAnalyses/Dstat/files/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss1_Dstat.ind
popfilename:   /home/crq857/projects/Asianwolves_revision/files/09_GJ_pops.txt
## optional parameter  
f4mode:   YES 
printsd:  YES
## default NO 
## f4 statistics not D-stats are computed
inbreed: YES



#Example popnames file: 
Wolf_Norway_MW005       Wolf_Russia_SRR20326404 Goldenjackal1      Andeanfox
Wolf_Norway_MW005       Wolf_Russia_SRR20326403 Goldenjackal1      Andeanfox
Wolf_Norway_MW005       Wolf_Russia_SRR20326401 Goldenjackal1      Andeanfox





