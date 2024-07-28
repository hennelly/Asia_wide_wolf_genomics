#!/usr/bin/env bash
#SBATCH --job-name=ASTRAL
#SBATCH -c 1
#SBATCH --time 03:40:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Geneflow_Dogs/slurmout/vcf2python_fullgenome_Noadmix_%A_%a.out
#SBATCH -e /home/crq857/projects/Geneflow_Dogs/slurmout/vcf2python_fullgenome_noadmix_%A_%a.err
#SBATCH --array=1-1000%10

#conda activate /projects/mjolnir1/apps/conda/python-3.5.6

## NO DOGS WITH NA WOLVES

#cd /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/x_FINAL_July262024_input_autosomes_noadmix/
#ls > /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/x_FINAL_July262024_input_autosomes_noadmix/listfiles_autosomes_nodogswithNA.txt

FILE=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/x_FINAL_July262024_input_autosomes_noadmix/listfiles_autosomes_nnoadmix.txt)

DIR=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/x_FINAL_July262024_input_autosomes_noadmix
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/x_FINAL_July262024_phyfiles_autosomes_noadmix
VCF=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_VCFs_July262024/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_noNAwolvesLadakhPakistanTajWestAsia.recode.vcf

#add header 
grep "#" ${VCF} > header_autosomes.txt
cat header_autosomes.txt ${DIR}/${FILE} > ${DIR}/${FILE}_header.vcf

python /projects/mjolnir1/people/crq857/Geneflow_Dogs/bin/vcf2phylip/vcf2phylip.py -i ${DIR}/${FILE}_header.vcf --output-folder ${OUTDIR} --output-prefix ${FILE}_phy -o Dhole_BerlinZoo

## NO ADMIX 

#cd /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/x_FINAL_July262024_input_autosomes_noadmix/
#ls > /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/x_FINAL_July262024_input_autosomes_noadmix/listfiles_autosomes_nodogswithNA.txt

FILE=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/x_FINAL_July262024_input_autosomes_noadmix/listfiles_autosomes_nnoadmix.txt)

DIR=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/x_FINAL_July262024_input_autosomes_noadmix
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/x_FINAL_July262024_phyfiles_autosomes_noadmix
VCF=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/xFINAL_VCFs_July262024/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_forASTRAl_nodogs_noNAwolvesLadakhPakistanTajWestAsia.recode.vcf

#add header 
grep "#" ${VCF} > header_autosomes.txt
cat header_autosomes.txt ${DIR}/${FILE} > ${DIR}/${FILE}_header.vcf

python /projects/mjolnir1/people/crq857/Geneflow_Dogs/bin/vcf2phylip/vcf2phylip.py -i ${DIR}/${FILE}_header.vcf --output-folder ${OUTDIR} --output-prefix ${FILE}_phy -o Dhole_BerlinZoo







#!/usr/bin/env bash
#SBATCH --job-name=ASTRAL
#SBATCH -c 1
#SBATCH --time 00:40:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Geneflow_Dogs/slurmout/vcf2python_fullgenomelistfiles.out
#SBATCH -e /home/crq857/projects/Geneflow_Dogs/slurmout/vcf2python_fullgenomelistfiles.err

DIR=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/input_March2024
ls ${DIR}/*vcf > ${DIR}/listfiles.txt

/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/input_March2024/listfiles.txt
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

/projects/mjolnir1/people/crq857/Chapter2/03_GeneflowAnalyses/Treemix/files/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_noadmixwolf_treemix_nowestasia

#!/usr/bin/env bash
#SBATCH --job-name=astral
#SBATCH -c 1
#SBATCH --time 05:10:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout_Oct/astral_extract_onlypureMarch_%A_%a.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout_Oct/astral_extract_onlypureMarch_%A_%a.err
#SBATCH --array=10-5000%10

BEDFILE=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/bedfiles/listfiles.txt)
DIR=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/input_auto_noadmix_March2024
VCF=/projects/mjolnir1/people/crq857/Chapter2/03_GeneflowAnalyses/Treemix/files/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_noadmixwolf_treemix_nowestasia.recode.vcf

module load bedtools

bedtools intersect -a ${VCF} -b /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/bedfiles/${BEDFILE} > ${DIR}/Autosomes_noadmixwolves_onlypure_March2024_${BEDFILE}.vcf





#!/usr/bin/env bash
#SBATCH --job-name=twisst
#SBATCH --array=1
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --time 3-12:00:00
#SBATCH --mem=40GB
#SBATCH -o /home/hennelly/Redwolf/slurmout/02_twisst_March28_final_nnewtwisst_%A_%a.out
#SBATCH -e /home/hennelly/Redwolf/slurmout/02_twisst_March28_final_nnewtwisst_%A_%a.err
#SBATCH -p high
#SBATCH --array=1-38

echo "My SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID
CHR=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /home/hennelly/Redwolf/files/chrlist.txt | cut -f1)

DIR=/group/ctbrowngrp2/hennelly/hennelly/Redwolf/twisstMarch27_2
OUTDIR=/group/ctbrowngrp2/hennelly/hennelly/Redwolf/twisstMarch27_2

conda activate ete3_python3

python3 /home/hennelly/Redwolf/bin/twisst/twisst.py -t ${DIR}/working_20231205_mpileup_autosomes_filterA3_all_biallelic_maxmiss0.90_March12_bestind_phased_chr${CHR}_noRedwolfdog.phyml.trees.gz -w ${OUTDIR}/output.weights_chr${CHR}_root_March27_Eastern_coyote_Wolf_newtwisst.csv.gz -g Easternwolf -g Coyote -g Graywolf -g Dhole --method complete --groupsFile samplelisttwisst_Mar27.txt 








#!/usr/bin/env bash
#SBATCH --job-name=astral
#SBATCH -c 1
#SBATCH --time 05:10:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout_Oct/astral_extract_onlypure_%A_%a.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout_Oct/astral_extract_onlypure_%A_%a.err
#SBATCH --array=10-5000%10

BEDFILE=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/bedfiles/listfiles.txt)
DIR=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/input_auto_noadmix
VCF=/projects/mjolnir1/people/crq857/Chapter2/03_GeneflowAnalyses/Treemix/files/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_noadmixwolf_treemix_nowestasia.recode.vcf

module load bedtools

bedtools intersect -a ${VCF} -b /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/bedfiles/${BEDFILE} > ${DIR}/Autosomes_noadmixwolves_onlypure_${BEDFILE}.vcf






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



#!/usr/bin/env bash
#SBATCH --job-name=ASTRAL
#SBATCH -c 1
#SBATCH --time 00:40:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Geneflow_Dogs/slurmout/vcf2python_March2024_chrX_%A_%a.out
#SBATCH -e /home/crq857/projects/Geneflow_Dogs/slurmout/vcf2python_March2024_chrX_%A_%a.err
#SBATCH --array=1-500%10

#conda activate /projects/mjolnir1/apps/conda/python-3.5.6

FILE=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/input_chrX_March2024/listfileschrX.txt)


DIR=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/input_chrX_March2024
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/05_Phylogenomics/phyfiles_chrX_March2024

#add header 
cat /projects/mjolnir1/people/crq857/Chapter2/06_Datasets/header_chrX.txt ${DIR}/${FILE} > ${DIR}/${FILE}_header.vcf
rm ${DIR}/${FILE}

python /projects/mjolnir1/people/crq857/Geneflow_Dogs/bin/vcf2phylip/vcf2phylip.py -i ${DIR}/${FILE}_header.vcf --output-folder ${OUTDIR} --output-prefix ${FILE}_phy -o Dhole_BerlinZoo





