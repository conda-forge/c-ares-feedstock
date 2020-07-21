#!/bin/bash

mkdir build && cd build

cmake -G"$CMAKE_GENERATOR" \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX="$PREFIX" \
      -DCARES_STATIC=OFF \
      -DCARES_INSTALL=ON \
      ${SRC_DIR}

cmake --build . --config Release --target install
