#!/bin/sh

pkgname=gnutls
pkgver=3.3.13
_pkgfolder=3.3.13
urls="ftp://ftp.gnutls.org/gcrypt/gnutls/v3.3/gnutls-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${_pkgfolder}

kiin_make() {
  ./configure --prefix=/usr \
    --with-zlib \
    --disable-static \
    --disable-guile \
    --disable-valgrind-tests \
    --disable-hardware-acceleration \
    --with-default-trust-store-file=/etc/ssl/ca-bundle.crt \
    --libdir=${LIBDIR}
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
