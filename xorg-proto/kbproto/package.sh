#!/bin/sh

pkgname=kbproto
pkgver=1.0.6
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
