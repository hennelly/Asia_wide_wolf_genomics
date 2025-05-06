#!/usr/bin/env bash

sbatch --partition=cpuqueue \
--qos=normal \
--cpus-per-task=4 \
--mem=100G \
-o /home/crq857/projects/Asianwolves_revision/slurmout/Dstat_Goldenjackal_part9.out \
-e /home/crq857/projects/Asianwolves_revision/slurmout/Dstat_Goldenjackal_part9.err \
--time=1-00:00:00 \
--wrap="/projects/psg/people/crq857/bin2/AdmixTools/src/qpDstat -p /home/crq857/projects/Asianwolves_revision/parfiles/01_GJ_parfile9.par > /projects/psg/people/crq857/Asianwolves_revision/02_Geneflow/01_Dstat/Dstat_Goldenjackal_part9_logfile"




#!/usr/bin/env bash

sbatch --partition=cpuqueue \
--qos=normal \
--cpus-per-task=4 \
--mem=100G \
-o /home/crq857/projects/Redwolf/slurmout/qpGraph_example.out \
-e /home/crq857/projects/Redwolf/slurmout/qpGraph_example.err \
--time=1-00:00:00 \
--wrap="
PARFILE=parfile_qpGraph_fixed.txt
GRAPH=graphfile1.txt
/projects/psg/people/crq857/bin2/AdmixTools/src/qpGraph -p ${PARFILE} -g ${GRAPH} -d /home/crq857/projects/Redwolf/scripts_April2025/dotfiles/dotfile_graphtest >  /home/crq857/projects/Redwolf/scripts_April2025/logfiles/logfile_graphtest.txt"

module load openblas

PARFILE=parfile_qpGraph_fixed.txt
GRAPH=graphfile1.txt


#SBATCH --job-name=redwolf
#SBATCH -c 1
#SBATCH --time 12:00:00
#SBATCH --mem-per-cpu 10G
#SBATCH -o /home/crq857/projects/Redwolf/slurmout/chr1_qpGraph_fixed2.out
#SBATCH -e /home/crq857/projects/Redwolf/slurmout/chr1_qpGraph_fixed2.err

module load openblas

PARFILE=parfile_qpGraph_fixed.txt
GRAPH=graphfile1.txt

/projects/psg/people/crq857/bin2/AdmixTools/src/qpGraph -p ${PARFILE} -g ${GRAPH} -d /home/crq857/projects/Redwolf/scripts_April2025/dotfiles/dotfile_graphtest >  /home/crq857/projects/Redwolf/scripts_April2025/logfiles/logfile_graphtest.txt






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

/projects/psg/people/crq857/Asianwolves_revision/02_Geneflow/01_Dstat/Dstat_Goldenjackal_part6_logfile
/projects/psg/people/crq857/Asianwolves_revision/02_Geneflow/01_Dstat/Dstat_Goldenjackal_part7_logfile
/projects/psg/people/crq857/Asianwolves_revision/02_Geneflow/01_Dstat/Dstat_Goldenjackal_part8_logfile
/projects/psg/people/crq857/Asianwolves_revision/02_Geneflow/01_Dstat/Dstat_Goldenjackal_part9_logfile
 /projects/psg/people/crq857/Asianwolves_revision/02_Geneflow/01_Dstat/Dstat_Goldenjackal_part3_logfile
/projects/psg/people/crq857/Asianwolves_revision/02_Geneflow/01_Dstat/Dstat_Goldenjackal_part5_logfile
/projects/psg/people/crq857/Asianwolves_revision/02_Geneflow/01_Dstat/Dstat_Goldenjackal_part4_logfile
/projects/psg/people/crq857/Asianwolves_revision/02_Geneflow/01_Dstat/Dstat_Goldenjackal_part2_logfile





#!/usr/bin/env bash
sbatch --partition=cpuqueue \
--qos=normal \
--cpus-per-task=4 \
--mem=200G \
-o /home/crq857/projects/Asianwolves_revision/slurmout/Dstat_Goldenjackal_part9.out \
-e /home/crq857/projects/Asianwolves_revision/slurmout/Dstat_Goldenjackal_part9.err \
--time=1-00:00:00 \
--wrap="/projects/psg/people/crq857/bin2/AdmixTools/src/qpDstat -p /home/crq857/projects/Asianwolves_revision/parfiles/01_Dog_parfile9.par > /projects/psg/people/crq857/Asianwolves_revision/02_Geneflow/01_Dstat/Dstat_Dog_part9_logfile"




genotypename:  /projects/psg/people/crq857/Chapter2/03_GeneflowAnalyses/Dstat/files/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss1_Dstat.eigenstratgeno
snpname: /projects/psg/people/crq857/Chapter2/03_GeneflowAnalyses/Dstat/files/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss1_Dstat.snp
indivname: /projects/psg/people/crq857/Chapter2/03_GeneflowAnalyses/Dstat/files/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss1_Dstat.ind
popfilename:   /home/crq857/projects/Asianwolves_revision/files/09_Dog_pops.txt
## optional parameter  
f4mode:   YES 
printsd:  YES
## default NO 
## f4 statistics not D-stats are computed
inbreed: YES









