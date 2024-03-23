#!/usr/bin/env bash
#SBATCH --job-name=ASTRAL
#SBATCH -c 1
#SBATCH --time 00:40:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Geneflow_Dogs/slurmout/vcf2python_fullgenome_%A_%a.out
#SBATCH -e /home/crq857/projects/Geneflow_Dogs/slurmout/vcf2python_fullgenome_%A_%a.err
#SBATCH --array=1-5000%10

#conda activate /projects/mjolnir1/apps/conda/python-3.5.6

FILE=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/input/listfiles.txt)

DIR=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/input
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/phyfiles

#add header 
#cat header.txt ${DIR}/${FILE} > ${DIR}/${FILE}_header.vcf
#rm ${DIR}/${FILE}

python /projects/mjolnir1/people/crq857/Geneflow_Dogs/bin/vcf2phylip/vcf2phylip.py -i ${DIR}/${FILE}_header.vcf --output-folder ${OUTDIR} --output-prefix ${FILE}_phy -o Dhole_BerlinZoo

#X chro

Doing now: 

- Running X chromosome with all admixed wolves (including Pakistan and Ladakh wolves) 
- Rerun autosomes without admixed wolves because I accidently included a wolf from Tajikistan
- Get posterior probabilities of Autosomal
- Rerun autosomal tree with all wolves (including Pakistan and Ladakh wolves)
- Make D statistic figure
- Make EPAS1 figure - just haplotypes
- revise paper and make final supplemental figures 
- Make final supplemental tables 
- Make final script github


#!/usr/bin/env bash
#SBATCH --job-name=ASTRAL
#SBATCH -c 1
#SBATCH --time 00:40:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Geneflow_Dogs/slurmout/vcf2python_March2024_chrX_%A_%a.out
#SBATCH -e /home/crq857/projects/Geneflow_Dogs/slurmout/vcf2python_March2024_chrX_%A_%a.err
#SBATCH --array=1-5000%10

#conda activate /projects/mjolnir1/apps/conda/python-3.5.6

FILE=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/input/listfiles.txt)


DIR=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/input_chrX_March2024
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/phyfiles_chrX_March2024

#add header 
cat /projects/mjolnir1/people/crq857/Chapter2/06_Datasets/header_chrX.txt ${DIR}/${FILE} > ${DIR}/${FILE}_header.vcf
rm ${DIR}/${FILE}

python /projects/mjolnir1/people/crq857/Geneflow_Dogs/bin/vcf2phylip/vcf2phylip.py -i ${DIR}/${FILE}_header.vcf --output-folder ${OUTDIR} --output-prefix ${FILE}_phy -o Dhole_BerlinZoo



