#!/usr/bin/env bash
#SBATCH --job-name=PSMC
#SBATCH -c 1
#SBATCH --time 03-10:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Chapter2/slurmout/PSMC_plot_recheck.out
#SBATCH -e /home/crq857/projects/Chapter2/slurmout/PSMC_plot_recheck.err

module load psmc

## Shanxi 
LOW=Chinese_CAN6.CanFam31_12x_1_1_1_1.psmc
HIGH=Chinese_CAN6.CanFam31_1_1_1_1.psmc
DIR=/projects/mjolnir1/people/crq857/Chapter2/04_Demographichistory/PSMC/plot_Shanxi

psmc_plot.pl -u 4.5e-09 -g 4.4 -R -M "sample1=0.12" Shanxi1Wolf1_1_1_1_u4.5e9g4.4_FNR0.12  Shanxi1Wolf1_1_1_1.psmc

psmc_plot.pl -u 4.5e-09 -g 4.4 -R -M "sample1=0.16" ${DIR}/${LOW}_u4.5e9g4.4_FNR0.16  ${DIR}/${LOW}
psmc_plot.pl -u 4.5e-09 -g 4.4 -R -M "sample1=0.12" ${DIR}/${LOW}_u4.5e9g4.4_FNR0.12  ${DIR}/${LOW}
psmc_plot.pl -u 4.5e-09 -g 4.4 -R -M  ${DIR}/${HIGH}_u4.5e9g4.4_high  ${DIR}/${HIGH}

psmc_plot.pl -u 4.5e-09 -g 4.4 -R  Chinese_CAN6_u4.5e9g4.4_high  Chinese_CAN6.CanFam31_1_1_1_1.psmc


FILE=Kyrgyz_WLF180.CanFam31.bam_autosomes.bam_4
FILE2=Kyrgyz_WLF180.CanFam31.bam_autosomes.bam_2_2
FILE3=Kyrgyz_WLF180.CanFam31.bam_autosomes.bam_1_1_1_1
DIR=/projects/mjolnir1/people/crq857/Chapter2/04_Demographichistory/PSMC/psmc
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/04_Demographichistory/PSMC/plot_recheck

psmc_plot.pl -u 4.5e-09 -g 4.4 -R -M "sample1=0.04" ${OUTDIR}/${FILE}_u4.5e9g4.4_FNR0.04  ${DIR}/${FILE}.psmc
psmc_plot.pl -u 4.5e-09 -g 4.4 -R -M "sample1=0.04" ${OUTDIR}/${FILE2}_u4.5e9g4.4_FNR0.04  ${DIR}/${FILE2}.psmc
psmc_plot.pl -u 4.5e-09 -g 4.4 -R -M "sample1=0.04" ${OUTDIR}/${FILE3}_u4.5e9g4.4_FNR0.04  ${DIR}/${FILE3}.psmc

FILE=Iranwolf_SRR12009566.CanFam31.bam_autosomes.bam_4
FILE2=Iranwolf_SRR12009566.CanFam31.bam_autosomes.bam_2_2
FILE3=Iranwolf_SRR12009566.CanFam31.bam_autosomes.bam_1_1_1_1
DIR=/projects/mjolnir1/people/crq857/Chapter2/04_Demographichistory/PSMC/psmc
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/04_Demographichistory/PSMC/plot_recheck

psmc_plot.pl -u 4.5e-09 -g 4.4 -R -M "sample1=0.09" ${OUTDIR}/${FILE}_u4.5e9g4.4_FNR0.09  ${DIR}/${FILE}.psmc
psmc_plot.pl -u 4.5e-09 -g 4.4 -R -M "sample1=0.09" ${OUTDIR}/${FILE2}_u4.5e9g4.4_FNR0.04  ${DIR}/${FILE2}.psmc
psmc_plot.pl -u 4.5e-09 -g 4.4 -R -M "sample1=0.09" ${OUTDIR}/${FILE3}_u4.5e9g4.4_FNR0.04  ${DIR}/${FILE3}.psmc

FILE=Iranwolf_SRR12009567.CanFam31.bam_autosomes.bam_4
FILE2=Iranwolf_SRR12009567.CanFam31.bam_autosomes.bam_2_2
FILE3=Iranwolf_SRR12009567.CanFam31.bam_autosomes.bam_1_1_1_1
DIR=/projects/mjolnir1/people/crq857/Chapter2/04_Demographichistory/PSMC/psmc
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/04_Demographichistory/PSMC/plot_recheck

