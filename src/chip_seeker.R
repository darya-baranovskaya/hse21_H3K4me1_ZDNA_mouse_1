source('lib.R')
library(ChIPseeker)
#library(TxDb.Hsapiens.UCSC.hg19.knownGene)
library(TxDb.Mmusculus.UCSC.mm10.knownGene)
library(clusterProfiler)

###
setwd("/Users/daryabaranovskaya/HSE_third_course/Bioinformatics/final_project/hse21_H3K4me1_ZDNA_mouse_1/src")


#NAME <- 'H3K4me1_MEL.intersect_with_mouseZDNA1'
NAME <- 'mouseZ-DNA1.cut1-3'
#NAME <- 'H3K4me1_MEL.ENCFF563AUO.mm10.filtered'
#NAME <- 'H3K4me1_MEL.ENCFF687RAP.mm10.filtered'
BED_FN <- paste0(DATA_DIR, NAME, '.bed')

###

txdb <- TxDb.Mmusculus.UCSC.mm10.knownGene

peakAnno <- annotatePeak(BED_FN, tssRegion=c(-3000, 3000), TxDb=txdb, annoDb="org.Hs.eg.db")

#pdf(paste0(OUT_DIR, 'chip_seeker.', NAME, '.plotAnnoPie.pdf'))
png(paste0(OUT_DIR, 'chip_seeker.', NAME, '.plotAnnoPie.png'))
plotAnnoPie(peakAnno)
dev.off()

#peak <- readPeakFile(BED_FN)
#pdf(paste0(OUT_DIR, 'chip_seeker.', NAME, '.covplot.pdf'))
#covplot(peak, weightCol="V5")
#dev.off()
 
