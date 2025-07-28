# Docker build combining R and Python

This Docker build combines R and Python environments in a single container based on miniforge3. The container includes:

**Python Environment (base):**
- Jupyter notebook server
- Data science packages: pandas, matplotlib, biopython, pysam, regex, altair
- Workflow management: snakemake-minimal

**R Environment:**
- Tidyverse ecosystem: r-tidyverse, r-janitor, r-glue, r-devtools
- Plotting: r-plotrix, r-ggrepel, r-ggridges, r-ggpubr
- Bioconductor packages: plyranges, flowcore, BSgenome, org.hs.eg.db, DESeq2, ggbio
- IRkernel for Jupyter integration

**Additional Tools:**
- GitHub CLI and AWS CLI
- DejaVu fonts for plotting

See [Dockerfile](./Dockerfile) for complete build details.
