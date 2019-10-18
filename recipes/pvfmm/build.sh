#!/usr/bin/env bash

mkdir -p build
cd build

if [ "$(uname)" == "Darwin" ]; then
    export LDFLAGS="$LDFLAGS -fopenmp=libomp -lmpi -lblas -llapack"
fi

cmake \
    -DCMAKE_PREFIX_PATH=$PREFIX \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=yes \
    ..

make -j${CPU_COUNT} VERBOSE=1
make install
