#!/usr/bin/env bash
#SBATCH --job-name=test
#SBATCH -o /home/crq857/projects/Asianwolves_revision/slurmout//Dstat_Goldenjackal.err.out
#SBATCH -e /home/crq857/projects/Asianwolves_revision/slurmout//Dstat_Goldenjackal.err.err

sbatch --partition=cpuqueue \
--qos=normal \
--cpus-per-task=4 \
--mem=50G \
--time=1-00:00:00 \
--wrap="/projects/psg/people/crq857/bin2/AdmixTools/src/qpDstat -p /home/crq857/projects/Asianwolves_revision/parfiles/01_GJ_parfile.par > /projects/psg/people/crq857/Asianwolves_revision/02_Geneflow/01_Dstat/Dstat_Goldenjackal_par1_logfile"





#Example par file: 
genotypename:  /projects/mjolnir1/people/crq857/Chapter2/03_GeneflowAnalyses/Dstat/files/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss1_Dstat.eigenstratgeno
snpname: /projects/mjolnir1/people/crq857/Chapter2/03_GeneflowAnalyses/Dstat/files/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss1_Dstat.snp
indivname: /projects/mjolnir1/people/crq857/Chapter2/03_GeneflowAnalyses/Dstat/files/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss1_Dstat.ind
popfilename:   /home/crq857/projects/Chapter2/parfiles/01_GJ_pops.txt
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





#!/usr/bin/env bash
#SBATCH --job-name=bamBQSR
#SBATCH -c 1
#SBATCH --time 1-20:00:00
#SBATCH --mem-per-cpu 20G
#SBATCH -o /home/crq857/projects/TSHR_revision/slurmout/bamBQSR_batch3_%A_%a.out
#SBATCH -e /home/crq857/projects/TSHR_revision/slurmout/bamBQSR_batch3_%A_%a.err
#SBATCH --array=1-8%5

echo "My SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID

BAM=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /home/crq857/projects/TSHR_revision/files/bamlist4.txt | cut -f1)

cd /projects/psg/people/crq857/TSHR_Apr152025/newbams


BQSRvcf=/projects/psg/people/crq857/TSHR_Apr152025/dbSNPdataBQSR/CFA31_151.dbSNP_num_order.vcf
REFERENCE=/projects/psg/people/crq857/Chapter2/ref/canFam31.fasta
TMP=/projects/psg/people/crq857/TSHR_Apr152025/tempfile

java -Xmx20g -jar /projects/mjolnir1/apps/conda/gatk4-4.2.5.0/share/gatk4-4.2.5.0-0/gatk-package-4.2.5.0-local.jar BaseRecalibrator -bqsr-baq-gap-open-penalty 30.0 -R ${REFERENCE} --tmp-dir ${TMP} -I ${BAM} --known-sites ${BQSRvcf} -O ${BAM}_recal.table

java -Xmx20g -jar /projects/mjolnir1/apps/conda/gatk4-4.2.5.0/share/gatk4-4.2.5.0-0/gatk-package-4.2.5.0-local.jar ApplyBQSR -R ${REFERENCE} --tmp-dir ${TMP} -I ${BAM} -bqsr ${BAM}_recal.table -O ${BAM}_BQSR.bam -OBM >> BRPR_${BAM}_swarmfile.txt


Africandog_SRR20326277_.CanFam31.bam
Africandog_SRR20326287_.CanFam31.bam
Africandog_SRR20326290__.CanFam31.bam
Africandog_SRR20326295_.CanFam31.bam
Africandog_SRR20326298_.CanFam31.bam
Africandog_SRR20326302_.CanFam31.bam
Africandog_SRR20326424_.CanFam31.bam