scp -r crq857@mjolnirgate.unicph.domain:/projects/psg/people/crq857/Asianwolves_revision/02_Geneflow/01_Dstat/Dstat_Dog_part9_logfile ~/Desktop

/projects/psg/people/crq857/Asianwolves_revision/02_Geneflow/01_Dstat/Dstat_Dog_part1_logfile
/projects/psg/people/crq857/Asianwolves_revision/02_Geneflow/01_Dstat/Dstat_Dog_part2_logfile
/projects/psg/people/crq857/Asianwolves_revision/02_Geneflow/01_Dstat/Dstat_Dog_part3_logfile
/projects/psg/people/crq857/Asianwolves_revision/02_Geneflow/01_Dstat/Dstat_Dog_part4_logfile
/projects/psg/people/crq857/Asianwolves_revision/02_Geneflow/01_Dstat/Dstat_Dog_part6_logfile
/projects/psg/people/crq857/Asianwolves_revision/02_Geneflow/01_Dstat/Dstat_Dog_part7_logfile
/projects/psg/people/crq857/Asianwolves_revision/02_Geneflow/01_Dstat/Dstat_Goldenjackal_part8_logfile
/projects/psg/people/crq857/Asianwolves_revision/02_Geneflow/01_Dstat/Dstat_Dog_part9_logfile


#!/usr/bin/env bash
#SBATCH --job-name=NGSAdmix
#SBATCH -c 1
#SBATCH --time 2-00:00:00
#SBATCH --mem-per-cpu 20G
#SBATCH -o /home/crq857/projects/Asianwolves_revision/slurmout/angsd_NGSadmix_test_%A_%a.out
#SBATCH -e /home/crq857/projects/Asianwolves_revision/slurmout/angsd_NGSadmix_test_%A_%a.err
#SBATCH --array=1-12%10

K=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /home/crq857/projects/Chapter2/files/NGAdmixlist.txt | cut -f1)

IN=/projects/psg/people/crq857/Asianwolves_revision/01_GenomewideAnalyses/Admixture/Graywolves_Apr25_2025_NGSAdmix_autosomes.beagle.gz

/projects/psg/people/crq857/Chapter2/bin/NGSAdmix/NGSadmix -likes ${IN} -K ${K} -o /projects/psg/people/crq857/Asianwolves_revision/01_GenomewideAnalyses/Admixture_results/Graywolves_Apr25_2025_NGSAdmix_autosomes_${K} -P 10  






#!/usr/bin/env bash
sbatch --partition=cpuqueue \
--qos=normal \
--cpus-per-task=4 \
--mem=200G \
-o /home/crq857/projects/Asianwolves_revision/slurmout/NGSAdmix_K8.out \
-e /home/crq857/projects/Asianwolves_revision/slurmout/NGSAdmix_K8.err \
--time=1-00:00:00 \
--wrap="/projects/psg/people/crq857/Chapter2/bin/NGSAdmix/NGSadmix -likes /projects/psg/people/crq857/Asianwolves_revision/01_GenomewideAnalyses/Admixture/Graywolves_Apr25_2025_NGSAdmix_autosomes.beagle.gz -K 8 -o /projects/psg/people/crq857/Asianwolves_revision/01_GenomewideAnalyses/Admixture_results/Graywolves_Apr25_2025_NGSAdmix_autosomes_8 -P 10 "


/projects/psg/people/crq857/scratch

/projects/psg/people/crq857/bin3/AdmixTools/src


/projects/psg/people/crq857/bin3/AdmixTools/src


 Running 4 and 5 



genotypename:  /projects/psg/people/crq857/Chapter2/03_GeneflowAnalyses/Dstat/files/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss1_Dstat.eigenstratgeno
snpname: /projects/psg/people/crq857/Chapter2/03_GeneflowAnalyses/Dstat/files/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss1_Dstat.snp
indivname: /projects/psg/people/crq857/Chapter2/03_GeneflowAnalyses/Dstat/files/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss1_Dstat.ind
popfilename:   /home/crq857/projects/Asianwolves_revision/files/09_coyote_pops.txt
## optional parameter  
f4mode:   YES 
printsd:  YES
## default NO 
## f4 statistics not D-stats are computed
inbreed: YES


01_coyote_pops.txt
02_coyote_pops.txt
03_coyote_pops.txt
04_coyote_pops.txt
05_coyote_pops.txt
06_coyote_pops.txt
07_coyote_pops.txt
08_coyote_pops.txt
09_coyote_pops.txt


