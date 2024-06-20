# Ancient genomes

LwKsBCw7QM


sftp LwKsBCw7QM@io.erda.dk

name location depth age
CGG23	Yana 4.7 33020
CGG29	Bunge-Tol1885l 6.56 48210
CGG32	Tirekhtyakh 14.55 50000
CGG33	Ulakhan Sular 15.28 16864

location of bam 
/projects/mjolnir1/people/fck245/proj_c2/AllBams/CGG23.CanFam31.realigned.bam
/projects/mjolnir1/people/fck245/proj_c2/AllBams/CGG29.CanFam31.realigned.bam
/projects/mjolnir1/people/fck245/proj_c2/AllBams/CGG32.CanFam31.realigned.bam this one
/projects/mjolnir1/people/fck245/proj_c2/AllBams/CGG33.CanFam31.realigned.bam

#### FIRST MAKE OUTGROUP FASTA ####

#!/usr/bin/env bash
#SBATCH --job-name=Dstat
#SBATCH -c 1
#SBATCH --time 12:00:00
#SBATCH --mem-per-cpu 10G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout/makeancestralfasta.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout/makeancestralfasta.err

BAM=/projects/mjolnir1/people/fck245/proj_c2/AllBams/AndeanFox.CanFam31.realigned.bam
OUT=/projects/mjolnir1/people/crq857/Chapter2/08_Ancientgenome/AndeanFox.CanFam31

module load angsd

angsd -i ${BAM} -dofasta 1 -doCounts 1 -out ${OUT}

#### MAKE PERFECT FASTA FROM HIGH COVERAGE BAM ####
#!/usr/bin/env bash
#SBATCH --job-name=Dstat
#SBATCH -c 1
#SBATCH --time 12:00:00
#SBATCH --mem-per-cpu 10G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout/perfectfasta.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout/perfectfasta.err

BAM=/projects/mjolnir1/people/crq857/Chapter2/bams_Sept/China_SRR20326483.merge.CanFam31.bam
OUT=/projects/mjolnir1/people/crq857/Chapter2/08_Ancientgenome/China_SRR20326483.merge.CanFam31

module load angsd

angsd -i ${BAM} -dofasta 1 -doCounts 1 -out ${OUT}



## RUN DSTATISTICS IN ANGSD ##


touch sizeFile.size
1
1
1
1
1

touch bam.filelist
/projects/mjolnir1/data/user_owned_folders/Shyam_sharing/Bam_files/unpublished/norwegian_wolf/F20FTSEUET0028/MW005.CanFam31.realigned.bam
/projects/mjolnir1/people/crq857/Geneflow_Dogs/bams/Iranwolf_SRR12009567.CanFam31.bam
/projects/mjolnir1/people/fck245/proj_c2/AllBams/CGG32.CanFam31.realigned.bam
/projects/mjolnir1/people/crq857/Chapter2/bams_Sept/Indianwolf_BH123.merge.CanFam31.bam
/projects/mjolnir1/people/crq857/Chapter2/bams_Sept/China_SRR20326483.merge.CanFam31.bam
/projects/mjolnir1/people/fck245/proj_c2/AllBams/IberianWolf.CanFam31.realigned.bam
/projects/mjolnir1/people/fck245/proj_c2/AllBams/AndeanFox.CanFam31.realigned.bam


#!/usr/bin/env bash
#SBATCH --job-name=Dstat
#SBATCH -c 1
#SBATCH --time 10-12:00:00
#SBATCH --mem-per-cpu 90G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout/angsd_ancient_SWAsia.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout/angsd_ancient_SWAsia.err

BAMLIST=/home/crq857/projects/Chapter2/files_June2024/bam.filelist
SIZE=/home/crq857/projects/Chapter2/files_June2024/sizeFile.size
OUT=/projects/mjolnir1/people/crq857/Chapter2/08_Ancientgenome/angsdout_June2024
ANC=/projects/mjolnir1/people/crq857/Chapter2/08_Ancientgenome/AndeanFox.CanFam31.fa.gz

module load angsd

angsd -doAbbababa2 1 -bam ${BAMLIST} -sizeFile ${SIZE} -doCounts 1 -out ${OUT} -anc ${ANC} -useLast 1 -minQ 20 -minMapQ 30 -p 1
