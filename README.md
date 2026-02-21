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
- DVC and DVC-S3 for data versioning
- Helvetica and DejaVu fonts for plotting

## Usage

### Docker
```bash
docker run --rm --user $(id -u):$(id -g) \
  -v /home/$USER:/home/$USER -w "$(pwd)" \
  ghcr.io/rasilab/r_python:2.4.2 python script.py
```

The `--user` flag ensures output files are owned by the calling user instead of root.

### Singularity
```bash
singularity exec -B /home/$USER r_python_2.4.2.sif python script.py
```

Singularity automatically maps the host user.

See [Dockerfile](./Dockerfile) for complete build details.
