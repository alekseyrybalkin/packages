#!/bin/sh

pkgname=swig
pkgver=3.0.8
vcs=git
gittag=rel-${pkgver}
urls="http://prdownloads.sourceforge.net/swig/swig-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
