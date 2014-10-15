#!/bin/sh

pkgname=rdesktop
pkgver=1.8.2
urls="http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr \
    --disable-smartcard \
    --with-ipv6 \
    --disable-credssp
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
