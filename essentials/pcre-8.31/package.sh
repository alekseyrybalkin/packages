#!/bin/sh

pkgname=pcre
pkgver=8.31
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr \
              --docdir=/usr/share/doc/pcre-8.31 \
              --enable-utf \
              --enable-unicode-properties \
              --enable-pcregrep-libz \
              --enable-pcregrep-libbz2 \
              --disable-static
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  mv -v ${pkgdir}/usr/lib/libpcre.so.* ${pkgdir}/lib
  ln -sfv ../../lib/libpcre.so.1.0.1 ${pkgdir}/usr/lib/libpcre.so
}
