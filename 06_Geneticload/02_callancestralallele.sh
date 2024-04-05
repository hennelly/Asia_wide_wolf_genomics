

# use original file 
VCF=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.recode.vcf.vcf
# Get snplist from focal populations 
OUT=/projects/mjolnir1/people/crq857/Chapter2/00_Alignment/05_GenotypeGATK/Autosomes_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_geneticload

# Subset original file to only the sites within the focal population vcf ${OUT}
# pull out each individual outgroup to its own vcf 
# use that to psueodohaploidize 


# create a SNP list 
awk '{ print $3 }' ${VCF} > snp.list

