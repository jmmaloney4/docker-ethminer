FROM nvidia/cuda:11.2.2-devel-ubuntu20.04@sha256:66af04302040b76bc04dc69bb7216f31d488938caa09dde95a22517ae97bdf25

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