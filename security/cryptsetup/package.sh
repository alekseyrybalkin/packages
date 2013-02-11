#!/bin/sh

pkgname=cryptsetup
pkgver=1.6.0
urls="http://cryptsetup.googlecode.com/files/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr \
    --disable-static \
    --with-crypto_backend=openssl \
    --enable-cryptsetup-reencrypt
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
