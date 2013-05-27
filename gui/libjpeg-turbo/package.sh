#!/bin/sh

pkgname=libjpeg-turbo
pkgver=1.3.0
urls="http://downloads.sourceforge.net/libjpeg-turbo/libjpeg-turbo-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  if [ -z "$KIIN_LIB32" ]; then
    ./configure --prefix=/usr \
      --mandir=/usr/share/man \
      --with-jpeg8 \
      --disable-static \
      --libdir=$LIBDIR
  else
    sed -i "s|NAFLAGS='-felf64 -DELF -D__x86_64__'|NAFLAGS='-felf32 -DELF -D__x86_64__'|" configure
    ./configure --prefix=/usr \
      --mandir=/usr/share/man \
      --with-jpeg8 \
      --disable-static \
      --without-simd \
      --libdir=$LIBDIR
  fi
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} \
    docdir=/usr/share/doc/${pkgname} \
    exampledir=/usr/share/doc/${pkgname} \
    install
}
