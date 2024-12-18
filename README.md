# Asia_wide_wolf_genomics
Scripts for manuscript "Complex genomic ancestry in southern regions and drivers of continental-level genetic diversity in the wolves of Asia"

## Sample List 
- Meta-data for the 11 newly sequenced canids, which consisted of 1 dog from Pakistan, whole genomes of 2 wolves from Kyrgyzstan, and 8 reduced representation sequences from Pakistan is avaliable here: [Samplelist](/00_SamplesMetadata/Metadata_Hennelly_etal_2023.xlsx)

## 01_Alignment_SNPCalling
- Paleomix pipeline for mapping to canfam3.1 genome -> [01_Alignment_paleomix.sh](/01_Alignment_Postprocessing/01_Alignment_paleomix.sh)
- GATK pipeline -> [02_GATK_haplotypecaller.sh](/01_Alignment_Postprocessing/02_GATK_haplotypecaller.sh) + [03_GATK_GenomicsDBImport.sh](/01_Alignment_Postprocessing/03_GATK_GenomicsDBImport.sh) +  [04_GATK_GenotypeGVCFs.sh](/01_Alignment_Postprocessing/04_GATK_GenotypeGVCFs.sh)
  
## 02_Genome-wide_Summary_Analyses
- PCA -> [01_GL_for_PCAdmix.sh](/02_Genomewide_Analyses/PCA/01_GL_for_PCAdmix.sh) + [02_merge_GL.sh](/02_Genomewide_Analyses/PCA/02_merge_GL.sh) + [03_run_PCAdmix.sh](/02_Genomewide_Analyses/PCA/03_run_PCAdmix.sh) + [04_plotPCA.R](/02_Genomewide_Analyses/PCA/04_plotPCA.R)
- Individual admixture proportions -> [01_NGSAdmix_getGL.sh](/02_Genomewide_Analyses/Individual_Admixture_Prop/01_NGSAdmix_getGL.sh) + [02_NGSAdmix_merge.sh](/02_Genomewide_Analyses/Individual_Admixture_Prop/02_NGSAdmix_merge.sh)  + [03_NGSAdmix_run.sh](/02_Genomewide_Analyses/Individual_Admixture_Prop/03_NGSAdmix_run.sh) + [04_NGSAdmix_plot.R](/02_Genomewide_Analyses/Individual_Admixture_Prop/04_NGSAdmix_plot.R) and [05_NGSAdmix_plot_on_map.R]

## 03_Geneflow
- D statistics -> [01_makeancestralfasta.sh](/03_GeneFlow/01_makeancestralfasta.sh) + [02_doabbababa.sh](/03_GeneFlow/02_doabbababa.sh) + [03_dojackknife.sh](/03_GeneFlow/03_dojackknife.sh) +  [04_plot_Dstat_figure.R](/03_GeneFlow/04_plot_Dstat_figure.R)
  
## 04_Phylogenetics
- Infer mitochondrial phylogeny -> [01_beast.sh](/04_Phylogenetics/01_beast.sh) + [02_treeannotator.sh](/04_Phylogenetics/02_treeannotator.sh) 
- Plotting elevation + mtDNA lineage -> [03_plotting_mtDNA_and_elevation.R](/04_Phylogenetics/03_plotting_mtDNA_and_elevation.R) 
- Plotting mtDNA with map in R -> [04_plotting_mtDNA_on_map.R](/04_Phylogenetics/04_plotting_mtDNA_on_map.R)

For script-related questions, please email Dr. Lauren Mae Hennelly at lauren.hennelly@sund.ku.dk






