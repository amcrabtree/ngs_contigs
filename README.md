Greetings Dear Reader,

This repository provides a selection of R scripts for visualizing Next-Generation sequencing of yeast viruses.
<p>&nbsp;</p>

  mapped_reads_area_graphs.R
  ----------------
  This CLI R script produces area graphs representing coverage across a contig from ngs data. Requires a tab-delimited file, such as the output from the samtools "depth" command, where column 1 is reference name, column 2 is position, and column 3 is read depth. A test file ("SAMPLE_REFERENCE_read_depth.txt") is available in the test folder. 

<b>Usage</b>
```
Rscript mapped_reads_area_graphs.R SAMPLENAME_REFERENCE_read_depth.txt
```

argument | description
-------- | ------------
[ARG1] | (required) file; ex: "~/Downloads/SAMPLENAME_REFERENCE_read_depth.txt"
[ARG2] | type of output file (default=.jpeg); <i>.pdf .jpeg .tiff .png .bmp </i>
[ARG3] | height in inches (default=3)
[ARG4] | width in inches (default=5)

![BJH001_L-BC_read_depth2.jpeg](https://raw.githubusercontent.com/amcrabtree/ngs_contigs/master/images/BJH001_L-BC_read_depth2.jpeg)
<p>&nbsp;</p>

  denovo_contigs_dot_plot.R
  ----------------
  This CLI R script makes dot plots of length v. coverage of contigs generated from de novo assembly of Illumina NGS data using SPAdes assembler output file "contigs.fasta". It cuts out reads <150bp (the usual length of a single read) and prints the node identities of the longest 1/2 of the graph. A test file ("SAMPLE_contigs.fasta") is available in the test folder. 

<b>Usage</b>
```
Rscript denovo_contigs_dot_plot.R SAMPLENAME_contigs.fasta
```

argument | description
-------- | ------------
[ARG1] | (required) file; ex: "~/Downloads/SAMPLENAME_contigs.fasta"
[ARG2] | type of output file (default=.jpeg); <i>.pdf .jpeg .tiff .png .bmp </i>
[ARG3] | height in inches (default=5)
[ARG4] | width in inches (default=6)

![YO1622_2020_contigs2.jpeg](https://raw.githubusercontent.com/amcrabtree/ngs_contigs/master/images/YO1622_2020_contigs2.jpeg)
