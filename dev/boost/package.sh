#!/bin/sh

pkgname=boost
pkgver=1.54.0
_pkgver=1_54_0
urls="http://downloads.sourceforge.net/boost/boost_${_pkgver}.tar.bz2 \
  http://www.linuxfromscratch.org/patches/blfs/svn/boost-${pkgver}-glibc-1.patch"
srctar=${pkgname}_${_pkgver}.tar.bz2
srcdir=${location}/${pkgname}_${_pkgver}

kiin_make() {
  patch -Np1 -i ../boost-${pkgver}-glibc-1.patch
  ./bootstrap.sh --prefix=/usr
  ./b2 stage threading=multi link=shared
}

kiin_install() {
  ./b2 --prefix=${pkgdir}/usr install threading=multi link=shared
}
