# Genome-wide Summary Analyses

## Principle Component Analyis using Genotype Likelihoods 
- We used PCangsd (Meisner and Albrecthsen 2018) to inferred the PCA using genotype likelihoods from ANGSD (Korneliussen et al. 2014)

 - First we estimated genotype likelihoods using ANGSD [01_ANGSD_GL_forPCAngsd.sh](/02_Genome_wide_Summary/01_ANGSD_GL_forPCAngsd.sh) with keeping reads with least 90% individuals present
 - Run PCAngsd -> [02_runPCAngsd.sh](/02_Genome_wide_Summary/02_runPCAngsd.sh)
 - Plot PCA in R -> [03_plotPCA.sh](/02_Genome_wide_Summary/03_plotPCA.sh)

## Individual Admixture Proportions with NGSadmix
- we inferred genotype likelihoods using ANGSD and ran NGSadmix (Skotte et al. 2013) assuming K = 2–7 genetic clusters. 
- Estimate genotype likelihoods using ANGSD on each chromsomome-> [01_NGSAdmix_getGL.sh](/02_Genomewide_Analyses/Individual_Admixture_Prop/01_NGSAdmix_getGL.sh)
- Merge the GL files -> [02_NGSAdmix_merge.sh](/02_Genomewide_Analyses/Individual_Admixture_Prop/02_NGSAdmix_merge.sh) 
- Run NGSadmix -> [03_NGSAdmix_run.sh](/02_Genomewide_Analyses/Individual_Admixture_Prop/03_NGSAdmix_run.sh)
- Plotting NGSadmix in R -> [04_NGSAdmix_plot.R](/02_Genomewide_Analyses/Individual_Admixture_Prop/04_NGSAdmix_plot.R) and [05_NGSAdmix_plot_on_map.R](/02_Genomewide_Analyses/Individual_Admixture_Prop/05_NGSAdmix_plot_on_map.R)

### References 

Meisner J, A Albrechtsen. 2018. Inferring population structure and admixture proportions in low-depth NGS data. Genetics 210(2): 719-731. 

Korneliussen TS, A Albrechtsen, R Nielsen. 2014. ANGSD: Analysis of next generation sequencing data. BMC Bioinformatics 14(356)

Skotte L, TS Korneliussen, A Albrechtsen. 2013. Estimating individual admixture proportions from next generation sequencing data. Genetics 195: 693-702.



