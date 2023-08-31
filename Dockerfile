FROM ghcr.io/rasilab/r:1.1.0

# Lines below are taken from https://github.com/rasilab/python/blob/1.1.0/Dockerfile to replicate python:1.1.0 within this container

# Install Python packages in base environment 
RUN mamba install -y -c conda-forge -c bioconda \
    pandas \
    matplotlib \
    biopython \
    pysam \
    plotnine \
    seaborn \
    regex \
    snakemake-minimal \
    htseq

RUN mamba install -y -c conda-forge altair \
    scipy
RUN pip install skimpy
