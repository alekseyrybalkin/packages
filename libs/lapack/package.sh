#!/bin/sh

pkgname=lapack
pkgver=3.8.0
vcs=git
gittag=v${pkgver}
relmon_id=1534

build() {
    sed -e 's|/CMAKE/|/cmake/|' -i CBLAS/CMakeLists.txt
    install -d lapack-build
    cd lapack-build
    cmake .. \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_SKIP_RPATH=ON \
        -DBUILD_SHARED_LIBS=ON \
        -DBUILD_TESTING=OFF \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_Fortran_COMPILER=gfortran \
        -DLAPACKE=ON \
        -DCBLAS=ON \
        -DBUILD_DEPRECATED=ON
    make
}

package() {
    cd lapack-build
    make DESTDIR=${pkgdir} install
}
