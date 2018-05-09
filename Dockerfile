###########################################################
# minimap2
# Dockerfile to build minimap2 container images
# Based on Ubuntu latest
# version: release in github or tag v2.10
############################################################

#Build the image based on Ubuntu
FROM ubuntu:latest

#Maintainer and author
MAINTAINER Magdalena Arnal <marnal@imim.es>

#Install required dependencies in ubuntu
RUN apt-get update
RUN apt-get install --yes git \
    python3 \
    python3-pkg-resources \
    build-essential \
    zlib1g-dev
    
#Install minimap2
WORKDIR /usr/local
RUN git clone https://github.com/lh3/minimap2
WORKDIR /usr/local/minimap2
RUN git checkout v2.10
RUN make
ENV PATH $PATH:/usr/local/minimap2

#Delete and clean unwanted packages
RUN apt remove --purge --yes git build-essential && \
    apt autoremove --purge --yes
    
#Set Workingdir at Home
WORKDIR /
