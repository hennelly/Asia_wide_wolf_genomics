#!/usr/bin/env bash
#SBATCH --job-name=filterGATK
#SBATCH -c 1
#SBATCH --time 2-11:00:00
#SBATCH --mem-per-cpu 20G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout/fsc_filterGATK_%A_%a.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout/fsc_filterGATK_%A_%a.err
#SBATCH --array=1-39%10

CHR=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /home/crq857/projects/Chapter3/files/chromosomelist.txt | cut -f1)

## filter to keep only individuals I'm interested in with removing non-variant SNPs

KEEP=keep.txt

module load perl
module load vcftools

vcftools --gzvcf gatk_${CHR}.vcf.gz --keep ${KEEP} --non-ref-ac-any 1 --recode --recode-INFO-all --out gatk_fsc_${CHR}.vcf


#!/usr/bin/env bash
#SBATCH --job-name=filterGATK
#SBATCH -c 1
#SBATCH --time 11:00:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Geneflow_Dogs/slurmout/filterGATK_allchr_combine.out
#SBATCH -e /home/crq857/projects/Geneflow_Dogs/slurmout/filterGATK_allchr_combine.err

#for autosomes
cat <(grep "#" gatk_fsc_chr1.vcf.recode.vcf) <(for number in $(seq 1 1 38); do grep -v "#" gatk_fsc_chr${number}.vcf.recode.vcf; done) > Individuals_fsc_unfiltered.recode.vcf





keep

Indianwolf_BH6
Indianwolf_BH126
Indianwolf_SRR13985171
Indianwolf_BH124
Indianwolf_BH123
Wolf_Iran_Kerman_SRR12009566
Wolf_Iran_Tehran_SRR12009567
Wolf_Iran_Hamadan
Wolf_GeneralIran
Wolf_Syria
Wolf_Iran_Hajjiabad
Wolf_SaudiArabia
Wolf_Iran_Zanjan
Wolf_Iran_Tehran_SRR20326410
Lebanonwolf
Wolf_Iran_Tehran_SRR20326408
Wolf_Xinjiang_CAN24
Wolf_Xinjiang_CAN30
Wolf_Russia_SRR20326404
Wolf_Russia_SRR20326403
Wolf_Russia_SRR20326401
Wolf_Russia_SRR20326400
Wolf_Russia_SRR20326388
China_SRR20326485_Xinjiang
China_SRR20326484_Xinjiang
China_SRR20326483_Xinjiang
Wolf_China_SRR20326486
Wolf_Kyrgyz179
Wolf__Kyrgyz180

