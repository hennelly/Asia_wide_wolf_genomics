# Dstatistic analysis

We used D statistic to assess the sharing of derived alleles between various canid lineages. We used AdmixTools (Patterson et al. 2012). 

- First, we converted an autosomal VCF to ped format -> [01_Dstat_vcf2ped.sh](/03_Geneflow_Analyses_Dstatistics/01_Dstat_vcf2ped.sh) 
- Convert ped to eigen format, needed for AdmixTools -> [02_Dstat_ped2eigen.sh](/03_Geneflow_Analyses_Dstatistics/02_Dstat_ped2eigen.sh) 
- Run Dstatistics -> [03_Dstat_run.sh](/03_Geneflow_Analyses_Dstatistics/03_Dstat_run.sh) 
