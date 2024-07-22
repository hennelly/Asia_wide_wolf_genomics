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

cat <(grep "#" /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_BCFtools_fsc/${number}/samtools/${number}.1-1000001.vcf) <(grep --no-filename -v "#" /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_BCFtools_fsc/${number}/samtools/*vcf | sort -n -k2) > /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_BCFtools_fsc/${number}/samtools/${number}.vcf
cat <(grep "#" /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_BCFtools_fsc/${number}/samtools/${number}.vcf) <(paste <(grep -v "#" /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_BCFtools_fsc/${number}/samtools/${number}.vcf | cut -f1,2) <(grep -v "#" /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_BCFtools_fsc/${number}/samtools/${number}.vcf | awk '{print $1"_"$2}') <(grep -v "#" /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_BCFtools_fsc/${number}/samtools/${number}.vcf | cut -f4-)) | awk '$5!="." {print}' > /projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_BCFtools_fsc/${number}/${number}.samtools.WithIDs.vcf

#!/usr/bin/env bash



## OTHER SCRIPTS ###

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






