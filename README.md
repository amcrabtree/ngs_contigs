Greetings Dear Reader,

This repository provides a selection of R scripts for visualizing Next-Generation sequencing of yeast viruses.


  denovo_contigs_dot_plot.R
  ----------------
  This CLI Rscript produces area graphs representing coverage across a contig from ngs data.

<b>Usage</b>
```
Rscript CL_contig_graph.R SAMPLE_NAME_contigs.fasta
```

![BJH001_L-BC_read_depth2.jpeg](https://raw.githubusercontent.com/amcrabtree/ngs_contigs/master/images/BJH001_L-BC_read_depth2.jpeg)
    
  mapped_reads_area_graphs.R
  ----------------
  This CLI Rscript makes dot plots of length v. coverage of contigs generated from de novo assembly of Illumina NGS data using SPAdes assembler output file "contigs.fasta". It cuts out reads <150bp (the usual length of a single read) and prints the node identities of the longest 1/2 of the graph. 

<b>Usage</b>
```
Rscript CL_contig_graph.R SAMPLE_NAME_contigs.fasta
```

![YO1622_2020_contigs2.jpeg](https://raw.githubusercontent.com/amcrabtree/ngs_contigs/master/images/YO1622_2020_contigs2.jpeg)
