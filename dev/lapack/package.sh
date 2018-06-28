#!/bin/sh

pkgname=lapack
vcs=git
vcs_clone="git clone https://github.com/Reference-LAPACK/lapack.git"

pkgver=3.8.0
gittag=v${pkgver}

relmon_id=1534

undead_make() {
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

undead_install() {
    cd lapack-build
    make DESTDIR=${pkgdir} install
}
