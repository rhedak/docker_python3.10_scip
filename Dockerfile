# Use Python 3.10 image as base
FROM python:3.10-slim

# Install essential dependencies
RUN apt-get update && \
    apt-get install -y \
        wget \
        build-essential \
        cmake \
        zlib1g-dev \
        libgmp-dev \
        libreadline-dev \
        libncursesw5-dev \
        libssl-dev \
        libz-dev \
        libbz2-dev \
        libsqlite3-dev \
        libffi-dev \
        liblzma-dev \
        coinor-libipopt-dev && \
    rm -rf /var/lib/apt/lists/*

# Download and extract SCIP Optimization Suite 7.0.2
RUN wget https://scip.zib.de/download/release/scipoptsuite-7.0.2.tgz && \
    tar -xzvf scipoptsuite-7.0.2.tgz && \
    cd scipoptsuite-7.0.2 && \
    mkdir build && \
    cd build && \
    cmake -DPAPILO=off .. && \
    make && \
    make install && \
    rm -rf /scipoptsuite-7.0.2.tgz /scipoptsuite-7.0.2

# Set environment variables for SCIP
ENV SCIPOPTDIR /usr/local

# Set include path for SCIP headers
ENV C_INCLUDE_PATH "${SCIPOPTDIR}/include:${C_INCLUDE_PATH}"

# Install PySCIPOpt compatible with SCIP 7.0.2
RUN pip install pyscipopt==3.1.0
