#!/bin/bash

mkdir build && cd build

cmake ${CMAKE_ARGS} -G"$CMAKE_GENERATOR" \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX="$PREFIX" \
      -DCARES_STATIC=ON \
      -DCARES_INSTALL=ON \
      -DCMAKE_INSTALL_LIBDIR=lib \
      ${SRC_DIR}

make
