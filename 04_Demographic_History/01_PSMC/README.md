# PSMC analysis 


To infer the historical demography of wolves in Eurasia, we used the Pairwise Sequential Markovian Coalescent (PSMC; Li and Durbin 2011). PSMC uses a coalescent approach to estimate the history of change in effective population sizes over time

- First, we kept only the autosomal regions of our bam file -> [00_keepautosomes.sh](/04_Demographic_History/01_PSMC/00_keepautosomes.sh)
- We converted each bam file to a fasta-like consensus sequence by first using the mpileup command with SAMtools and subsequently using BCFtools view –c to call variants and vcfultils.pl vcf2fq to convert the vcf file to fastq format -> [01_bam2fq.sh](/04_Demographic_History/01_PSMC/01_bam2fq.sh)
    - We excluded any reads that were less than 20 for minimum mapping quality and minimum base quality (-q 20 -Q 20)
    -  excluded reads with excessive mismatches (-C 50)
    -  We also removed sites with more than double or less than a third of the average depth of coverage for each sample.
 
- Convert each fq to psmcfa -> [02_fq2psmcfa.sh](/04_Demographic_History/01_PSMC/02_fq2psmcfa.sh)
- Convert psmcfa to psmc file ->[ 03_psmcfa2psmc.sh](/04_Demographic_History/01_PSMC/03_psmcfa2psmc.sh)
    - We tested different combinations of parameters to infer the PSMC, which were “psmc -N25 -t15 -r5 -p 4+252+4+6”, “psmc -N25 -t15 -r5 -p 2+2+252+4+6” and “psmc -N25 -t15 -r5 -p 1+1+1+1+252+4+6” following previous studies on gray wolves and recent recommendations for inferring PSMC trajectories (Hilgers et al. 2024).
- Plot psmc results -> [04_plotPSMC.sh](/04_Demographic_History/01_PSMC/04_plotPSMC.sh)
- We can then take the output and plot in R -> [05_plotinR.R](/04_Demographic_History/01_PSMC/05_plotinR.R)

- For lower coverage genomes (<20x but more than 15x), we downsampled these individuals. We estimated the false negative rate (FNR) by a downsampling high coverage gray wolf genome that were in the same geographic region to the specific depth of the low coverage genome. To determine the best FNR, we visually estimated the best correspondence between the PSMC plots with the high coverage (>20x) regional wolf genome and downsampled genomes with various FNR corrections (Figure S26). We then applied the best estimated FNR to the low coverage gray wolf genomes to infer their demographic history. We used a mutation rate of 4.5 x 10-9 (Koch et al. 2019) and a generation time of 4.4 years (Mech and Barber-Meyer 2017).
    - script -> [06_downsample.sh](/04_Demographic_History/01_PSMC/06_downsample.sh)


 Mech DL, Barber-Meyer S. 2017. Use of erroneous wolf generation time in assessments of domestic dog and human evolution Sci ELett. Available from: http://science.sciencemag.org/content/352/ 6290/1228/tab-e-letters

