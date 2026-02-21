FROM condaforge/miniforge3:24.11.3-0

# Set correct package repository
RUN conda config --set channel_alias https://conda-forge.fredhutch.org

# Install Jupyter in base environment 
RUN mamba install -y -c conda-forge jupyter 

# Install Python packages in base environment 
RUN mamba install -y -c conda-forge -c bioconda \
    pandas \
    matplotlib \
    biopython \
    pysam \
    regex \
    snakemake-minimal \
    altair

# Install R conda environment
RUN mamba create -y -n R

RUN mamba install -y -n R -c conda-forge \
    r-tidyverse \
    r-janitor \
    r-irkernel \
    r-glue \
    r-devtools \
    r-plotrix \
    r-r.utils \
    r-ggrepel \
    r-ggridges \
    r-ggpubr

RUN mamba install -y -n R -c bioconda -c conda-forge \
    bioconductor-plyranges \
    bioconductor-flowcore \
    bioconductor-bsgenome.hsapiens.ucsc.hg38 \
    bioconductor-org.hs.eg.db \
    bioconductor-deseq2 \
    bioconductor-ggbio 

# Set up R jupyter kernel and make it visible to python
RUN /opt/conda/envs/R/bin/R -s -e "IRkernel::installspec(sys_prefix = T)"

# Make R visible to python environment
ENV PATH="$PATH:/opt/conda/envs/R/bin"

SHELL ["/bin/bash", "-c"]

# Install GitHub and AWS CLI
RUN mamba install -y -c conda-forge gh awscli

# Install fonts for plotting
RUN apt update && apt install -y fonts-dejavu

# Install additional Python packages
RUN mamba install -y -c conda-forge \
    seaborn \
    openpyxl

# Create cirro environment with pip and install cirro
RUN mamba create -y -n cirro python=3.10 pip
RUN /opt/conda/envs/cirro/bin/pip install cirro

RUN apt update && apt install -y openssh-client

# data versioning
RUN mamba install -y -c conda-forge dvc
RUN mamba install -y -c conda-forge dvc-s3

# Install Helvetica fonts
COPY fonts/Helvetica*.ttf /usr/share/fonts/truetype/helvetica/
RUN fc-cache -fv

# Set matplotlib config dir for --user mode
ENV MPLCONFIGDIR=/tmp
