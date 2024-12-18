# Demographic History 

## PSMC 

- Keep autosomes -> [00_keepautosomes.sh](/04_Demographic_History/01_PSMC/00_keepautosomes.sh)
- Convert file types and run PSMC -> [01_bam2fq.sh](/04_Demographic_History/01_PSMC/01_bam2fq.sh) + [02_fq2psmcfa.sh](/04_Demographic_History/01_PSMC/02_fq2psmcfa.sh) + [03_psmcfa2psmc.sh](/04_Demographic_History/01_PSMC/03_psmcfa2psmc.sh) 
- plot PSMC -> [04_plotPSMC.sh](/04_Demographic_History/01_PSMC/04_plotPSMC.sh) + [05_plotinR.sh](/04_Demographic_History/01_PSMC/05_plotinR.sh)
- Downsampling for lowcoverage tree -> [06_downsample.sh](/04_Demographic_History/01_PSMC/06_downsample.sh)
- 
- We used PCangsd (Meisner and Albrecthsen 2018) to inferred the PCA using genotype likelihoods from ANGSD (Korneliussen et al. 2014)

 - First we estimated genotype likelihoods using ANGSD by chromosome [01_GL_for_PCAdmix.sh](/02_Genomewide_Analyses/PCA/01_GL_for_PCAdmix.sh) with keeping reads with least 90% individuals present
 - Merge GL files -> [02_merge_GL.sh](/02_Genomewide_Analyses/PCA/02_merge_GL.sh)
 - Run PCAngsd -> [03_run_PCAdmix.sh](/02_Genomewide_Analyses/PCA/03_run_PCAdmix.sh)
 - Plot PCA in R -> [04_plotPCA.R](/02_Genomewide_Analyses/PCA/04_plotPCA.R)

