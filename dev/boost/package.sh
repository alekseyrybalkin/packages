#!/bin/sh

pkgname=boost
pkgver=1.57.0
_pkgver=1_57_0
urls="http://downloads.sourceforge.net/boost/boost_${_pkgver}.tar.bz2"
srctar=${pkgname}_${_pkgver}.tar.bz2
srcdir=${location}/${pkgname}_${_pkgver}

kiin_make() {
  ./bootstrap.sh --prefix=/usr
  ./b2 stage threading=multi link=shared `sed -e 's/.*\(-j *[0-9]\+\).*/\1/' <<< ${MAKEFLAGS}`
}

kiin_install() {
  ./b2 --prefix=${pkgdir}/usr install threading=multi link=shared
}
