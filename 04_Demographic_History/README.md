# Demographic History 

## PSMC 

- Keep autosomes -> [00_keepautosomes.sh](/04_Demographic_History/01_PSMC/00_keepautosomes.sh)
- Convert file types and run PSMC -> [01_bam2fq.sh](/04_Demographic_History/01_PSMC/01_bam2fq.sh) + [02_fq2psmcfa.sh](/04_Demographic_History/01_PSMC/02_fq2psmcfa.sh) + [03_psmcfa2psmc.sh](/04_Demographic_History/01_PSMC/03_psmcfa2psmc.sh) 
- plot PSMC -> [04_plotPSMC.sh](/04_Demographic_History/01_PSMC/04_plotPSMC.sh) + [05_plotinR.sh](/04_Demographic_History/01_PSMC/05_plotinR.sh)
- Downsampling for lowcoverage tree -> [06_downsample.sh](/04_Demographic_History/01_PSMC/06_downsample.sh)

## Genetic diversity
- Estimate the heterozygosity using ANGSD and genotype likelihoods -> [01_heterozygosity_ANGSD.sh](/04_Demographic_History/02_GeneticDiversity/01_heterozygosity_ANGSD.sh)
- Map of heterozygosity of wolves -> [02_plot_heterozygosity_on_map.R](/04_Demographic_History/02_GeneticDiversity/02_plot_heterozygosity_on_map.R)

  
