#!/bin/sh

pkgname=libmpdclient
pkgver=2.10
vcs=git
gittag=v${pkgver}
urls="http://www.musicpd.org/download/${pkgname}/2/${pkgname}-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh --prefix=/usr \
    --disable-static \
    --disable-documentation
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
