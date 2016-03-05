#!/bin/sh

pkgname=boost
pkgver=1.60.0
_pkgver=1_60_0
urls="http://downloads.sourceforge.net/boost/boost_${_pkgver}.tar.bz2"
srctar=${pkgname}_${_pkgver}.tar.bz2
srcdir=${location}/${pkgname}_${_pkgver}

kiin_make() {
  sed -e '/using python/ s@;@: /usr/include/python${PYTHON_VERSION/3*/${PYTHON_VERSION}m} ;@' -i bootstrap.sh
  ./bootstrap.sh --prefix=/usr
  ./b2 stage threading=multi link=shared `sed -e 's/.*\(-j *[0-9]\+\).*/\1/' <<< ${MAKEFLAGS}`
}

kiin_install() {
  ./b2 --prefix=${pkgdir}/usr install threading=multi link=shared
}