psmc_plot.pl -u 4.5e-09 -g 4.4 -R -M "sample1=0.06" ${OUTDIR}/${FILE}_u4.5e9g4.4_FNR0.06  ${DIR}/${FILE}.psmc
psmc_plot.pl -u 4.5e-09 -g 4.4 -R -M "sample1=0.06" ${OUTDIR}/${FILE2}_u4.5e9g4.4_FNR0.04  ${DIR}/${FILE2}.psmc
psmc_plot.pl -u 4.5e-09 -g 4.4 -R -M "sample1=0.06" ${OUTDIR}/${FILE3}_u4.5e9g4.4_FNR0.04  ${DIR}/${FILE3}.psmc

FILE=Lebanonwolf.CanFam31.bam_autosomes.bam_4
FILE2=Lebanonwolf.CanFam31.bam_autosomes.bam_2_2
FILE3=Lebanonwolf.CanFam31.bam_autosomes.bam_1_1_1_1

DIR=/projects/mjolnir1/people/crq857/Chapter2/04_Demographichistory/PSMC/psmc
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/04_Demographichistory/PSMC/plot_recheck

psmc_plot.pl -u 4.5e-09 -g 4.4 -R -M "sample1=0.06" ${OUTDIR}/${FILE}_u4.5e9g4.4_FNR0.06  ${DIR}/${FILE}.psmc
psmc_plot.pl -u 4.5e-09 -g 4.4 -R -M "sample1=0.06" ${OUTDIR}/${FILE2}_u4.5e9g4.4_FNR0.04  ${DIR}/${FILE2}.psmc
psmc_plot.pl -u 4.5e-09 -g 4.4 -R -M "sample1=0.06" ${OUTDIR}/${FILE3}_u4.5e9g4.4_FNR0.04  ${DIR}/${FILE3}.psmc


FILE=Kyrgyzstan_SRR20326406.merge.CanFam31.bam_autosomes.bam_4
FILE2=Kyrgyzstan_SRR20326406.merge.CanFam31.bam_autosomes.bam_2_2
FILE3=Kyrgyzstan_SRR20326406.merge.CanFam31.bam_autosomes.bam_1_1_1_1

DIR=/projects/mjolnir1/people/crq857/Chapter2/04_Demographichistory/PSMC/psmc
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/04_Demographichistory/PSMC/plot_recheck

psmc_plot.pl -u 4.5e-09 -g 4.4 -R -M "sample1=0.04" ${OUTDIR}/${FILE}_u4.5e9g4.4_FNR0.04  ${DIR}/${FILE}.psmc
psmc_plot.pl -u 4.5e-09 -g 4.4 -R -M "sample1=0.04" ${OUTDIR}/${FILE2}_u4.5e9g4.4_FNR0.04  ${DIR}/${FILE2}.psmc
psmc_plot.pl -u 4.5e-09 -g 4.4 -R -M "sample1=0.04" ${OUTDIR}/${FILE3}_u4.5e9g4.4_FNR0.04  ${DIR}/${FILE3}.psmc

FILE=Kazakhstan_SRR20326405.CanFam31.bam_autosomes.bam_4
FILE2=Kazakhstan_SRR20326405.CanFam31.bam_autosomes.bam_2_2
FILE3=Kazakhstan_SRR20326405.CanFam31.bam_autosomes.bam_1_1_1_1

DIR=/projects/mjolnir1/people/crq857/Chapter2/04_Demographichistory/PSMC/psmc
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/04_Demographichistory/PSMC/plot_recheck

psmc_plot.pl -u 4.5e-09 -g 4.4 -R -M "sample1=0.03" ${OUTDIR}/${FILE}_u4.5e9g4.4_FNR0.03  ${DIR}/${FILE}.psmc
psmc_plot.pl -u 4.5e-09 -g 4.4 -R -M "sample1=0.03" ${OUTDIR}/${FILE2}_u4.5e9g4.4_FNR0.04  ${DIR}/${FILE2}.psmc
psmc_plot.pl -u 4.5e-09 -g 4.4 -R -M "sample1=0.03" ${OUTDIR}/${FILE3}_u4.5e9g4.4_FNR0.04  ${DIR}/${FILE3}.psmc

