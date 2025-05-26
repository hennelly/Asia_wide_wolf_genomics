# Asia_wide_wolf_genomics
Scripts for manuscript "Continent-wide view of genomic diversity and divergence in the wolves of Asia"

## Sample List 
- Meta-data for the 20 newly sequenced canids and the full sample list is avaliable here: /00_SamplesMetadata/Table S1_Metadata.csv

## 01_Alignment_SNPCalling
- Paleomix pipeline for mapping to canfam3.1 genome -> [01_Alignment_paleomix.sh](/01_Alignment_Postprocessing/01_Alignment_paleomix.sh)
- GATK pipeline -> [02_GATK_haplotypecaller.sh](/01_Alignment_Postprocessing/02_GATK_haplotypecaller.sh) + [03_GATK_GenomicsDBImport.sh](/01_Alignment_Postprocessing/03_GATK_GenomicsDBImport.sh) +  [04_GATK_GenotypeGVCFs.sh](/01_Alignment_Postprocessing/04_GATK_GenotypeGVCFs.sh)
  
## 02_Genome-wide_Summary_Analyses
- PCA -> [01_GL_for_PCAdmix.sh](/02_Genomewide_Analyses/PCA/01_GL_for_PCAdmix.sh) + [02_merge_GL.sh](/02_Genomewide_Analyses/PCA/02_merge_GL.sh) + [03_run_PCAdmix.sh](/02_Genomewide_Analyses/PCA/03_run_PCAdmix.sh) + [04_plotPCA.R](/02_Genomewide_Analyses/PCA/04_plotPCA.R)
- Individual admixture proportions -> [01_NGSAdmix_getGL.sh](/02_Genomewide_Analyses/Individual_Admixture_Prop/01_NGSAdmix_getGL.sh) + [02_NGSAdmix_merge.sh](/02_Genomewide_Analyses/Individual_Admixture_Prop/02_NGSAdmix_merge.sh)  + [03_NGSAdmix_run.sh](/02_Genomewide_Analyses/Individual_Admixture_Prop/03_NGSAdmix_run.sh) + [04_NGSAdmix_plot.R](/02_Genomewide_Analyses/Individual_Admixture_Prop/04_NGSAdmix_plot.R) and [05_NGSAdmix_plot_on_map.R]


## 03_Demographic_History_Analyses 

- PSMC -> [00_keepautosomes.sh](/04_Demographic_History/01_PSMC/00_keepautosomes.sh) + [01_bam2fq.sh](/04_Demographic_History/01_PSMC/01_bam2fq.sh) + [02_fq2psmcfa.sh](/04_Demographic_History/01_PSMC/02_fq2psmcfa.sh) + [03_psmcfa2psmc.sh](/04_Demographic_History/01_PSMC/03_psmcfa2psmc.sh) + [04_plotPSMC.sh](/04_Demographic_History/01_PSMC/04_plotPSMC.sh) + [05_plotinR.sh](/04_Demographic_History/01_PSMC/05_plotinR.sh) + [06_downsample.sh](/04_Demographic_History/01_PSMC/06_downsample.sh)
- Estimate the heterozygosity using ANGSD and genotype likelihoods -> [01_heterozygosity_ANGSD.sh](/04_Demographic_History/02_GeneticDiversity/01_heterozygosity_ANGSD.sh) + [02_plot_heterozygosity_on_map.R](/04_Demographic_History/02_GeneticDiversity/02_plot_heterozygosity_on_map.R)
- ROH -> [adjust_geneticmap.sh](/04_Demographic_History/03_ROH/adjust_geneticmap.sh) + [03.SubsetandFilterindividuals.sh](/04_Demographic_History/03_ROH/03.SubsetandFilterindividuals.sh) + [03.splitbychr.sh](/04_Demographic_History/03_ROH/03.splitbychr.sh) + [05.bcftoolsROH.sh](/04_Demographic_History/03_ROH/05.bcftoolsROH.sh) + [06.pulloutRG.sh](/04_Demographic_History/03_ROH/06.pulloutRG.sh) + [07.Plot_CummulativeROH.R](/04_Demographic_History/03_ROH/07.Plot_CummulativeROH.R)
- NGSRelate to use genotype likelihoods ->  [01_NGSrelate_setup.sh](/04_Demographic_History/04_InbreedingCoefficient/01_NGSrelate_setup.sh) + [02_NGSrelate_combine.sh](/04_Demographic_History/04_InbreedingCoefficient/02_NGSrelate_combine.sh) + [03_NGSrelate_run.sh](/04_Demographic_History/04_InbreedingCoefficient/03_NGSrelate_run.sh)


## 03_Geneflow
 - Twisst analyses for topology weighting [00_phasing.sh](/03_Geneflow_Analyses/01_twisst/00_phasing.sh) + [01_twisst_vcf2geno.sh](/03_Geneflow_Analyses/01_twisst/01_twisst_vcf2geno.sh) + [02_twisst_geno2phy.sh](/03_Geneflow_Analyses/01_twisst/02_twisst_geno2phy.sh) + [03_twisst_KU.sh](/03_Geneflow_Analyses/01_twisst/03_twisst_KU.sh)  + [04_results_plot.R](/03_Geneflow_Analyses/01_twisst/04_results_plot.R) + [06_overlaptwisst_results_centralAsia.sh](/03_Geneflow_Analyses/01_twisst/06_overlaptwisst_results_centralAsia.sh) 
- FEEMS -> [01_FEEMS_new.FINALsh](/03_Geneflow_Analyses/02_FEEMS/01_FEEMS_new.FINALsh) 
- D statistic -> [01_Dstat_vcf2ped.sh](/03_Geneflow_Analyses/Dstatistics/01_Dstat_vcf2ped.sh) + [02_Dstat_ped2eigen.sh](/03_Geneflow_Analyses/Dstatistics/02_Dstat_ped2eigen.sh) + [03_Dstat_run.sh](/03_Geneflow_Analyses/Dstatistics/03_Dstat_run.sh) + [04_plotMap_Dstat.R](/03_Geneflow_Analyses/Dstatistics/04_plotMap_Dstat.R) + [04_plot_boxplot.R](/03_Geneflow_Analyses/Dstatistics/04_plot_boxplot.R)
  
## 04_Phylogenetics
- Still updating

For script-related questions, please email Dr. Lauren Mae Hennelly at lauren.hennelly@sund.ku.dk




/projects/mjolnir1/people/crq857/Chapter2

/projects/psg/people/crq857/Chapter2/ref















