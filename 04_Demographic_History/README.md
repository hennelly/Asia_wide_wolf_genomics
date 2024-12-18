# Demographic History 

## PSMC 

- Keep autosomes -> [00_keepautosomes.sh](/04_Demographic_History/01_PSMC/00_keepautosomes.sh)
- Convert file types and run PSMC -> [01_bam2fq.sh](/04_Demographic_History/01_PSMC/01_bam2fq.sh) + [02_fq2psmcfa.sh](/04_Demographic_History/01_PSMC/02_fq2psmcfa.sh) + [03_psmcfa2psmc.sh](/04_Demographic_History/01_PSMC/03_psmcfa2psmc.sh) 
- plot PSMC -> [04_plotPSMC.sh](/04_Demographic_History/01_PSMC/04_plotPSMC.sh) + [05_plotinR.sh](/04_Demographic_History/01_PSMC/05_plotinR.sh)
- Downsampling for lowcoverage tree -> [06_downsample.sh](/04_Demographic_History/01_PSMC/06_downsample.sh)

## Genetic diversity
- Estimate the heterozygosity using ANGSD and genotype likelihoods -> [01_heterozygosity_ANGSD.sh](/04_Demographic_History/02_GeneticDiversity/01_heterozygosity_ANGSD.sh)
- Map of heterozygosity of wolves -> [02_plot_heterozygosity_on_map.R](/04_Demographic_History/02_GeneticDiversity/02_plot_heterozygosity_on_map.R)

## ROH 
- adjust recombination map for bcftools roh -> [adjust_geneticmap.sh](/04_Demographic_History/03_ROH/adjust_geneticmap.sh)
- Prepare dataset -> [03.SubsetandFilterindividuals.sh](/04_Demographic_History/03_ROH/03.SubsetandFilterindividuals.sh) + [03.splitbychr.sh](/04_Demographic_History/03_ROH/03.splitbychr.sh)
- Run bcftools ROH -> [05.bcftoolsROH.sh](/04_Demographic_History/03_ROH/05.bcftoolsROH.sh)
- Pull out RG -> [06.pulloutRG.sh](/04_Demographic_History/03_ROH/06.pulloutRG.sh)
- Plotting the results -> [07.Plot_CummulativeROH.R](/04_Demographic_History/03_ROH/07.Plot_CummulativeROH.R)
  
