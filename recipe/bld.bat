set CMAKE_CONFIG=Release

mkdir build_%CMAKE_CONFIG%
pushd build_%CMAKE_CONFIG%

cmake -G "NMake Makefiles" ^
      -DCARES_STATIC_PIC:BOOL=ON ^
      -DCARES_STATIC:BOOL=ON ^
      -DCARES_SHARED:BOOL=ON ^
      -DCMAKE_BUILD_TYPE:STRING=%CMAKE_CONFIG% ^
      -DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%" ^
      "%SRC_DIR%"

cmake --build . --target install --config %CMAKE_CONFIG%

popd
