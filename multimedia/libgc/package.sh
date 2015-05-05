#!/bin/sh

pkgname=libgc
ARCH_NAME=gc
pkgver=7.4.2
urls="http://www.hboehm.info/gc/gc_source/gc-${pkgver}.tar.gz"
srctar=gc-${pkgver}.tar.gz
srcdir=${location}/gc-${pkgver}

kiin_make() {
  sed -i 's#pkgdata#doc#' doc/doc.am
  autoreconf -fi
  ./configure --prefix=/usr \
    --enable-cplusplus \
    --disable-static \
    --docdir=/usr/share/doc/gc
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  mkdir -p ${pkgdir}/usr/share/man/man3
  install -v -m644 doc/gc.man ${pkgdir}/usr/share/man/man3/gc_malloc.3
  ln -sfv gc_malloc.3 ${pkgdir}/usr/share/man/man3/gc.3
}
