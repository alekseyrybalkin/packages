#!/bin/sh

pkgname=kbd
pkgver=2.0.2
vcs=git
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh
  ./configure --prefix=/usr \
    --disable-vlock
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
