#!/bin/sh

pkgname=asciidoc
pkgver=8.6.9
vcs=mercurial
hgtag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  autoconf
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
