#!/usr/bin/env bash
#SBATCH --job-name=iqtree
#SBATCH -c 1
#SBATCH --time 00:40:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Geneflow_Dogs/slurmout/vcf2python_fullgenome.out
#SBATCH -e /home/crq857/projects/Geneflow_Dogs/slurmout/vcf2python_fullgenome.err

#conda activate /projects/mjolnir1/apps/conda/python-3.5.6 #this may differ for your cluster. The vcf2phylip needs a specific python version

#autosomes
VCF=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/input
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/phyfiles

python /projects/mjolnir1/people/crq857/Geneflow_Dogs/bin/vcf2phylip/vcf2phylip.py -i ${DIR}/autosomes.vcf --output-folder ${OUTDIR} --output-prefix autosomes_phy -o Dhole_BerlinZoo

#You can download vcf2phylip here: https://github.com/edgardomortiz/vcf2phylip
# In this script above, you also need to indicate an outgroup with the -o flag

#X chromosome 
