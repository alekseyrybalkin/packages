#!/bin/sh

pkgname=bigreqsproto
pkgver=1.1.2
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
