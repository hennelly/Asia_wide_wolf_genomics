#!/usr/bin/env bash
#SBATCH --job-name=fsc
#SBATCH --array=1-38%10
#SBATCH -c 1
#SBATCH --time 03:10:00
#SBATCH --mem-per-cpu 2G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout_fsc/fsc_GATK_Genotype_3_%A_%a.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout_fsc/fsc_GATK_Genotype_3_%A_%a.err

# Change NUMBER in line 4 to the total number of chromosomes in your organism (also the result of `wc -l < chromosome_lengths.txt`)

echo "My SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID
number=$(sed "${SLURM_ARRAY_TASK_ID}q;d"  /home/crq857/projects/Chapter3/files/chromosomelist_length.txt| cut -f1)

#Used the second of two commands below, which has SNP ID's, here. freebayes commented out so I could re-run samtools and fix the monomorphic calls.

cd ${number}/samtools/


Kyrgyz_WLF179
Kyrgyz_WLF180
BH6_Indian_Wolf
BH126_Indian_Wolf
Indianwolf_SRR13985171
BH124_Indian_Wolf
Indianwolf_BH123
Iranwolf_SRR12009566
Iranwolf_SRR12009567
Iranwolf_SRR12009568
IranWolf
Saudi_wolf_B1
Syrian_wolf
Iran_SAMC036723
Iran_SRR20326411
Iran_SRR20326410
Lebanonwolf
Iran_SRR20326408
CAN24
CAN30
Russia_SRR20326404
Russia_SRR20326403
Russia_SRR20326401
Russia_SRR20326400
Russia_SRR20326388
China_SRR20326486
China_SRR20326485
China_SRR20326484
China_SRR20326483
MW486



cat <(grep "#" /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_BCFtools_fsc/${number}/samtools/${number}.1-1000001.vcf) <(grep --no-filename -v "#" /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_BCFtools_fsc/${number}/samtools/*vcf | sort -n -k2) > /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_BCFtools_fsc/${number}/samtools/${number}.vcf
cat <(grep "#" /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_BCFtools_fsc/${number}/samtools/${number}.vcf) <(paste <(grep -v "#" /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_BCFtools_fsc/${number}/samtools/${number}.vcf | cut -f1,2) <(grep -v "#" /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_BCFtools_fsc/${number}/samtools/${number}.vcf | awk '{print $1"_"$2}') <(grep -v "#" /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_BCFtools_fsc/${number}/samtools/${number}.vcf | cut -f4-)) | awk '$5!="." {print}' > /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_BCFtools_fsc/${number}/${number}.samtools.WithIDs.vcf

/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_BCFtools_fsc/chr4/samtools/chr4.1-1000001.vcf
/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_BCFtools_fsc/chr3/samtools/chr3.1-1000001.vcf

 /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_BCFtools_fsc/chr3/samtools/chr3.1-100001.vcf
 /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_BCFtools_fsc/chr3/samtools/chr3.1-1000001.vcf


 cat your_file.vcf |tail -n +12 |awk '{FS="\t";OFS="\t";print $1,$2-1,$2,$3, etc}' >your_file.bed







#!/usr/bin/env bash

#SBATCH --job-name=snps
#SBATCH --array=1-86%20
#SBATCH -c 1
#SBATCH --time 24:00:00
#SBATCH --mem-per-cpu 2G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout_fsc/fsc_GATK_Genotypee_%A_%a.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout_fsc/fsc_GATK_Genotypee_%A_%a.err

# load the modules
module load perl
module load gsl/2.5
module load bcftools

echo "My SLURM_ARRAY_TASK_ID: " 2
start=$(sed "${SLURM_ARRAY_TASK_ID}q;d" ranges.txt | cut -f2)
end=$(sed "${SLURM_ARRAY_TASK_ID}q;d" ranges.txt | cut -f3)
echo "Processing chr2 at ${start}-${end}"

bcftools mpileup -f /projects/mjolnir1/people/crq857/Chapter2/ref/canFam31.fasta -r chr2:${start}-${end} -b /home/crq857/projects/Chapter2/scripts_fastsimcoal/bamlist.txt | bcftools call -m -Oz -f GQ - > samtools/chr2.${start}-${end}.vcf.gz


/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_BCFtools_fsc/All_Combined.samtools.WithIDs.vcf



#!/usr/bin/env bash

#SBATCH --job-name=snps
#SBATCH --array=1-70%20
#SBATCH -c 1
#SBATCH --time 24:00:00
#SBATCH --mem-per-cpu 2G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout_fsc/fsc_GATK_Genotypee_%A_%a.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout_fsc/fsc_GATK_Genotypee_%A_%a.err

# load the modules
module load perl
module load gsl/2.5
module load bcftools

echo "My SLURM_ARRAY_TASK_ID: " 10
start=$(sed "${SLURM_ARRAY_TASK_ID}q;d" ranges.txt | cut -f2)
end=$(sed "${SLURM_ARRAY_TASK_ID}q;d" ranges.txt | cut -f3)
echo "Processing chr10 at ${start}-${end}"

bcftools mpileup -f /projects/mjolnir1/people/crq857/Chapter2/ref/canFam31.fasta -r chr10:${start}-${end} -b /home/crq857/projects/Chapter2/scripts_fastsimcoal/bamlist.txt | bcftools call -m -Oz -f GQ - > samtools/chr10.${start}-${end}.vcf.gz






