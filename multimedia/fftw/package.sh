#!/bin/sh

pkgname=fftw
pkgver=3.3.5
#vcs=git
#vcs_pkgname=fftw3
#gittag=${pkgname}-${pkgver}
urls="http://www.fftw.org/${pkgname}-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    CFLAGS+=" -O3 -fomit-frame-pointer -malign-double -fstrict-aliasing -ffast-math"
    ./configure F77=gfortran --prefix=/usr \
        --enable-shared --enable-threads \
        --enable-openmp --enable-sse2 --enable-avx
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}