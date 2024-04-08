#!/usr/bin/env bash
#SBATCH --job-name=fsc
#SBATCH --array=1-38%10
#SBATCH -c 1
#SBATCH --time 00:10:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout_fsc/fsc_GATK_Genotype_%A_%a.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout_fsc/fsc_GATK_Genotype_%A_%a.err

# Change NUMBER in line 4 to the total number of chromosomes in your organism (also the result of `wc -l < chromosome_lengths.txt`)

echo "My SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID
number=$(sed "${SLURM_ARRAY_TASK_ID}q;d"  /home/crq857/projects/Chapter3/files/chromosomelist_length.txt| cut -f1)

#Used the second of two commands below, which has SNP ID's, here. freebayes commented out so I could re-run samtools and fix the monomorphic calls.

cd ${number}/samtools/
gunzip *vcf

cat <(grep "#" ${number}/samtools/${number}.1-100001.vcf) <(grep --no-filename -v "#" ${number}/samtools/*vcf | sort -n -k2) > ${number}/samtools/${number}.vcf
cat <(grep "#" ${number}/samtools/${number}.vcf) <(paste <(grep -v "#" ${number}/samtools/${number}.vcf | cut -f1,2) <(grep -v "#" ${number}/samtools/${number}.vcf | awk '{print $1"_"$2}') <(grep -v "#" ${number}/samtools/${number}.vcf | cut -f4-)) | awk '$5!="." {print}' > ${number}/${number}.samtools.WithIDs.vcf
