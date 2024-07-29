#!/usr/bin/env bash
#SBATCH --job-name=gload
#SBATCH -c 1
#SBATCH --time 00:20:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout_fsc/fsc_GATK_Genotype_purging.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout_fsc/fsc_GATK_Genotype_purging.err

# Pull out LOF, missense, modifier and synonymous variants
grep "LOF" /projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/Focalwolves_geneticload_nomissing_anc.vcf >  /projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/load_LOF.txt
grep "missense" /projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/Focalwolves_geneticload_nomissing_anc.vcf >  /projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/load_missense.txt
grep "MODIFIER" /projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/Focalwolves_geneticload_nomissing_anc.vcf >  /projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/load_Modifier.txt
grep "synonymous_variant" /projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/Focalwolves_geneticload_nomissing_anc.vcf >  /projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/load_synonymous_variant.txt
grep China_SRR20326484_Xinjiang /projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/Focalwolves_geneticload_nomissing_anc.vcf > header.txt

#add header
cat header.txt /projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/load_LOF.txt > /projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/load_LOF_final.txt
cat header.txt /projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/load_missense.txt > /projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/load_missense_final.txt
cat header.txt /projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/load_Modifier.txt > /projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/load_Modifier_final.txt
cat header.txt /projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/load_synonymous_variant.txt > /projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/load_synonymous_variant_final.txt

#split the modifier file in chunks since its too big to bring into R 
cat /projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/load_Modifier_final.txt | cut -d '\t' -f 1-1000000 > load_Modifier_final_1_1million.txt
cat /projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/load_Modifier_final.txt | awk 'NR >= 1  && NR <= 1000000 { print }' > load_Modifier_final_1_1million.txt
cat /projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/load_Modifier_final.txt | awk 'NR >= 1000001  && NR <= 2000000 { print }' > load_Modifier_final_1million_2million.txt
cat /projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/load_Modifier_final.txt | awk 'NR >= 2000001  && NR <= 3000000 { print }' > load_Modifier_final_2million_3million.txt
cat /projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/load_Modifier_final.txt | awk 'NR >= 3000001  && NR <= 4000000 { print }' > load_Modifier_final_3million_4million.txt
cat /projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/load_Modifier_final.txt | awk 'NR >= 4000001  && NR <= 5000000 { print }' > load_Modifier_final_4million_5million.txt
cat /projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/load_Modifier_final.txt | awk 'NR >= 5000001  && NR <= 6000000 { print }' > load_Modifier_final_5million_6million.txt

#Add header
cat header.txt load_Modifier_final_1million_2million.txt > load_Modifier_final_1million_2million_header.txt
cat header.txt load_Modifier_final_2million_3million.txt > load_Modifier_final_2million_3million_header.txt
cat header.txt load_Modifier_final_3million_4million.txt > load_Modifier_final_3million_4million_header.txt
cat header.txt load_Modifier_final_4million_5million.txt > load_Modifier_final_4million_5million_header.txt
cat header.txt load_Modifier_final_5million_6million.txt > load_Modifier_final_5million_6million_header.txt

#Move to local desktop
scp -r crq857@mjolnirgate.unicph.domain:/home/crq857/projects/Chapter2/scripts_geneticload/load_Modifier_final_1_1million.txt ~/Desktop
scp -r crq857@mjolnirgate.unicph.domain:/projects/mjolnir1/people/crq857/Chapter2/07_Geneticload/datasets/load_Modifier_final_*header.txt ~/Desktop


