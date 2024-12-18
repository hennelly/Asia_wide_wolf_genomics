# Gene flow Analyses

## Twisst for topology weighting across the genome 

 - First we phased the genome using SHAPEIT [00_phasing.sh](/03_Geneflow_Analyses/01_twisst/00_phasing.sh) 
 - File conversion from vcf to geno -> [01_twisst_vcf2geno.sh](/03_Geneflow_Analyses/01_twisst/01_twisst_vcf2geno.sh) + [02_twisst_geno2phy.sh](/03_Geneflow_Analyses/01_twisst/02_twisst_geno2phy.sh) 
 - Run twisst ->  [03_twisst_KU.sh](/03_Geneflow_Analyses/01_twisst/03_twisst_KU.sh) 
 - Plot twisst in R-> [04_results_plot.R](/03_Geneflow_Analyses/01_twisst/04_results_plot.R)
- Overlap twisst windows with recombination rate variation -> 06_overlaptwisst_results_centralAsia.sh](/03_Geneflow_Analyses/01_twisst/06_overlaptwisst_results_centralAsia.sh) 

## FEEMS for quantifying effective migration surface 

 - FEEMS pipeline, which was difficult to install [01_FEEMS_new.FINALsh](/03_Geneflow_Analyses/02_FEEMS/01_FEEMS_new.FINALsh) 

\
