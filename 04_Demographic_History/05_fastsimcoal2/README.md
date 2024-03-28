# Demographic modeling with fastsimcoal2

## Generating the SFS file 
- Before generating the SFS, there are important guidelines for how to filter the vcf file. Important notes to keep in mind is having the number of monomorphic sites and mutation rate is important to estimate parameters with time in generations.
     - Since I have an unfiltered VCF file, I can obtain the number of monomorphic sites by the chromosome length I aligned the raw reads to.
- Otherwise, it is important to use no MAF filter, as singletons are crucial for the analysis. I will filter the raw vcf file by:
     - Depth per site. I will exclude sites per individual 
 
inbreeding coefficient below 0.12

