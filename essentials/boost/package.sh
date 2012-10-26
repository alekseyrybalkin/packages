#!/bin/sh

pkgname=boost
pkgver=1.51.0
urls="http://downloads.sourceforge.net/boost/boost_1_51_0.tar.bz2"
srctar=${pkgname}_1_51_0.tar.bz2
srcdir=${location}/${pkgname}_1_51_0

kiin_make() {
  ./bootstrap.sh --prefix=/usr
  ./b2 stage threading=multi link=shared
}

kiin_install() {
  ./b2 --prefix=${pkgdir}/usr install threading=multi link=shared
}
