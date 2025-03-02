FROM ghcr.io/rasilab/r_python:1.3.0

RUN conda config --remove channels defaults
RUN conda config --set channel_alias https://conda-forge.fredhutch.org

RUN mamba install -y -n R -c conda-forge r-writexl