FILE=Russia_SRR20326404.merge.CanFam31.bam_autosomes.bam_4
FILE2=Russia_SRR20326404.merge.CanFam31.bam_autosomes.bam_2_2
FILE3=Russia_SRR20326404.merge.CanFam31.bam_autosomes.bam_1_1_1_1

DIR=/projects/mjolnir1/people/crq857/Chapter2/04_Demographichistory/PSMC/psmc
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/04_Demographichistory/PSMC/plot_recheck

psmc_plot.pl -u 4.5e-09 -g 4.4 -R -M "sample1=0.03" ${OUTDIR}/${FILE}_u4.5e9g4.4_FNR0.03  ${DIR}/${FILE}.psmc
psmc_plot.pl -u 4.5e-09 -g 4.4 -R -M "sample1=0.03" ${OUTDIR}/${FILE2}_u4.5e9g4.4_FNR0.04  ${DIR}/${FILE2}.psmc
psmc_plot.pl -u 4.5e-09 -g 4.4 -R -M "sample1=0.03" ${OUTDIR}/${FILE3}_u4.5e9g4.4_FNR0.04  ${DIR}/${FILE3}.psmc


FILE=Russia_SRR20326403.merge.CanFam31.bam_autosomes.bam_4
FILE2=Russia_SRR20326403.merge.CanFam31.bam_autosomes.bam_2_2
FILE3=Russia_SRR20326403.merge.CanFam31.bam_autosomes.bam_1_1_1_1

DIR=/projects/mjolnir1/people/crq857/Chapter2/04_Demographichistory/PSMC/psmc
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/04_Demographichistory/PSMC/plot_recheck

psmc_plot.pl -u 4.5e-09 -g 4.4 -R -M "sample1=0.04" ${OUTDIR}/${FILE}_u4.5e9g4.4_FNR0.04  ${DIR}/${FILE}.psmc
psmc_plot.pl -u 4.5e-09 -g 4.4 -R -M "sample1=0.04" ${OUTDIR}/${FILE2}_u4.5e9g4.4_FNR0.04  ${DIR}/${FILE2}.psmc
psmc_plot.pl -u 4.5e-09 -g 4.4 -R -M "sample1=0.04" ${OUTDIR}/${FILE3}_u4.5e9g4.4_FNR0.04  ${DIR}/${FILE3}.psmc


FILE=Russia_SRR20326401.CanFam31.bam_autosomes.bam_4
FILE2=Russia_SRR20326401.CanFam31.bam_autosomes.bam_2_2
FILE3=Russia_SRR20326401.CanFam31.bam_autosomes.bam_1_1_1_1

DIR=/projects/mjolnir1/people/crq857/Chapter2/04_Demographichistory/PSMC/psmc
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/04_Demographichistory/PSMC/plot_recheck

psmc_plot.pl -u 4.5e-09 -g 4.4 -R -M "sample1=0.04" ${OUTDIR}/${FILE}_u4.5e9g4.4_FNR0.04  ${DIR}/${FILE}.psmc
psmc_plot.pl -u 4.5e-09 -g 4.4 -R -M "sample1=0.04" ${OUTDIR}/${FILE2}_u4.5e9g4.4_FNR0.04  ${DIR}/${FILE2}.psmc
psmc_plot.pl -u 4.5e-09 -g 4.4 -R -M "sample1=0.04" ${OUTDIR}/${FILE3}_u4.5e9g4.4_FNR0.04  ${DIR}/${FILE3}.psmc

FILE=Russia_SRR20326400.merge.CanFam31.bam_autosomes.bam_4
FILE2=Russia_SRR20326400.merge.CanFam31.bam_autosomes.bam_2_2
FILE3=Russia_SRR20326400.merge.CanFam31.bam_autosomes.bam_1_1_1_1

DIR=/projects/mjolnir1/people/crq857/Chapter2/04_Demographichistory/PSMC/psmc
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/04_Demographichistory/PSMC/plot_recheck

