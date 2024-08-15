#!/usr/bin/env bash
#SBATCH --job-name=iqtree
#SBATCH -c 1
#SBATCH --time 11:40:00
#SBATCH --mem-per-cpu 10G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout/lowrecombination_vcf2phy_noadmix_auto.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout/lowrecombination_vcf2phy_noadmix_auto.err

#conda activate /projects/mjolnir1/apps/conda/python-3.5.6 #this may differ for your cluster. The vcf2phylip needs a specific python version

#Xchromosome
VCF=/projects/mjolnir1/people/crq857/Chapter2/06_Datasets/2gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_lowrecombination_noEthnodogs.recode.vcf 
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/06_Datasets/

python /projects/mjolnir1/people/crq857/Geneflow_Dogs/bin/vcf2phylip/vcf2phylip.py -i ${VCF} --output-folder ${OUTDIR} --output-prefix 2gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_lowrecombination_noEthnodogs -o AndeanFox
python /projects/mjolnir1/people/crq857/Geneflow_Dogs/bin/vcf2phylip/vcf2phylip.py -i ${xVCF_noadmix} --output-folder ${OUTDIR} --output-prefix Xchr_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_lowrecombination_noadmixPak -o Dhole_BerlinZoo

#You can download vcf2phylip here: https://github.com/edgardomortiz/vcf2phylip
# In this script above, you also need to indicate an outgroup with the -o flag

#Autosomes 
VCF=/projects/mjolnir1/people/crq857/Chapter2/06_Datasets/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAL_lowrecombination.vcf.recode.vcf
VCF_noadmix=/projects/mjolnir1/people/crq857/Chapter2/06_Datasets/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_lowrecombination_noPakistan.recode.vcf

OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/06_Datasets/

python /projects/mjolnir1/people/crq857/Geneflow_Dogs/bin/vcf2phylip/vcf2phylip.py -i ${VCF} --output-folder ${OUTDIR} --output-prefix Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_lowrecombination -o Dhole_BerlinZoo
python /projects/mjolnir1/people/crq857/Geneflow_Dogs/bin/vcf2phylip/vcf2phylip.py -i ${VCF_noadmix} --output-folder ${OUTDIR} --output-prefix Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_lowrecombination_noadmix_Pak -o Dhole_BerlinZoo


# Low recombination autosomes
#!/usr/bin/env bash
#SBATCH --job-name=iqtree
#SBATCH -c 1
#SBATCH --time 11:40:00
#SBATCH --mem-per-cpu 10G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout/lowrecombination_vcf2phy_noadmix_auto.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout/lowrecombination_vcf2phy_noadmix_auto.err

#conda activate /projects/mjolnir1/apps/conda/python-3.5.6 #this may differ for your cluster. The vcf2phylip needs a specific python version

VCF=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/Aug14_lowrecautosomes/input/list2.txt) #this is the specific script to tell the cluster to run an array. 
DIR=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/Aug14_lowrecautosomes/input
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/Aug14_lowrecautosomes/phyfiles

python /projects/mjolnir1/people/crq857/Geneflow_Dogs/bin/vcf2phylip/vcf2phylip.py -i ${DIR}/${VCF} --output-folder ${OUTDIR} --output-prefix ${VCF}_phy -o Dhole_BerlinZoo


list2.txt

