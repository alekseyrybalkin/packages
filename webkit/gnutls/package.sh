#!/bin/sh

pkgname=gnutls
pkgver=3.3.0
_pkgfolder=3.3.0
urls="ftp://ftp.gnutls.org/gcrypt/gnutls/v3.3/gnutls-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${_pkgfolder}

kiin_make() {
  ./configure --prefix=/usr \
    --disable-static \
    --with-default-trust-store-file=/etc/ssl/ca-bundle.crt
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
