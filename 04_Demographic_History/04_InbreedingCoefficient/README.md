# NGSrelate to estimate inbreeding coefficient 

NgsRelate v2 (Hanghøj et al., 2019) with the option -F 1 after estimating allele frequencies and obtaining genotype likelihoods with ANGSD v0.939 with the following parameters: -uniqueOnly 1 -remove_bads 1 -noTrans 1 -only_proper_pairs 1 -C 50 -baq 1 -skipTriallelic 1 -gl 2 -minMapQ 30 -nThreads 10 -doGlf 3 -doMajorMinor 1 -doMaf 1 -minMaf 0.00001 -SNP_pval 1e-6

### First we generate a file with allele frequencies (angsdput.mafs.gz) and a file with genotype likelihoods (angsdput.glf.gz).
./angsd -b filelist -gl 2 -domajorminor 1 -snp_pval 1e-6 -domaf 1 -minmaf 0.05 -doGlf 3
echo "angsd -bam /home/qvw641/CottonTop_Tamarins/cluster_jobs/Samples_Bams_onlyCTT 
-ref /projects/mjolnir1/people/vbz170/projects/CTT/Ref_Genome/Saguinus_midas_Full_Genome/NCBI_version/SaguinusMidas_NCBI.fasta 
-uniqueOnly 1 
-remove_bads 1 
-noTrans 1 
-only_proper_pairs 1 
-trim 0 
-C 50
-baq 1 
-skipTriallelic 1 
-gl 2 
-minMapQ 30 
-nThreads 10 
-doGlf 3 
-doMajorMinor 1 
-doMaf 1
-minMaf 0.00001 
-SNP_pval 1e-6 
-P 4 
-out /projects/mjolnir1/people/qvw641/CottonTop/ANGSD/Inbreeding/CTT_only_rel_noTrans" >> $jobName


#!/usr/bin/env bash
#SBATCH --job-name=angsdPCA
#SBATCH -c 1
#SBATCH --time 1-00:00:00
#SBATCH -c 10   ## number cpus
#SBATCH --mem=40gb      ## total RAM
#SBATCH -o /home/crq857/projects/Chapter2/slurmout_Oct/angsd_PCAngsd_Dec21_%A_%a.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout_Oct/angsd_PCAngsd_Dec21_%A_%a.err
#SBATCH --array=1-38%10

CHR=$(sed -n "$SLURM_ARRAY_TASK_ID"p /home/crq857/projects/Geneflow_Dogs/files/chrlist_angsd.txt | awk '{print $1}')
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/02_GenomewideAnalyses/Beaglefiles_PCA
LIST=/home/crq857/projects/Chapter2/list_Sept/bamlist_for_PCAangsd_listDec15.txt
REF=/projects/mjolnir1/people/crq857/Chapter2/ref/canFam31.fasta

module load angsd

angsd -GL 2 \
  -bam ${LIST} \
   -ref ${REF} \
  -checkBamHeaders 0 \
  -trim 0 -C 50 -baq 1 \
  -nThreads 10 \
  -minMapQ 20 -minQ 20 -minInd 88 \
  -uniqueOnly 1 -remove_bads 1 \
  -noTrans 1 -doGlf 2 -doMajorMinor 1 -doMaf 1 \
  -SNP_pval 1e-6 \
  -P 10 \
  -out ${OUTDIR}/Asianwolves_PCAdmix_Dec26_${CHR} \
  -r ${CHR}:



### Then we extract the frequency column from the allele frequency file and remove the header (to make it in the format NgsRelate needs)
zcat angsdput.mafs.gz | cut -f5 |sed 1d >freq

### run NgsRelate
./ngsrelate  -g angsdput.glf.gz -n 100 -f freq  -O newres


dir=/projects/mjolnir1/people/qvw641/CottonTop/ANGSD/Inbreeding/
jobName=$dir/out/NGSrelate_inbreeding.sh
echo '#!/bin/bash' > $jobName

/projects/mjolnir1/apps/ngsRelate/ngsRelate -F 1  -g ${FILE} -n 34 -f CTT_rel_notrans.freq -O CTT_only_rel_notrans_inbreeding.ml" >> $jobName


