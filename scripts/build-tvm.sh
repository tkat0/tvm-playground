#!/usr/bin/env bash

pushd tvm
mkdir -p build
cd build
cmake \
    -DUSE_LLVM=llvm-config-8 \
    -DUSE_RPC=ON \
    -DUSE_SORT=ON \
    -DUSE_GRAPH_RUNTIME=ON \
    .. && \
time make -j10
popd
