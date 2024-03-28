# NGSrelate to estimate inbreeding coefficient 

NgsRelate v2 (Hanghøj et al., 2019) with the option -F 1 after estimating allele frequencies and obtaining genotype likelihoods with ANGSD v0.939 with the following parameters: -uniqueOnly 1 -remove_bads 1 -noTrans 1 -only_proper_pairs 1 -C 50 -baq 1 -skipTriallelic 1 -gl 2 -minMapQ 30 -nThreads 10 -doGlf 3 -doMajorMinor 1 -doMaf 1 -minMaf 0.00001 -SNP_pval 1e-6

### First we generate a file with allele frequencies (angsdput.mafs.gz) and a file with genotype likelihoods (angsdput.glf.gz).

### Then we extract the frequency column from the allele frequency file and remove the header (to make it in the format NgsRelate needs)
zcat angsdput.mafs.gz | cut -f5 |sed 1d >freq

### run NgsRelate
./ngsrelate  -g angsdput.glf.gz -n 100 -f freq  -O newres


dir=/projects/mjolnir1/people/qvw641/CottonTop/ANGSD/Inbreeding/
jobName=$dir/out/NGSrelate_inbreeding.sh
echo '#!/bin/bash' > $jobName

/projects/mjolnir1/apps/ngsRelate/ngsRelate -F 1  -g ${FILE} -n 34 -f CTT_rel_notrans.freq -O CTT_only_rel_notrans_inbreeding.ml" >> $jobName


