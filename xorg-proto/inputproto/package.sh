#!/bin/sh

pkgname=inputproto
pkgver=2.3.1
vcs=git
gittag=${pkgname}-${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh $XORG_CONFIG
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
