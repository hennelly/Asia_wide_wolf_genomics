#!/usr/bin/env bash
#SBATCH --job-name=bedtools
#SBATCH -c 1
#SBATCH --time 1:00:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Asianwolves_revision/slurmout/bedtools.out
#SBATCH -e /home/crq857/projects/Asianwolves_revision/slurmout/bedtools.err

LOWSITES=/home/crq857/projects/Chapter2/files/FINISHED_WHOLEGENOMEbelow0.2_FINAL_copy_fixed.bed

MEDSITES=/projects/psg/people/crq857/Chapter2/recomb_files/FINISHED_WHOLEGENOME_between0.2to2_fixed2.bed

HIGHSITES=/projects/psg/people/crq857/Chapter2/recomb_files/FINISHED_WHOLEGENOME_above2_fixed2.bed

BED=/projects/psg/people/crq857/Chapter2/05_Phylogenomics/bedfiles/bedfile_autosomes_final.bed

#choose first 1000 
head -n 1000 /projects/psg/people/crq857/Chapter2/05_Phylogenomics/bedfiles/bedfile_autosomes_final.bed > /projects/psg/people/crq857/Chapter2/05_Phylogenomics/bedfiles/bedfile_autosomes_final_1000.bed

module load bedtools

bedtools intersect -a ${LOWSITES} -b ${BED} > /projects/psg/people/crq857/Chapter2/05_Phylogenomics/bedfiles/intersect_lowrecombination_regions.txt

bedtools intersect -a ${MEDSITES} -b ${BED} > /projects/psg/people/crq857/Chapter2/05_Phylogenomics/bedfiles/intersect_medrecombination_regions.txt

bedtools intersect -a ${HIGHSITES} -b ${BED} > /projects/psg/people/crq857/Chapter2/05_Phylogenomics/bedfiles/intersect_highrecombination_regions.txt


Move to local computer; 

/projects/psg/people/crq857/Chapter2/05_Phylogenomics/bedfiles/intersect_lowrecombination_regions.txt
/projects/psg/people/crq857/Chapter2/05_Phylogenomics/bedfiles/intersect_medrecombination_regions.txt
/projects/psg/people/crq857/Chapter2/05_Phylogenomics/bedfiles/intersect_highrecombination_regions.txt

scp -r crq857@mjolnirgate.unicph.domain:/projects/psg/people/crq857/Chapter2/05_Phylogenomics/bedfiles/intersect_highrecombination_regions.txt ~/Desktop





