# FEEMS 


/projects/mjolnir1/people/crq857/Geneflow_Dogs/bams/Namibia_NA8.yaml/CanFam31/Namibia_NA8.yaml/Namibia_NA8.bam
/projects/mjolnir1/people/crq857/Geneflow_Dogs/bams/Namibia_NA8.yaml/CanFam31/Namibia_NA8.yaml/Namibia_NA63.bam


#!/usr/bin/env bash
#SBATCH --job-name=ASTRAL
#SBATCH -c 1
#SBATCH --time 03:40:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Geneflow_Dogs/slurmout/vcf2python_fullgenome_Noadmix_%A_%a.out
#SBATCH -e /home/crq857/projects/Geneflow_Dogs/slurmout/vcf2python_fullgenome_noadmix_%A_%a.err

cp Lib1.rmdup.normal.bam Namibia_NA8.bam

#!/usr/bin/env bash
#SBATCH --job-name=Haplocaller
#SBATCH -c 1
#SBATCH --time 2-11:00:00
#SBATCH --mem-per-cpu 10G
#SBATCH -o /home/crq857/projects/TSHRpaper/slurmout/GATK_Haplocaller_Dogs_SubAfrica_1756.out
#SBATCH -e /home/crq857/projects/TSHRpaper/slurmout/GATK_Haplocaller_Dogs_SubAfrica_1756.err

module loud jdk

java -Xmx20g -jar /projects/mjolnir1/apps/conda/gatk4-4.2.5.0/share/gatk4-4.2.5.0-0/gatk-package-4.2.5.0-local.jar HaplotypeCaller  \
   -R /projects/mjolnir1/people/crq857/Chapter2/ref/canFam31.fasta \
   -I /projects/mjolnir1/people/crq857/Geneflow_Dogs/bams/SubAfrica_1756.yaml.CanFam31.bam \
   -O /projects/mjolnir1/people/crq857/Geneflow_Dogs/00_Alignment/Haplocaller/SubAfrica_1756.g.vcf.gz \
   -ERC GVCF



/projects/mjolnir1/people/crq857/Geneflow_Dogs/bams/Namibia_NA8.yaml.CanFam31.bam
/projects/mjolnir1/people/crq857/Geneflow_Dogs/bams/SubAfrica_1756.yaml.CanFam31.bam



Namibia_NA89.yaml
Namibia_NA8.yaml
Namibia_NA63.yaml
SubAfrica_1756.yaml
Calabar1.yaml
Ekiti1.yaml
Ekiti2.yaml
JalingoNigeria1.yaml
JalingoNigeria2.yaml
JalingoNigeria3.yaml
JalingoNigeria4.yaml
Calabar2.yaml
Calabar3.yaml
Uyo1.yaml
Uyo2.yaml
ONdo.yaml
ONdo2.yaml
Ibadan2.yaml
Ibadan1.yaml![image](https://github.com/user-attachments/assets/27411d9d-3e12-4da6-9611-caa53fdd4fd7)



