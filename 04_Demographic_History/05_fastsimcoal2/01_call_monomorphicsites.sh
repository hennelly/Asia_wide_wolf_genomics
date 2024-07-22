DIR=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_BCFtools_fsc

#!/usr/bin/env bash

#SBATCH --job-name=fsc
#SBATCH -c 1
#SBATCH --time 00:10:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout_fsc/fsc_GATK_Genotype_%A_%a.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout_fsc/fsc_GATK_Genotype_%A_%a.err
#SBATCH --array=1-38%10

# Change NUMBER in line 4 to the total number of chromosomes in your organism (also the result of `wc -l < chromosome_lengths.txt`)

echo "My SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID
number=$(sed "${SLURM_ARRAY_TASK_ID}q;d"  /home/crq857/projects/Chapter3/files/chromosomelist_length.txt | cut -f1)
length=$(sed "${SLURM_ARRAY_TASK_ID}q;d"  /home/crq857/projects/Chapter3/files/chromosomelist_length.txt | cut -f2)

mkdir ${number}
mkdir ${number}/samtools

# Split into 1000kb chunks
for count in $(seq 1 1000000 ${length}); do
        upper=$(echo "${count} + 1000000" | bc)
        echo -e "${number}\t${count}\t${upper}"
done > ${number}/ranges.txt

lines=$(wc -l < ${number}/ranges.txt)

echo "#!/usr/bin/env bash

#SBATCH --job-name=snps
#SBATCH --array=1-${lines}%20
#SBATCH -c 1
#SBATCH --time 24:00:00
#SBATCH --mem-per-cpu 2G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout_fsc/fsc_GATK_Genotypee_%A_%a.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout_fsc/fsc_GATK_Genotypee_%A_%a.err

# load the modules
module load perl
module load gsl/2.5
module load bcftools

echo \"My SLURM_ARRAY_TASK_ID: \" $SLURM_ARRAY_TASK_ID
start=\$(sed \"\${SLURM_ARRAY_TASK_ID}q;d\" ranges.txt | cut -f2)
end=\$(sed \"\${SLURM_ARRAY_TASK_ID}q;d\" ranges.txt | cut -f3)
echo \"Processing ${number} at \${start}-\${end}\"

samtools mpileup -f /projects/mjolnir1/people/crq857/Chapter2/ref/canFam31.fasta -r ${number}:\${start}-\${end} -b /home/crq857/projects/Chapter2/scripts_fastsimcoal/bamlist.txt | bcftools call -m -Oz -f GQ - > samtools/${number}.\${start}-\${end}.vcf
" > ${number}/${number}.bcftools.sh










