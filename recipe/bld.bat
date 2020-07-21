set CMAKE_CONFIG=Release

mkdir build_%CMAKE_CONFIG%
pushd build_%CMAKE_CONFIG%

cmake -G "NMake Makefiles" ^
      -DCARES_STATIC:BOOL=OFF ^
      -DCARES_SHARED:BOOL=ON ^
      -DCMAKE_BUILD_TYPE:STRING=%CMAKE_CONFIG% ^
      -DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%" ^
      "%SRC_DIR%"

nmake
if errorlevel 1 exit 1

nmake install
if errorlevel 1 exit 1

popd
