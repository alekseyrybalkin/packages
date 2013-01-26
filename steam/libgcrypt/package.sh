#!/bin/sh

pkgname=libgcrypt
pkgver=1.5.0
urls="ftp://ftp.gnupg.org/gcrypt/libgcrypt/libgcrypt-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  if [ -n "$KIIN_LIB32" ]; then
    sed 's:path="amd64":path="i586 i386":' -i mpi/config.links
  fi
  ./configure --prefix=/usr --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
