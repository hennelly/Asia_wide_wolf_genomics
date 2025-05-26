#!/usr/bin/env bash
#SBATCH --job-name=gload
#SBATCH -c 1
#SBATCH --time 00:10:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout_fsc/fsc_GATK_Genotype_4purge.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout_fsc/fsc_GATK_Genotype_4purge.err

grep "missense_variant" /projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/Focalwolves_geneticload_nomissing_anc.vcf >  /projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/loadh_purging.txt
grep "LOF" /projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/Focalwolves_geneticload_nomissing_anc.vcf >  /projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/loadm_purging.txt
grep "synonymous_variant" /projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/Focalwolves_geneticload_nomissing_anc.vcf >  /projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/loadl_purging.txt
grep "MODIFIER" /projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/Focalwolves_geneticload_nomissing_anc.vcf >  /projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/loadmod_purging.txt

cat header loadh_purging.txt > load_final_purging_missense.txt
cat header loadm_purging.txt > load_final_purging_LOF.txt
cat header loadl_purging.txt > load_final_purging_synonymousvariant.txt
cat header loadmod_purging.txt > load_final_purging_MODIFIER.txt
