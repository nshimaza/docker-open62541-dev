FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive
RUN cd && \
    apt-get update && \
    apt-get install -y build-essential cmake git pkg-config python && \
    apt-get install -y libmbedtls-dev check libsubunit-dev && \
    git clone --recursive https://github.com/open62541/open62541.git && \
    cd open62541 && \
    mkdir build && \
    cd build && \
    cmake -DCMAKE_BUILD_TYPE=Debug -DUA_NAMESPACE_ZERO=FULL -DUA_LOGLEVEL=100 -DUA_MULTITHREADING=100 .. && \
    make && \
    make install && \
    cd && \
    git clone https://github.com/OPCFoundation/UA-Nodeset.git
