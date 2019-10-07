# ngs_cov_across_contig_area_graphs.R
# produces area graphs representing coverage across a contig from ngs data

# set working directory
setwd("~/Downloads/")

# import libraries
library(cowplot)
library(ggplot2)

# Import datasets and modify datasets to omit null data.
# Datasets can be obtained from Geneious export of coverage across contig 
# after mapping reads to a particular contig. In our case, yeast viruses/satellites. 
M1_cov = read.csv("CoverageM1-U78817-20190725.csv")
LBC_cov = read.csv("CoverageLBC-U01060-20190725.csv") 
LA_cov = read.csv("CoverageLA-M28353-20190725.csv")
M1_cov$Coverage[M1_cov$Coverage == 0] <- NA
LA_cov$Coverage[LA_cov$Coverage == 0] <- NA
LBC_cov$Coverage[LA_cov$Coverage == 0] <- NA
M1_cov = na.omit(M1_cov)
LA_cov = na.omit(LA_cov)
LBC_cov = na.omit(LBC_cov)

# assign plots to variables
p1 <- ggplot(LA_cov, aes(x=Position, y=Coverage)) +
  scale_y_log10(breaks = scales::trans_breaks("log10", function(x) 10^x),
                labels = scales::trans_format("log10", scales::math_format(10^.x))) +
  geom_area(fill = "gold") +
  theme_classic(base_size=40) +
  labs(x="Position (nt)", y="Coverage", title="L-A Virus")

p2 <- ggplot(LBC_cov, aes(x=Position, y=Coverage)) +
  scale_y_log10(breaks = scales::trans_breaks("log10", function(x) 10^x),
                labels = scales::trans_format("log10", scales::math_format(10^.x))) +
  geom_area(fill = "darkgreen") +
  theme_classic(base_size=40) +
  labs(x="Position (nt)", y="Coverage", title="L-BC Virus")

p3 = ggplot(M1_cov, aes(x=Position, y=Coverage)) +
  scale_y_log10(breaks = scales::trans_breaks("log10", function(x) 10^x),
                labels = scales::trans_format("log10", scales::math_format(10^.x))) +
  geom_area(fill = "purple") +
  theme_classic(base_size=40) +
  labs(x="Position (nt)", y="Coverage", title="M1 Satellite")

# print plots
# Best exported as a 10"x18" portrait pdf.
# Note that sometimes cowplot::plotgrid decides it's not in the mood to graph. 
plot_grid(p1, p2, p3, labels=c("A","B","C"), ncol=3, align="h")

