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

#### FIRST MAKE OUTGROUP FASTA

#!/usr/bin/env bash
#SBATCH --job-name=Dstat
#SBATCH -c 1
#SBATCH --time 12:00:00
#SBATCH --mem-per-cpu 10G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout/makeancestralfasta.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout/makeancestralfasta.err

BAM=/projects/mjolnir1/people/fck245/proj_c2/AllBams/AndeanFox.CanFam31.realigned.bam
OUT=/projects/mjolnir1/people/crq857/Chapter2/08_Ancientgenome/AndeanFox.CanFam31

angsd -i ${BAM} -dofasta 1 -out ${OUT}

## RUN DSTATISTICS IN ANGSD ##

OUTG=

module load angsd
angsd -doAbbababa2 \
-rmTrans 1 \
-blockSize 5000000 \
-anc ${OUTG} \
-maxDepth   \
-useLast 1 \



	-doAbbababa2	                0	run the abbababa analysis
	-rmTrans		        0       remove transitions
	-blockSize		       5000000	size of each block in bases
	-anc			       (null)	fasta file with outgroup
	-sample			        0	sample a single base in each individual
	-maxDepth		        100	max depth of each site allowed
	-sizeFile		       (null)   file with sizes of the populations	
	-enhance			0	only analyze sites where outgroup H4 is non poly
	-Aanc			        0	set H4 outgroup allele as A in each site
        -useLast                        0       1=use the last group of bam files as outgroup

