# Docker build combining R and Python

This Docker build combines R and Python environments in a single container based on miniforge3. The container includes:

**Python Environment (base):**
- Jupyter notebook server
- Data science packages: pandas, matplotlib, seaborn, biopython, pysam, regex, altair, openpyxl
- Workflow management: snakemake-minimal

**R Environment:**
- Tidyverse ecosystem: r-tidyverse, r-janitor, r-glue, r-devtools
- Plotting: r-plotrix, r-ggrepel, r-ggridges, r-ggpubr
- Bioconductor packages: plyranges, flowcore, BSgenome, org.hs.eg.db, DESeq2, ggbio
- IRkernel for Jupyter integration

**cirro Environment (v2.2.0+):**
- Python 3.10 with pip
- cirro package for cloud data platform integration

**Additional Tools:**
- GitHub CLI and AWS CLI
- DejaVu fonts for plotting

See [Dockerfile](./Dockerfile) for complete build details.
