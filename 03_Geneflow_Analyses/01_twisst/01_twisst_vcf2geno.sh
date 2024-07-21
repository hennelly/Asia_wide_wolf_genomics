#!/usr/bin/env bash
#SBATCH --job-name=twisst
#SBATCH -c 1
#SBATCH --time 1-10:30:00
#SBATCH --mem-per-cpu 5G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout/twisst_%A_%a.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout/twisst_%A_%a.err
#SBATCH --array=1-38%5

module load python/2.7.18
module load numpy

CHR=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /home/crq857/projects/Geneflow_Dogs/files/chrlist_angsd.txt | cut -f1)

DIR=/projects/mjolnir1/people/crq857/Chapter2/phasedvcf
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/03_GeneflowAnalyses/twisst/geno

#conda activate /projects/mjolnir1/apps/conda/numpy-1.21.2
## Convert to Geno
python3 /projects/mjolnir1/people/crq857/bin/genomics_general/VCF_processing/parseVCF.py -i ${DIR}/gatk_${CHR}_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_final.recode.vcf --skipIndels | gzip > ${OUTDIR}/gatk_${CHR}_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final.geno.gz

# X chromosome 
XCHR=/group/ctbrowngrp2/hennelly/hennelly/Redwolf/files_May/Asianwolves_gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.vcf
OUT=/group/ctbrowngrp2/hennelly/hennelly/Redwolf/files_May/Asianwolves_gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.geno.gz

python3 /projects/mjolnir1/people/crq857/bin/genomics_general/VCF_processing/parseVCF.py -i ${XCHR} --skipIndels | gzip > ${OUT}



/home/crq857/projects/Chapter2/scripts_Dec/out_autosomes.nex

scp -r crq857@mjolnirgate.unicph.domain:/home/crq857/projects/Chapter2/scripts_Dec/out_autosomes.nex   ~/Desktop

#!/usr/bin/env bash
#SBATCH --job-name=twisst
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --time 4-12:00:00
#SBATCH --mem=10GB
#SBATCH -o /home/hennelly/Asianwolves/slurmout/02_twisst_Asianwolves_final_Tib_nnewtwisst_EastAsia_%A_%a.out
#SBATCH -e /home/hennelly/Asianwolves/slurmout/02_twisst_Asianwolves_final_Tib_nnewtwisst_EastAsia_%A_%a.err
#SBATCH -p high
#SBATCH --array=2-38%15

echo "My SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID
CHR=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /home/hennelly/Redwolf/files/chrlist.txt | cut -f1)

DIR=/group/ctbrowngrp2/hennelly/hennelly/Asianwolves/phyml
OUTDIR=/group/ctbrowngrp2/hennelly/hennelly/Asianwolves/output

conda activate ete3_python3


popfileTib=/group/ctbrowngrp2/hennelly/hennelly/Asianwolves/phyml/TwisstTibetan_popfile.txt
#For Tajikistan wolves
python3 /home/hennelly/Redwolf/bin/twisst/twisst.py -t ${DIR}/gatk_chr${CHR}_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final.phyml.trees.gz -w ${OUTDIR}/gatk_chr${CHR}_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_twisst_EastAsia -g Tibetan -g EastAsia -g Russia -g Europe -g Andeanfox --outgroup Andeanfox --method complete --groupsFile ${popfileTib}