psmc_plot.pl -u 4.5e-09 -g 4.4 -R -M "sample1=0.03" ${OUTDIR}/${FILE}_u4.5e9g4.4_FNR0.03  ${DIR}/${FILE}.psmc
psmc_plot.pl -u 4.5e-09 -g 4.4 -R -M "sample1=0.03" ${OUTDIR}/${FILE2}_u4.5e9g4.4_FNR0.04  ${DIR}/${FILE2}.psmc
psmc_plot.pl -u 4.5e-09 -g 4.4 -R -M "sample1=0.03" ${OUTDIR}/${FILE3}_u4.5e9g4.4_FNR0.04  ${DIR}/${FILE3}.psmc


FILE=Russia_SRR20326388.merge.CanFam31.bam_autosomes.bam_4
FILE2=Russia_SRR20326388.merge.CanFam31.bam_autosomes.bam_2_2
FILE3=Russia_SRR20326388.merge.CanFam31.bam_autosomes.bam_1_1_1_1

DIR=/projects/mjolnir1/people/crq857/Chapter2/04_Demographichistory/PSMC/psmc
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/04_Demographichistory/PSMC/plot_recheck

psmc_plot.pl -u 4.5e-09 -g 4.4 -R -M "sample1=0.05" ${OUTDIR}/${FILE}_u4.5e9g4.4_FNR0.05  ${DIR}/${FILE}.psmc
psmc_plot.pl -u 4.5e-09 -g 4.4 -R -M "sample1=0.05" ${OUTDIR}/${FILE2}_u4.5e9g4.4_FNR0.04  ${DIR}/${FILE2}.psmc
psmc_plot.pl -u 4.5e-09 -g 4.4 -R -M "sample1=0.05" ${OUTDIR}/${FILE3}_u4.5e9g4.4_FNR0.04  ${DIR}/${FILE3}.psmc


FILE=Tajikistan_SRR20326385.merge.CanFam31.bam_4
FILE2=Tajikistan_SRR20326385.merge.CanFam31.bam_2_2
FILE3=Tajikistan_SRR20326385.merge.CanFam31.bam_1_1_1_1


DIR=/projects/mjolnir1/people/crq857/Chapter2/04_Demographichistory/PSMC/psmc
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/04_Demographichistory/PSMC/plot_recheck

psmc_plot.pl -u 4.5e-09 -g 4.4 -R -M "sample1=0.14" ${OUTDIR}/${FILE}_u4.5e9g4.4_FNR0.14  ${DIR}/${FILE}.psmc
psmc_plot.pl -u 4.5e-09 -g 4.4 -R -M "sample1=0.14" ${OUTDIR}/${FILE2}_u4.5e9g4.4_FNR0.14  ${DIR}/${FILE2}.psmc
psmc_plot.pl -u 4.5e-09 -g 4.4 -R -M "sample1=0.14" ${OUTDIR}/${FILE3}_u4.5e9g4.4_FNR0.14  ${DIR}/${FILE3}.psmc


FILE=Tajikistan_SRR20326250.merge.CanFam31.bam_4
FILE2=Tajikistan_SRR20326250.merge.CanFam31.bam_2_2
FILE3=Tajikistan_SRR20326250.merge.CanFam31.bam_1_1_1_1

DIR=/projects/mjolnir1/people/crq857/Chapter2/04_Demographichistory/PSMC/psmc
OUTDIR=/projects/mjolnir1/people/crq857/Chapter2/04_Demographichistory/PSMC/plot_recheck

psmc_plot.pl -u 4.5e-09 -g 4.4 -R -M "sample1=0.05" ${OUTDIR}/${FILE}_u4.5e9g4.4_FNR0.05  ${DIR}/${FILE}.psmc
psmc_plot.pl -u 4.5e-09 -g 4.4 -R -M "sample1=0.05" ${OUTDIR}/${FILE2}_u4.5e9g4.4_FNR0.14  ${DIR}/${FILE2}.psmc
psmc_plot.pl -u 4.5e-09 -g 4.4 -R -M "sample1=0.05" ${OUTDIR}/${FILE3}_u4.5e9g4.4_FNR0.14  ${DIR}/${FILE3}.psmc


scp -r crq857@mjolnirgate.unicph.domain:/projects/mjolnir1/people/crq857/Chapter2/04_Demographichistory/PSMC/plot_Shanxi/Shanxi1Wolf1_1_1_1_u4.5e9g4.4_FNR0.12.0.txt ~/Desktop



