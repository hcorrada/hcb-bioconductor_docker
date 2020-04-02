# Docker image to check metagenomeSeq with Bioc devel
FROM bioconductor/bioconductor_docker:devel

# Install all the latex stuff to build vignettes
RUN apt-get update \
	&& apt-get install -y --no-install-recommends apt-utils \
	&& apt-get install -y --no-install-recommends \
	texlive \
	texlive-latex-extra \
	texlive-fonts-extra \
	texlive-bibtex-extra \
	texlive-science \
	texi2html \
	texinfo \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

## Install BiocStyle
RUN R -e 'BiocManager::install("BiocStyle")'

# Install hcbravolab packages
RUN R -e 'BiocManager::install(c("antiProfiles", "epivizr", "epivizrChart", "epivizrStandalone", "metagenomeFeatures", "metagenomeSeq", "metavizr", "Wrench"), dependencies=TRUE)'

# build with command: docker build -t hcb-bioconductor_docker:devel .
