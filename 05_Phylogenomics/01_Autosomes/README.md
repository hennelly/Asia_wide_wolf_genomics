# Inferring autosomal phylogeny with ASTRAL 

I ran two separate analyses for inferring the autosomal phylogeny. These were (1) including all gray wolves and (2) excluding admixed wolves, consisting of all wolves from Pakistan and SW Asia, and Tajikistan. 

- First, I filtered the dataset to include only the taxa I'm interested in -> [01_ASTRAL_allwolvesfilter.sh](/05_Phylogenomics/01_Autosomes/01_ASTRAL_allwolvesfilter.sh) and [01_ASTRAL_noadmixwolvesfilter.sh](/05_Phylogenomics/01_Autosomes/01_ASTRAL_noadmixwolvesfilter.sh)

- Select 20,000kb length segments at 5,000 random region -> [02_ASTRAL_selectrandom.sh](/05_Phylogenomics/01_Autosomes/02_ASTRAL_selectrandom.sh)
    - I then cd into the directory where all the random regions are located, and did 'ls > regions.txt'. This gives me a list of regions so I can run an array

- Subset the vcf files to include only the 20,000kb length segments at 5,000 random regions -> [03_ASTRAL_subset5000regions.sh](/05_Phylogenomics/01_Autosomes/03_ASTRAL_subset5000regions.sh)
    - I then cd into the directory where all the random regions are located, and did 'ls > listfiles.txt'. This gives me a list of vcfs of the 5,000 regions so I can run an array

- Convert each of the 5,000 vcfs to a phy file -> [04_ASTRAL_vcf2phy.sh](/05_Phylogenomics/01_Autosomes/04_ASTRAL_vcf2phy.sh)
