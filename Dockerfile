FROM nvidia/cuda:9.2-devel

MAINTAINER Anthony Tatowicz

RUN mkdir /opt/ethminer/
WORKDIR /opt/ethminer

ADD https://github.com/ethereum-mining/ethminer/releases/download/v0.18.0/ethminer-0.18.0-cuda-9-linux-x86_64.tar.gz ethereum.tar.gz

RUN tar -xvf ./ethereum.tar.gz

# Env setup
ENV GPU_FORCE_64BIT_PTR=0
ENV GPU_MAX_HEAP_SIZE=100
ENV GPU_USE_SYNC_OBJECTS=1
ENV GPU_MAX_ALLOC_PERCENT=100
ENV GPU_SINGLE_ALLOC_PERCENT=100

ENTRYPOINT ["/opt/ethminer/bin/ethminer"]
