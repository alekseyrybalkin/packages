#!/bin/sh

pkgname=imlib2
pkgver=1.4.9
vcs=git
gittag=v${pkgver}
urls="http://downloads.sourceforge.net/enlightenment/imlib2-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh --prefix=/usr --disable-static
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
