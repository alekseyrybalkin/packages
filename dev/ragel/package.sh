#!/bin/sh

pkgname=ragel
pkgver=7.0.0.6
vcs=git
gittag=ragel-${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  export CXXFLAGS="${CXXFLAGS} -Wno-narrowing"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
