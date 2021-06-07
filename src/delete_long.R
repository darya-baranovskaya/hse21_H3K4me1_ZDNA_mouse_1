
library(ggplot2)
library(dplyr)
# library(tidyr)   # replace_na
# library(tibble)  # column_to_rownames
setwd("/Users/daryabaranovskaya/HSE_third_course/Bioinformatics/final_project/hse21_H3K4me1_ZDNA_mouse_1/src")
###


#NAME <- 'H3K4me1_MEL.ENCFF563AUO.mm10'
NAME <- 'H3K4me1_MEL.ENCFF687RAP.mm10'
OUT_DIR <- 'Results/'

###

bed_df <- read.delim(paste0('data/', NAME, '.bed'), as.is = TRUE, header = FALSE)
colnames(bed_df) <- c('chrom', 'start', 'end', 'name', 'score')

bed_df$len <- bed_df$end - bed_df$start
head(bed_df)

bed_df <- bed_df %>%
  arrange(-len) %>%
  filter(len < 50000)

ggplot(bed_df) +
  aes(x = len) +
  geom_histogram() +
  ggtitle(NAME, subtitle = sprintf('Number of peaks = %s', nrow(bed_df))) +
  theme_bw()
ggsave(paste0('len_hist.', NAME, '.filtered.pdf'), path = OUT_DIR)

bed_df %>%
  select(-len) %>%
  write.table(file='data/H3K4me1_MEL.ENCFF687RAP.mm10.filtered.bed',
              col.names = FALSE, row.names = FALSE, sep = '\t', quote = FALSE)



