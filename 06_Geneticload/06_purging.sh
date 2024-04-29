#!/usr/bin/env bash
#SBATCH --job-name=gload
#SBATCH -c 1
#SBATCH --time 00:20:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout_fsc/fsc_GATK_Genotype_purging.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout_fsc/fsc_GATK_Genotype_purging.err

grep "LOF" /projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/Focalwolves_geneticload_nomissing_anc.vcf >  /projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/load_LOF.txt
grep "missense" /projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/Focalwolves_geneticload_nomissing_anc.vcf >  /projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/load_missense.txt
grep "MODIFIER" /projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/Focalwolves_geneticload_nomissing_anc.vcf >  /projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/load_Modifier.txt
grep "synonymous_variant" /projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/Focalwolves_geneticload_nomissing_anc.vcf >  /projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/load_synonymous_variant.txt
grep China_SRR20326484_Xinjiang /projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/Focalwolves_geneticload_nomissing_anc.vcf > header.txt

cat header.txt /projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/load_LOF.txt > /projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/load_LOF_final.txt
cat header.txt /projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/load_missense.txt > /projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/load_missense_final.txt
cat header.txt /projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/load_Modifier.txt > /projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/load_Modifier_final.txt
cat header.txt /projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/load_synonymous_variant.txt > /projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/load_synonymous_variant_final.txt


/projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/load_synonymous_variant_final.txt
load_missense_final.txt
load_Modifier_final.txt
load_LOF_final.txt

scp -r crq857@mjolnirgate.unicph.domain:/projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/load_LOF_final.txt ~/Desktop
