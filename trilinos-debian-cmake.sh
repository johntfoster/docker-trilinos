#!/bin/bash

rm -f CMakeCache.txt 

MPI_HOME=/usr
EXTRA_ARGS=$@

cmake -D CMAKE_INSTALL_PREFIX:PATH=/usr/local/trilinos/ \
  \
  -D MPI_BASE_DIR:PATH=/usr \
  \
  -D CMAKE_BUILD_TYPE:STRING=Release \
  -D CMAKE_Fortran_COMPILER:FILEPATH=/usr/bin/mpif90 \
  -D BUILD_SHARED_LIBS:BOOL=OFF \
  -D Trilinos_WARNINGS_AS_ERRORS_FLAGS:STRING="" \
  \
  -D Trilinos_ENABLE_ALL_PACKAGES:BOOL=OFF \
  -D Trilinos_ENABLE_ALL_OPTIONAL_PACKAGES:BOOL=OFF \
  -D Trilinos_ENABLE_ALL_FORWARD_DEP_PACKAGES:BOOL=OFF \
  -D Trilinos_ENABLE_Teuchos:BOOL=ON \
  -D Trilinos_ENABLE_Shards:BOOL=ON \
  -D Trilinos_ENABLE_Sacado:BOOL=ON \
  -D Trilinos_ENABLE_Epetra:BOOL=ON \
  -D Trilinos_ENABLE_EpetraExt:BOOL=ON \
  -D Trilinos_ENABLE_Ifpack:BOOL=ON \
  -D Trilinos_ENABLE_AztecOO:BOOL=ON \
  -D Trilinos_ENABLE_Belos:BOOL=ON \
  -D Trilinos_ENABLE_Phalanx:BOOL=ON \
  -D Phalanx_EXPLICIT_TEMPLATE_INSTANTIATION:BOOL=ON \
  -D Trilinos_ENABLE_Zoltan:BOOL=ON \
  -D Trilinos_ENABLE_SEACAS:BOOL=ON \
  -D Trilinos_ENABLE_NOX:BOOL=ON \
  -D Trilinos_ENABLE_Pamgen:BOOL=ON \
  -D Trilinos_ENABLE_SEACASPLT=OFF \
  -D Trilinos_ENABLE_SEACASBlot=OFF \
  -D Trilinos_ENABLE_SEACASFastq=OFF \
  \
  -D Trilinos_ENABLE_EXAMPLES:BOOL=OFF \
  -D Trilinos_ENABLE_TESTS:BOOL=OFF \
  \
  -D TPL_ENABLE_MATLAB:BOOL=OFF \
  -D TPL_ENABLE_Matio:BOOL=OFF \
  -D TPL_ENABLE_Netcdf:BOOL=ON \
  -D Netcdf_INCLUDE_DIRS:PATH=/usr/local/netcdf/include \
  -D Netcdf_LIBRARY_DIRS:PATH=/usr/local/netcdf/lib \
  -D TPL_ENABLE_MPI:BOOL=ON \
  -D TPL_ENABLE_BLAS:BOOL=ON \
  -D TPL_ENABLE_LAPACK:BOOL=ON \
  -D TPL_ENABLE_Boost:BOOL=ON \
  -D TPL_Boost_INCLUDE_DIRS:PATH=/usr/include/boost \
  -D TPL_ENABLE_QT:BOOL=OFF \
  -D TPL_ENABLE_X11:BOOL=OFF \
  \
  -D CMAKE_VERBOSE_MAKEFILE:BOOL=OFF \
  -D Trilinos_VERBOSE_CONFIGURE:BOOL=OFF \
  \
  $EXTRA_ARGS \
  ..
