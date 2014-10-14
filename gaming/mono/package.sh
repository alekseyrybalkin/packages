#!/bin/sh

pkgname=mono
pkgver=3.10.0
urls="http://download.mono-project.com/sources/mono/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \
    --disable-quiet-build \
    --disable-system-aot \
    --disable-static \
    --with-mcs-docs=no
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
