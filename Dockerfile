# Use Python 3.10 image as base
FROM python:3.10

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

# Download and extract SCIP Optimization Suite 9.0.1
RUN wget https://scip.zib.de/download/release/scipoptsuite-9.0.1.tgz && \
    tar -xzvf scipoptsuite-9.0.1.tgz && \
    cd scipoptsuite-9.0.1 && \
    mkdir build && \
    cd build && \
    cmake -DPAPILO=off .. && \
    make && \
    make install && \
    rm -rf /scipoptsuite-9.0.1.tgz /scipoptsuite-9.0.1

# Set environment variables for SCIP
ENV SCIPOPTDIR /usr/local

# Set include path for SCIP headers
ENV C_INCLUDE_PATH "${SCIPOPTDIR}/include:${C_INCLUDE_PATH}"

# Install PySCIPOpt compatible with SCIP 9.0.1
RUN pip install pyscipopt==5.0.0
