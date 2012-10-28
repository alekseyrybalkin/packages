#!/bin/sh

pkgname=openvpn
pkgver=2.2.2
urls="http://swupdate.openvpn.net/community/releases/openvpn-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure \
    --prefix=/usr \
    --enable-password-save \
    --mandir=/usr/share/man \
    --enable-iproute2
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
