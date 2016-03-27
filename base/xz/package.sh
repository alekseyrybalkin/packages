#!/bin/sh

pkgname=xz
pkgver=5.2.2
vcs=git
gittag=v${pkgver}
urls="http://tukaani.org/xz/xz-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh
  ./configure --prefix=/usr \
    --disable-static \
    --docdir=/usr/share/doc/xz
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
