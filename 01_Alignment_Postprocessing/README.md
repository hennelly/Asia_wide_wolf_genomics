# Alignment and SNP Calling

## 1.0 Alignment to the Dog Genome
 - We used the program Paleomix to align each raw read to the canfam3.1 genome -  [01_Alignment_paleomix.sh](/01_Alignment_Postprocessing/01_Alignment_paleomix.sh)
 - The yaml file contains the specific programs and options: [01_example_yaml.yaml](/01_Alignment_Postprocessing/01_example_yaml.yaml) 
## 2.0 SNP Calling with GATK 
- First, I used GATK HaplotypeCalling for each bam, with an array to run for each chromosome- [02_GATK_haplotypecaller.sh](/01_Alignment_Postprocessing/02_GATK_haplotypecaller.sh)
- Second, I ran GenomeDBImport - [03_GATK_GenomicsDBImport.sh](/01_Alignment_Postprocessing/03_GATK_GenomicsDBImport.sh)
- Lastly, I ran GenotypeGVCF by chromosome - [04_GATK_GenotypeGVCFs.sh](/01_Alignment_Postprocessing/04_GATK_GenotypeGVCFs.sh)


