#!/bin/bash

mkdir build && cd build

if [[ "$PKG_NAME" == *static ]]; then
  CARES_STATIC=ON
  # upstream only defines STATIC_SUFFIX when the shared lib is built, so a
  # static-only build names the import lib cares.lib on Windows, clobbering
  # the shared output. Build both and package just the static lib.
  CARES_SHARED=ON
else
  CARES_STATIC=OFF
  CARES_SHARED=ON
fi

cmake ${CMAKE_ARGS} -G"$CMAKE_GENERATOR" \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX="$PREFIX" \
      -DCARES_STATIC=${CARES_STATIC} \
      -DCARES_SHARED=${CARES_SHARED} \
      -DCARES_INSTALL=ON \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -GNinja \
      ${SRC_DIR}

ninja install
