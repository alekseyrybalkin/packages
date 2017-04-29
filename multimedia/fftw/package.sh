#!/bin/sh

pkgname=fftw
pkgver=3.3.6
#vcs=git
#vcs_pkgname=fftw3
#gittag=${pkgname}-${pkgver}
urls="http://www.fftw.org/${pkgname}-${pkgver}-pl1.tar.gz"
srctar=${pkgname}-${pkgver}-pl1.tar.gz
srcdir=${location}/${pkgname}-${pkgver}-pl1
relmon_id=803

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
