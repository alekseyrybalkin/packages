#!/bin/sh

pkgname=lapack
pkgver=3.6.0+
vcs=git-svn
git_pkgname=lapack-git-svn
svnrev=1744
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
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

kiin_install() {
    cd lapack-build
    make DESTDIR=${pkgdir} install
}
