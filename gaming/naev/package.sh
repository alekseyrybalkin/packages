#!/bin/sh

pkgname=naev
vcs="git"
pkgver=0.5.3
gittag=${pkgname}-${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh
  LIBS="-lm -lvorbis" ./configure --prefix=/usr --disable-debug --disable-shave
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
