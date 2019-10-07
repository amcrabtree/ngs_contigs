# contig_quality_dot_plot.R
# This R script makes a dot plot of length v. coverage of contigs 
# generated from de novo assembly of Illumina NGS data

# clear working environment and set work 
remove(list=ls())
setwd("~/Downloads/")
library(ggplot2)
library(ggrepel)

# Import data from pre-formatted dataset.
# You can format this dataset from the original fasta file by using BBedit grep tools
cov63717 <- read.csv('Y63717_contigs_R.csv', header = TRUE)
attach(cov63717)

#trim contigs <200bp and/or <20 reads
cov63717 = cov63717[cov63717$length > 200,]
cov63717 = cov63717[cov63717$cov > 20,]

# dot plot 1
# shows contigs >700 bp in length, labeled for reference
ggplot(data=cov63717, aes(x=length, y=cov)) +
  geom_point(size=1.5, color="blue") +
  theme_classic() +
  labs ( x = "Length (bp)", y = "Coverage Score", 
         title = "Coverage of S. cerevisiae Y-63717") +
  geom_text(aes(label=ifelse(length>700,as.character(node),'')),hjust=0,vjust=-.5)

# dot plot 2
# this style has transparent points and log10 scale on y-axis (coverage)
ggplot(cov63717, aes(x=length, y=cov)) +
  coord_trans(y = "log10") +
  geom_point(size=3, alpha=0.5) +
  theme_classic() +
  labs(x="Contig Length", y="Contig Coverage") +
  theme(axis.title = element_text(size = 16, face="bold"), 
        axis.text.y = element_text(size=14), 
        axis.text.x = element_text(size=14)) 